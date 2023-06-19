君正Zeratul开发(2)——uboot启动分析
------------------------------

### 前言

boot启动一般分为两个阶段，君正设备的第一阶段uboot spl 程序没有开源，用户编译的是第二阶段的boot,最后将两个阶段的boot合并到一起，写入到boot分区中去,boot分区如下

![](image4.png)

### (一)SPL (secondary program loader)

SPL(secondary program loader)是一个十分小的bin文件，它是用来引导主u-boot文件。对于一些SRAM很小的SOC，无法一次性加载ROM中的bootloader到SRAM中，因为一般SRAM远远小于bootloader的大小。这时候SPL应运而生了。

#### 加载过程

嵌入式系统的SOC内部会有比较小的SRAM，而外部的一般会有DDR或者SDRAM，后面的RAM就是外部RAM；SPL会先被加载到SRAM中，然后初始化DDR或者SDRAM，总之会初始化外部的RAM，然后再把主u-boot加载到RAM；
如下图所示：

![](image5.png)

在这里插入图片描述

1.图中①是 SPL在u-boot第一阶段的装载程序，初始化最基本的硬件，比如关闭中断，内存初始化，设置堆栈等最基本的操作，设置重定位；
2.图中②是会装载主u-boot程序，然后初始化其他板级硬件，比如网卡，nand flash等待，设置u-boot本身的命令和环境变量；
3.图中③是加载kernel到RAM，然后启动内核；

### (二)uboot

在君正设备中，这部分称之为normal boot，它与我们其他平台使用的boot相类似，并且代码是开源的，用户可以自定义修改。

#### 编译

u-boot 可单独编译，不依赖其他代码 。 T31 u-boot 的板机配置文件位于include/configs/isvp_t31.h。编译命令可以查询君正对应的设备，比如针对 T31X 芯片 编 译 norflash 启 动 的命令如下：
```
make isvp_t31_sfcnor_ddr128M
```

编译针对 T31X 芯片 SD 卡启动的 uboot 命令如下：
```
make isvp_t31_msc0_ddr128M
```

编译步骤：
- 第一步： `$ make distclean` 清除旧配置
- 第二步： `$ make isvp_t31_xxx` 根据对应芯片类型(芯片型号查看《芯片版本说明》)，编译对应的 uboot，生成对应的 u-boot-with-spl.bin

#### 常见修改

1) __CONFIG_BOOTARGS__， 主要修改点是内核启动以后的内存配置，分区大小配置。（注： mem 表示内核启动以后保留内存， rmem 表示预留给 SDK 的内存（包括 ISP模块的内存）；两者相加为芯片真实内存大小； 具体大小可参考代码）

2) __CONFIG_BOOTCOMMAND__，配置 uboot 启动执行的命令。 例如： norflash 启  
   动模式下添加 sd 卡启动的命令， “sf probe;sf read 0x80600000 0x40000 0x280000; bootm 0x80600000” 改为 “mmc read 0x80600000 0x1800 0x3000; bootm 0x80600000” 。

3) __CONFIG_BOOTDELAY__， 配置 uboot 的等待时间。

4) 需要添加新的 norflash 芯片的支持。

5) uboot 中添加密码功能：  
   修改配置文件， 修改 isvp_t31.h 中添加如下内容：
```
#define CONFIG_AUTOBOOT_KEYED // 必配
#define CONFIG_AUTOBOOT_STOP_STR “123456” //必配， uboot 设置的密码。
#define CONFIG_AUTOBOOT_PROMPT “Press xxx in %d second” // bootdelay,选配，
```

6) SD 卡升级问题  
   在 isvp_t31.h 中添加 #define CONFIG_AUTO_UPDATE 定义。 具体代码实现在common/cmd_sdupdate.c 中。需要注意点： LOAD_ADDR 表示把 SD 卡上的相应内存加载到内存的位置。 程序中默认设置为 0x82000000，由于这个地址位于 uboot 的堆上，常见 uboot 的堆大小的设置在 isvp_t31.h 中 CONFIG_SYS_MALLOC_LEN 宏的配置；所以这个地址能够被使用的大小将受到堆大小的限制， 还有 uboot 代码中 malloc 空间的限制。（注意： 需要读取较大文件的时候，可以适当增大 CONFIG_SYS_MALLOC_LEN）

7) 编译出的 uboot 大于限制的大小处理方法  
   uboot 代码中默认限制 spl 部分为 26Kbytes， uboot 部分为 214Kbytes；一共240Kbytes 大小的限制。 如果 uboot 编译生成的 u-boot-with-spl.bin 文件大于240Kbytes，则无法启动。  
解决方案一：  
   增加 uboot 的限制； 修改 isvp_t31.h 中 CONFIG_SYS_MONITOR_LEN 宏的定义； 同时修改 CONFIG_BOOTARGS 变量中 boot 分区的大小及以后分区的偏移地址。  
解决方案二：  
   如果生成的u-boot-with-spl.bin 超出240Kbytes 较少可以采取压缩 uboot的方式。在 isvp_t31.h 中 修改#undef CONFIG_SPL_LZOP 为 #define CONFIG_SPL_LZOP； 然后重新编译烧录的文件名 u-boot-lzo-with-spl.bin

8) uboot 网络问题  
   默认的 isvp 配置是包含以太网部分的代码，如果产品在 uboot 阶段不需要 TFTP 下载或者 NFS 挂载， 可以把以太网部分代码裁剪掉，以便减小 uboot。具体操作：打开 isvp_T31.h 配置文件， 把#define CONFIG_CMD_NET 宏注掉即可。

### (三)合并

君正官方提供的spl 程序，与用户自己编译生成的boot.bin 需要合并到一起同时烧录到boot分区里面去，君正有一个合并脚本，可以通过build/pad_camera_u-boot.sh 将自己的 u-boot pad 到 boot.bin 中
```
usage:./pad_camera_u-boot.sh -i <input_file> -o <output_file> -b <boot.bin fw>
eg:
./pad_camera_u-boot.sh -i u-boot-with-spl.bin -o boot_custom -b ${ZRT_ENV_TOP_DIR}/firmware/camera/bootloader/boot.bin
```

实际命令之后执行的内容是：
```
cp ${BOOT_FILE} ${OUTPUT_FILE}
dd if=${INPUT_FILE} of=${OUTPUT_FILE} bs=1K skip=${UBOOT_OFFSET} seek=${UBOOT_OFFSET}
```

实际执行内容为：  
   BOOT_FILE 为SDK 中自带的低功耗快起固件，以boot_SOC_T31Z_V2.bin 为例
```
dd if=u-boot-with-spl.bin  of=boot_custom  bs=1k skip=32 seek=32
```
if=文件名：输入文件名  
of=文件名：输出文件名  
bs=bytes：同时设置读入/输出的块大小为bytes个字节。  
skip=blocks：从输入文件开头跳过blocks个块后再开始复制。  
seek=blocks：从输出文件开头跳过blocks个块后再开始复制。

实际上是将boot_SOC_T31Z_V2.bin 文件开始的32K文件和u-boot-with-spl.bin文件32K之后的文件合到一块生成新的文件。
引用：

[u-boot spl 学习总结](https://my.oschina.net/renhc/blog/53580)

######################2022.08.28######################  
该博客将停止更新  
新的文章内容和附件工程文件  
请到 liwen01 博客首页信息查询  
liwen01 2022.08.28 日更新  
######################2022.08.28######################
