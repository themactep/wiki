Ingenic Zeratul Development
===========================

I. Partition Boot Analysis
--------------------------

### Global partitioning

| 1     | 2    | 3      | 4      | 5        | 6      | 7      |
|-------|------|--------|--------|----------|--------|--------|
| boot  | tag  | kernel | rootfs | recovery | system | config |
| 0.25M | 352K | 4M~5M  | 2M~3M  | 2M~2.5M  | 4512K  | 512K   |

The `boot` partition stores the bootloader.

The `tag` partition stores system startup parameters, including `cmdline`,
`sensor init` setting, `env` parameters, `bootinfo`, etc.

The `kernel` partition stores the kernel image (uImage).

The `rootfs` partition stores the root filesystem. `rootfs` is compressed with 
`lzo` and mounted through `initrd`. The `initrd` is similar to the `initramfs` 
method, and it is also a ramdisk, which is stored in the memory, so the files
created or modified in the system only exist in the memory, and the content will
be restored after the next startup.
 
The `system` partition stores system resources, such as font libraries, image
resources, third-party libraries, and so on. The `system` partition uses 
`squashfs`. he reason for using squashfs is that the system resources are often
relatively large, so they need to be compressed, and at the same time, they are
mounted in read-only mode to avoid data corruption. Also, due to the use of 
`squashfs` mounting, in order not to affect the startup speed, it will be 
mounted after the main program of the system is running.  Therefore, the data
stored in the system partition is generally a resource that the system 
initialization does not depend on. If the resources that the system 
initialization depends on are stored or program, it will affect the startup
speed of the main business of the system.

The `config` partition is a read-write `jffs2` file system, which is used to 
store temporary data such as configuration information. The `config` partition
is created when the system first boots.

The `recovery` partition stores `recovery_os`, which is a small complete OS
including `vmlinux` and `initramfs_root`, compressed with `lzma`. Electronic
products often need to be updated and upgraded, and have functions such as
recovering data. The camera's OS partition and `system` partition are relatively
large, so if you burn directly online, there may be writing interruptions and
abnormal power failure. Therefore, the `recovery` partition provides a way to
boot into another small OS, which can upgrade the device or recover a corrupted
file systems.

Unlike other embedded devices, Ingenic devices have additional `tag` and 
`recovery` partitions.

### Tag partition

`tag` partition structure:

| 1        | 2          | 3                    | 4                       |
|----------|------------|----------------------|-------------------------|
| 32K Data | 32K Backup | 128K RISC-V Firmware | 160K Image Effect Files |

#### First 32KB default segments (4KB each)

| paragraph   | content                                                                            |
|-------------|------------------------------------------------------------------------------------|
| Tag Head    | Tag Info, place header information                                                 |
| Sensor Init | Sensor, initializes the IIC sequence                                               |
| Cmdline     | The cmdline information used by the kernel                                         |
| Env         | Environment variable parameters                                                    |
| Boot Info   | System boot information, consistent with the partition information in the cmdline. |
| User0       | User information, not used for now.                                                |
| AE table    | Start AE (Auto Exposure) parameter data                                            |
| FW Info     | Firmware information                                                               |

#### Second 32KB backup segments (4KB each)

| paragraph   | content                                                                            |
|-------------|------------------------------------------------------------------------------------|
| Sensor Init | Sensor initializes the IIC sequence                                                |
| Cmdline     | cmdline information used by the kernel                                             |
| Env         | Environment variable parameters                                                    |
| Boot Info   | System boot information, consistent with the partition information in the cmdline. |
| User0       | User information, not used at this time.                                           |
| AE table    | Starting AE parameter data                                                         |
| FW Info     | Firmware information                                                               |
| Tag End     | Tag End, the end of the placement information.                                     |

#### 128KB of RISC-V Firmware 

IQ parameter IQ image effect file

#### (1) tag corruption description.

1. The current 32KB data, RISC-V firmware and IQ effect data are corrupted, 
   the system will boot normally, but the parameter 
   "tagbk=xx riscv_fw=xx sensor_setting_fw=xx" will be appended to the cmdline.
   1. `xx` is 0, indicating that the segment data is normal.
   2. `tagbk` > 0, indicating that the first 32KB of data is corrupted and the
      system uses the next 32KB to back up the information.
   3. `riscv_fw` or `sensor_setting_fw` < 0, indicating that the data of the
      corresponding segment is corrupted.
2. The current 32KB data is corrupted, use the backup information, the backup
   information is also corrupted, i.e. tag error: -1, enter recovery OS.
3. if RISC-V Firmware or IQ effect file data is corrupted, except for `cmdline`
   setting, the kernel does not register ISP, so the application must check 
   whether the `cmdline` is corrupted or not before running video initialization,
   otherwise it will error.

#### (2) T31 RISC-V

T31 platform contains RISC-V cores, which can provide some auxiliary processing,
currently we have ported the AE (Auto Exposure) and AWB (Auto White Balance) 
functions of ISP to RISCV, since our system is linux, from the bootloader to the
Linux internal.

With the support of RISC-V, the kernel can initialize ISP and sensor in parallel,
and converge AE (Auto Exposure) and AWB (Auto White Balance), and when the ISP
driver is registered during the kernel, the image effects can be ramped from 
RISC-V, so that the image data obtained by the kernel is basically stable and
available.

### (3) Boot process

Ingenic's boot is divided into two parts, one is `boot-spl.bin`, it is the first stage of boot, the main work is to
initialize the most basic hardware, such as turning off interrupts, memory initialization, setting the stack setting
relocation and other most basic operations. The second part is normal boot, which is the second part of uboot, mainly
to complete the initialization of some peripheral devices.

The main role of uboot is to boot the kernel. When the system is running normally, uboot will boot the kernel and boot
the RISC-V kernel through the first stage of the spl program, so that it can achieve a fast boot and a fast image
capture. If the parameters in Tag are abnormal, then the device will enter recovery mode, and only then will the 
system boot from normal boot and then boot the kernel into the recovery file system.

--------------------------------------------------------------------------------
Created by li_wen01.
Published under Creative Common 4.0 BY-SA License.
https://blog.csdn.net/li_wen01/article/details/115302346
