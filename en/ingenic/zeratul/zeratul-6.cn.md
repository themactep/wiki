君正Zeratul开发(6)——为什么禁止使用system_system函数禁用的原因
------------------------------------------------------

### (一)前言

在君正Zeratul_T31_开发指南中明确规范，禁止在主程序中使用system 等系统调用接口函数，需要在另外的一个守护进程中去实现system函数的功能。这里有两个问题：1.system函数有哪些不安全的地方？ 2.为什么不可以在主进程中去执行system，而在守护进程中却可以？

### (二)为什么危险

system 源码实现
```
int system(const char * cmdstring)
{
    pid_t pid;
    int status;

if(cmdstring == NULL)
{
    return (1); //如果cmdstring为空，返回非零值，一般为1
}

if((pid = fork())<0)
{
    status = -1; //fork失败，返回-1
}
else if(pid == 0)
{
    execl("/bin/sh", "sh", "-c", cmdstring, (char *)0);
    _exit(127); // exec执行失败返回127，注意exec只在失败时才返回现在的进程，成功的话现在的进程就不存在啦~~
}
else //父进程
{
    while(waitpid(pid, &status, 0) < 0)
    {
        if(errno != EINTR)
        {
            status = -1; //如果waitpid被信号中断，则返回-1
            break;
        }
    }
}
    return status; //如果waitpid成功，则返回子进程的返回状态
}
```

#### (1)实现

实际上system()函数执行了三步操作:
1. fork一个子进程；
2. 在子进程中调用exec函数去执行command；
3. 在父进程中调用wait去等待子进程结束。

#### (2)执行:

> system() executes a command specified in command by calling /bin/sh -c command, and returns after the command has been completed. During execution of the command, SIGCHLD will be blocked, and SIGINT and SIGQUIT will be ignored.

__system()函数调用/bin/sh来执行参数指定的命令__，/bin/sh 一般是一个软连接，指向某个具体的shell，比如bash，-c选项是告诉shell从字符串command中读取命令；
在该command执行期间，SIGCHLD是被阻塞的，好比在说：hi，内核，这会不要给我送SIGCHLD信号，等我忙完再说；

在该command执行期间，SIGINT和SIGQUIT是被忽略的，意思是进程收到这两个信号后没有任何动作。

#### (3)返回值：

> The value returned is -1 on error (e.g. fork(2) failed), and the return status of the command otherwise. This latter return status is in the format specified in wait(2). Thus, the exit code of the command will be WEXITSTATUS(status). In case /bin/sh could not be executed, the exit status will be that of a command that does exit(127).If the value of command is NULL, system() returns nonzero if the shell is available, and zero if not.

对于fork失败，system()函数返回-1。

如果exec执行成功，也即command顺利执行完毕，则返回command通过exit或return返回的值。（注意，command顺利执行不代表执行成功，比如command：“rm debuglog.txt”，不管文件存不存在该command都顺利执行了）

如果exec执行失败，也即command没有顺利执行，比如被信号中断，或者command命令根本不存在，system()函数返回127.

如果command为NULL，则system()函数返回非0值，一般为1.

#### (4)危险的原因

__system()函数用起来很容易出错，返回值太多，而且返回值很容易跟command的返回值混淆。__ 这里推荐使用popen()函数替代

popen()函数较于system()函数的优势在于使用简单，popen()函数只返回两个值：成功返回子进程的status，使用WIFEXITED相关宏就可以取得command的返回结果；失败返回-1，我们可以使用perro()函数或strerror()函数得到有用的错误信息。

### (三)为什么不建议在主进程中执行

为什么不可以在主进程中去执行system，而在守护进程中却可以？

__主要是因为主进程的堆栈空间一般是比较大的，执行system 函数会调用fork 创建一个子进程，子进程是拷贝的主进程的内存空间，但需要实际写入数据的时候就会进行实际的内存地址拷贝，在嵌入式设备中，内存有限，当内存不够的时候，程序执行会变慢，并且容易出错。__

__关于fork函数的作用，《Linux程序设计》中是这样解释的：__

我们可以通过调用fork创建一个新进程。这个系统调用复制当前进程，在进程表中新建一个新的表项，新表项中的许多属性与当前进程是相同的。新进程几乎与元进程一模一样，执行的代码也完全相同，但是新进程有自己的数据空间、环境和文件描述符。

这个解释其实过于笼统，很多细节问题都没有说。下面就简单说一下调用fork时发生的一些细节问题。或者叫fork函数的特点：

首先，现在的UNIX系统和Linux系统都采用写时复制技术（COW：Copy On Write）。使用这种技术，当调用fork函数时，新的进程只是拥有自己的虚拟内存空间，而没有自己的物理内存空间。新进程共享源进程的物理内存空间。而且新内存的虚拟内存空间几乎就是源进程虚拟内存空间的一个复制。

我们知道，进程空间可以简单地分为程序段（正文段）、数据段、堆和栈四部分（简单这样理解）。采用写时复制的fork函数，当执行完fork后的一定时间内，新的进程（子进程）和源进程的进程空间关系如下图：

![在这里插入图片描述](image7.png)

如上图，fork执行时，Linux内核会为新的进程P2创建一个虚拟内存空间，而新的虚拟空间中的内容是对P1虚拟内存空间中的内容的一个拷贝。而P2和P1共享原来P1的物理内存空间。

当然要理解“写时复制”中，上图中所展示的状态是会发生变化的。什么时候回发生变化呢？就是，父子两个进程中任意一个进程对数据段、栈区、堆区进行写操作时，上图中的状态就会被打破，这个时候就会发生物理内存的复制，这也就是叫“写时复制”的原因。发生的状态转变如下：

![在这里插入图片描述](image8.png)

我们发现，P2有了属于自己的物理内存空间。值得注意的是，各个段之间发生的变化应当是独立的，也就是说，如果只有数据段发生了写操作那么就只有数据段进行写时复制。而堆、栈区域依然是父子进程共享。还有一个需要注意的是，正文段（程序段）不会发生写时复制，这是因为通常情况下程序段是只读的。子进程和父进程从fork之后，基本上就是独立运行，互不影响了。

此外需要特别注意的是，父子进程的文件描述符表也会发生写时复制。

### 引用：

- [《system()、exec()、fork()三个与进程有关的函数的比较》](https://my.oschina.net/renhc/blog/53580)
- [Linux下使用system()函数一定要谨慎》](https://www.cnblogs.com/qingergege/p/6601807.html)

######################2022.08.28######################  
该博客将停止更新  
新的文章内容和附件工程文件  
请到 liwen01 博客首页信息查询  
liwen01 2022.08.28 日更新  
######################2022.08.28######################
