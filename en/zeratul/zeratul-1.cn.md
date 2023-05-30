君正Zeratul开发(1)——分区启动分析
------------------------------
li_wen01, 2022-08-30 22:10:54 修改

### (一)整体分区

| 1     | 2    | 3      | 4      | 5        | 6      | 7      |
|-------|------|--------|--------|----------|--------|--------|
| boot  | tag  | kernel | rootfs | recovery | system | config |
| 0.25M | 352K | 4M~5M  | 2M~3M  | 2M~2.5M  | 4512K  | 512K   |

- boot 分区存放 bootloader
- tag 分区存放系统启动参数， 包括 cmdline， Senso init setting， env 参数， bootinfo等。
- kernel 分区存放内核镜像 uImage
- rootfs分区存放根文件系统。rootfs使用lzo压缩， 通过initrd的方式挂载。initrd类似于 initramfs 方式， 也是一种 ramdisk， 存放在内存上， 因此在系统中创建或修改的文件， 仅是存在于内存中， 下次启动后内容会复原。
- system 分区存放系统资源， 比如字体库， 图片资源， 三方库等等。 使用 squashfs。使用 squashfs 的原因是系统资源往往比较大因此需要压缩， 同时以 ro 方式挂载避免数据损坏。 同样由于使用了 squashfs 挂载， 为了不影响启动速度， 会在系统主程序运行后才进行挂载， 因此 system 分区中存放的数据一般是系统初始化不依赖的资源， 如果存放系统初始化依赖的资源或程序， 则会影响系统主要业务的启动速度
- config 分区为 rw 的 jffs2 文件系统， 用来存放配置信息等临时数据。 config 分区是在系统首次启动时创建的
- recovery 分区存放 recovery_os， 其中 recovery 分区也是一个小型完整的 os， 包含 vmlinux + initramfs_root， 使用 lzma 压缩。 电子产品往往需要更新升级， 并且具有恢复数据等功能。 Camera 的 os 分区和 system 分区大小较大， 如果在线直接烧写得话可能存在写中断和异常掉电的可能， 因此 recovery 分区即是提供一种方式， 启动另一个小型的 os， 可以升级设备或者恢复损坏的文件系统。

与其他嵌入式设备不同的是君正设备多了Tag 分区和 recovery分区

### (二)Tag 分区

TAG 分区内容详解

| 1    | 2     | 3             | 4           |
|------|-------|---------------|-------------|
| 32K  | 32K 备 | 128K RISCV 固件 | 160K 图像效果文件 |

RISC-V(发音同“risk-five”)

#### 前 32KB 默认分段(每段 4KB)

| 段                   | 内容                          |
|---------------------|-----------------------------|
| Tag Head            | Tag Info，放置头信息              |
| Sensor Init         | Sensor,初始化 IIC 序列           |
| Cmdline             | 内核所使用cmdline 信息             |
| Env                 | 环境变量参数                      |
| Boot Info           | 系统启动信息， 与 cmdline 中分区信息保持一致 |
| User0               | 用户信息， 暂时无用                  |
| AE table            | 起始 AE(自动曝光) 参数数据            |
| FW Info             | 固件信息                        |

#### 后 32KB 备份分段(每段 4KB)

| 段           | 内容                          |
|-------------|-----------------------------|
| Sensor Init | Sensor 初始化 IIC 序列           |
| Cmdline     | 内核所使用cmdline 信息             |
| Env         | 环境变量参数                      |
| Boot Info   | 系统启动信息， 与 cmdline 中分区信息保持一致 |
| User0       | 用户信息， 暂时无用                  |
| AE table    | 起始 AE 参数数据                  |
| FW Info     | 固件信息                        |
| Tag End     | Tag End， 放置尾信息              |

新增 riscv 固件和 IQ 文件

#### RISCV FW(128KB) RISCV 固件

IQ parameter IQ 图像效果文件

(1)tag 损坏说明：

1. 当前 32KB 数据、 riscv 固件和 IQ 效果数据损坏， 系统能正常启动， 但会在cmdline 追加”tagbk=xx riscv_fw=xx sensor_setting_fw=xx”的参数：
    1. xx 为 0， 表示该段数据正常；
    2. tagbk > 0， 表示前 32KB 数据损坏， 系统使用后 32KB 备份信息；
    3. riscv_fw 或 sensor_setting_fw< 0， 表示对应段的数据损坏。
2. 当前 32KB 数据损坏， 使用备份信息， 备份信息也有损坏， 即 tag error: -1， 进入recovery os；
3. 当 riscv fw 或 IQ(图像质量) 效果文件数据损坏， 除了设置 cmdline 外， 内核启动不注册 ISP， 因此应用在跑视频初始化前， 必须先检查 cmdline 是否存在两者有损坏的情况， 否则会出错

#### (2)T31 RISCV

T31 平台包含 RISCV 小核， 可以提供一些辅助处理， 当前我们把 ISP 的 AE(自动曝光)、AWB(自动白平衡)、功能移植到了 RISCV 上面， 由于我们的系统是 linux 系统， 从 BootLoader 到 linux 内

核启动需要一定的时间， 在 RISCV 的加持下， 可以并行初始化 ISP、 Sensor， 并对AE(自动曝光)、 AWB(自动白平衡) 进行收敛， 内核期间 ISP 驱动注册的时候， 图像效果可以从 RISCV 斜街过来， 这样内核拿到的图像数据基本是稳定可用的。

### (三)启动流程

君正的boot分为两个部分，一个是boot-spl.bin,它是启动的第一阶段，主要的工作是初始化最基本的硬件，比如关闭中断，内存初始化，设置堆栈设置重定位等最基本的操作。第二部分是normal boot，它是uboot的第二部分，主要是完成一些外围器件的初始化。

uboot的主要作用是引导kernel的启动，系统正常运行的时候，uboot 通过第一阶段的spl 程序 引导kernel 启动以及引导RISCV小核的启动，这样可以实现快速的启动以及快速的抓取图片。如果Tag中的参数出现异常，那么设备将进入recovery模式，这个时候系统才会从normal boot启动，然后引导内核启动进入recovery文件系统。

######################2022.08.28######################
该博客将停止更新
新的文章内容和附件工程文件
请到 liwen01 博客首页信息查询
liwen01 2022.08.28 日更新
######################2022.08.28######################
————————————————
版权声明：本文为CSDN博主「li_wen01」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/li_wen01/article/details/114748921
