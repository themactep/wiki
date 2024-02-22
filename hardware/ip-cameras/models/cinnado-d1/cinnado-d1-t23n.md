Cinnado D1, T23N edition
------------------------

- https://www.cinnado.com/D1
- https://www.amazon.com/gp/product/B0CBBT5RMP/
- Cloud: [AJCloud](https://www.ajcloud.net/)

### Hardware

- Manufacturer: Wansview
- ODM:
- SoC: Ingenic T23N
- Sensor: SmartSens SC2336
- Flash: 25Q64 8MB
- Wi-Fi: Altobeam 6012B (USB)
- Pan motor: ?
- Tilt motor: 24BYJ48 5V
- 4 x 940nm IR LEDs
- SD card slot
- Microphone
- Speaker
- Power: USB-C
- Blue/Red LED indicators
- Reset button

### Stock firmware

Stock bootloader is not protected. `Ctrl-C` brings in the shell.

```
isvp_t23# help
?       - alias for 'help'
base    - print or set address offset
boot    - boot default, i.e., run 'bootcmd'
boota   - boot android system
bootd   - boot default, i.e., run 'bootcmd'
bootm   - boot application image from memory
bootp   - boot image via network using BOOTP/TFTP protocol
chpart  - change active partition
cmp     - memory compare
coninfo - print console devices and information
cp      - memory copy
crc32   - checksum calculation
echo    - echo args to console
env     - environment handling commands
ethphy  - ethphy contrl
fatinfo - print information about filesystem
fatload - load binary file from a dos filesystem
fatls   - list files in a directory (default /)
gettime - get timer val elapsed,

go      - start application at address 'addr'
help    - print command description/usage
loadb   - load binary file over serial line (kermit mode)
loads   - load S-Record file over serial line
loady   - load binary file over serial line (ymodem mode)
loop    - infinite loop on address range
md      - memory display
mm      - memory modify (auto-incrementing address)
mmc     - MMC sub system
mmcinfo - display MMC info
mtdparts- define flash/nand partitions
mw      - memory write (fill)
nm      - memory modify (constant address)
ping    - send ICMP ECHO_REQUEST to network host
printenv- print environment variables
reset   - Perform RESET of the CPU
run     - run commands in an environment variable
saveenv - save environment variables to persistent storage
setenv  - set environment variables
sf      - SPI flash sub-system
sleep   - delay execution for some time
source  - run script from memory
tftpboot- boot image via network using TFTP protocol
tftpdownload- auto upgrade file from tftp to flash
version - print monitor, compiler and linker version
watchdog- open or colse the watchdog
```
```
isvp_t23# version 

U-Boot 2013.07 (Nov 25 2023 - 15:10:51)
mips-linux-uclibc-gcc (Ingenic Linux-Release3.3.0-Default(xburst1(fp32)+uclibc0.9.33.2) Smaller libc 2022.11-07) 5.4.0
GNU ld (Ingenic Linux-Release3.3.0-Default(xburst1(fp32)+uclibc0.9.33.2) Smaller libc 2022.11-07) 2.25.51
```
```
isvp_t23# printenv 
baudrate=115200
bootargs=tf=0 console=ttyS1,115200n8 mem=43520K@0x0 rmem=22016K@0x2A80000 init=/linuxrc rootfstype=squashfs root=/dev/mtdblock2 rw mtdparts=jz_sfc:256k(boot),1632k(kernel),2752k(rootfs),3168k(app),384k(syscfg),8M@0(all)
bootcmd=sf probe;sf read 0x80600000 0x40000 0x200000; bootm 0x80600000
bootdelay=1
ethaddr=00:11:22:33:44:66
gatewayip=193.169.3.1
ipaddr=193.169.3.206
loads_echo=1
netmask=255.255.255.0
serverip=193.169.4.2
stderr=serial
stdin=serial
stdout=serial

Environment size: 512/16380 bytes
```

Stock root password

`root:EeA5H4cQvy0gc:19220:0:99999:7:::`

### GPIO

```
[@Ingenic-uc1_1:root]# mount -t debugfs none /sys/kernel/debug; cat /sys/kernel/debug/gpio
GPIOs 0-31, GPIO A:
 gpio-6   (sysfs               ) out hi
 gpio-18  (sc2336_reset        ) out hi

GPIOs 32-63, GPIO B:
 gpio-38  (gpioCtrl            ) in  hi
 gpio-39  (gpioCtrl            ) out hi
 gpio-40  (gpioCtrl            ) out hi
 gpio-45  (gpioCtrl            ) out lo
 gpio-46  (gpioCtrl            ) out lo
 gpio-47  (sysfs               ) out lo
 gpio-49  (ptzCtrl             ) out lo
 gpio-50  (mmc_detect          ) in  hi
 gpio-52  (ptzCtrl             ) out lo
 gpio-53  (ptzCtrl             ) out lo
 gpio-57  (gpioCtrl            ) out lo
 gpio-58  (gpioCtrl            ) out lo
 gpio-59  (ptzCtrl             ) out lo
 gpio-61  (ptzCtrl             ) out lo
 gpio-62  (ptzCtrl             ) out lo
 gpio-63  (ptzCtrl             ) out lo

GPIOs 64-95, GPIO C:
 gpio-64  (ptzCtrl             ) out lo
 ```
