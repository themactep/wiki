VN-NM-T55A (T55A-D07Y-1)
------------------------

https://www.ezhdt.cn/product/161.html

- Manufacturer: [Vanhua](https://vanhua.en.alibaba.com/)
- Board: T41Q_G42_V1_1
- SoC: Ingenic T41LQ
- Sensor: Galaxycore GC5603
- Flash: XMC 25QH128CHIQ
- Dimensions: 38 × 38 mm (1.50 × 1.50 inch)
- ODM: https://www.ezhdt.com/
- App/Cloud: http://antsvision.com/


### Ports

#### Audio port

4-pin Molex PicoBlade

#### Ethernet port + Power

8-pin Molex PicoBlade

#### IRCUT port

2-pin Molex PicoBlade, 90 deg.

#### Speaker port

2-pin Molex PicoBlade, 90 deg.

##### USB port

4-pin Molex PicoBlade, 90 deg.

##### TTL

TX and RX contacts located in the bottom left corner, next to a mounting hole (GND).

##### UART

UART contacts are located in the bottom right corner, next to a mounting hole.
VCC, RX, TX, GND marked as V, R, T and G, accordingly.

### U-Boot

U-Boot password is `hdt2022t41`. But you have only 1 second to enter it. Copy in clipboard and paste into terminal 
as soon as you see _Press password in 1 second_ string. Alternatevely, shorting pins 5 and 6 on the flash memory
chip during bootloader run brings up bootloader shell.

When in the shell, close watchdog by running `watchdog 0`.

#### printenv

```
baudrate=115200
bootargs=console=ttyS1,115200n8 mem=36608K@0x0 rmem=25856K@0x23C0000 nmem=3072K@0x3D00000 init=/linuxrc root=/dev/mtdblock4 fstype=squashfs mtdparts=sfc0_nor:256k(uboot),64k(factory),1024k(config),1280k(kernel),1472k(rootfs),-(appfs) lpj=11968512 quiet
bootcmd=sf0 probe;sf0 read 0x80600000 0x150000 0x140000;bootm 0x80600000
bootdelay=1
ethact=Jz4775-9161
ethaddr=6a:8b:5f:70:7a:6c
ipaddr=169.254.43.16
loads_echo=1
stderr=serial
stdin=serial
stdout=serial

Environment size: 497/4092 bytes
```

#### help
```
?       - alias for 'help'
base    - print or set address offset
boot    - boot default, i.e., run 'bootcmd'
boota   - boot android system
bootd   - boot default, i.e., run 'bootcmd'
bootm   - boot application image from memory
bootp   - boot image via network using BOOTP/TFTP protocol
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
mw      - memory write (fill)
nm      - memory modify (constant address)
ping    - send ICMP ECHO_REQUEST to network host
powerinfo- show regulator output voltage and status
printenv- print environment variables
reset   - Perform RESET of the CPU
run     - run commands in an environment variable
saveenv - save environment variables to persistent storage
setenv  - set environment variables
sf      - SPI flash sub-system
sf0     - SPI flash sub-system
sf1     - SPI flash sub-system
sleep   - delay execution for some time
source  - run script from memory
tftpboot- boot image via network using TFTP protocol
tftpdownload- auto upgrade file from tftp to flash
udp     - lookup the IP of a hostname
version - print monitor, compiler and linker version
watchdog- open or colse the watchdog
```

- Set camera IP address by running `setenv ipaddr 192.168.1.10`.
- Set TFTP server IP address by running `setenv serverip 192.168.1.254`.
- Running `tftpboot` loads file `C0A8010A.img` from TFTP server, where `C0A8010A` is the ip address set in `ipaddr` encoded as hex.

### Linux

#### /etc/passwd

```
root:$6$s90ReNRC.jPq3V9Z$oMWkGeVCuBFY/Ey3DS8NxOK2tPD6eFIRxWNaxZx8EhY9aTNzgqM7tSxl.PngyNyYJT06RP8iE3Bd04CuicNiq.:0:0::/root:/bin/sh
```
