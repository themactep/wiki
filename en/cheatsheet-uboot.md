U-Boot Cheatsheet
-----------------

Make sure network setting are set correctly in U-Boot environment.
If not, set it yourself according to your network configuration.
```
setenv ipaddr 192.168.1.10;
setenv netmask 255.255.255.0;
setenv gatewayip 192.168.1.1;
setenv serverip 192.168.1.254;
saveenv
```
Set base address for your SoC.
Look up proper value for your SoC in a corresponding data sheet.
```
setenv baseaddr 0x82000000;
saveenv
```

## Save firmware

#### save firmware image to a SD card (8MB)
```
mmc dev 0;
mmc erase 0x10 0x4000;
setenv flashsize 0x800000; mw.b ${baseaddr} ff ${flashsize};
sf probe 0; sf read ${baseaddr} 0x0 ${flashsize};
mmc write ${baseaddr} 0x10 0x4000
```
Read it later on a desktop with `sudo dd bs=512 skip=16 count=16384 if=/dev/sdb of=./fulldump.bin`, where `/dev/sdb` is the card device.
#### save firmware image to a SD card (16MB)
```
mmc dev 0;
mmc erase 0x10 0x8000;
setenv flashsize 0x1000000; mw.b ${baseaddr} ff ${flashsize};
sf probe 0; sf read ${baseaddr} 0x0 ${flashsize};
mmc write ${baseaddr} 0x10 0x8000
```
Read it later on a desktop with `sudo dd bs=512 skip=16 count=32768 if=/dev/sdb of=./fulldump.bin`, where `/dev/sdb` is the card device.
#### save firmware to a TFTP server (8MB)
```
setenv flashsize 0x800000; mw.b ${baseaddr} 0xff ${flashsize};
sf probe 0; sf read ${baseaddr} 0x0 ${flashsize};
tftpput ${baseaddr} ${flashsize} backup-${soc}-nor8m.bin
```
if there is no `tftpput` but `tftp` then run this instead
```
tftp ${baseaddr} backup-${soc}-nor8m.bin ${flashsize}
```
#### save firmware to a TFTP server (16MB)
```
setenv flashsize 0x1000000; mw.b ${baseaddr} 0xff ${flashsize};
sf probe 0; sf read ${baseaddr} 0x0 ${flashsize};
tftpput ${baseaddr} ${flashsize} backup-${soc}-nor16m.bin
```
if there is no `tftpput` but `tftp` then run this instead
```
tftp ${baseaddr} backup-${soc}-nor16m.bin ${flashsize}
```

#### saving firmware via hex dump

In the terminal program that you use to connect to the UART port, enable saving log file of the session.
```
$ screen -L -Logfile fulldump.log /dev/ttyUSB0 115200
```
Set flash memory size. Use this command for a 8MB flash chip
```
setenv flashsize 0x800000
```
or this one for a 16MB flash chip
```
setenv flashsize 0x1000000
```
Then dump the memory content into the console:
```
mw.b ${baseaddr} 0xff ${flashsize};
sf probe 0; sf read ${baseaddr} 0x0 ${flashsize};
md.b ${baseaddr} ${flashsize}
```
Since the process of reading is going to take a considerable amount of time (literally hours), you might want to disconnect from the terminal session to avoid accidental keystrokes contaminating the output. Press Ctrl-a followed by d to detach the session from active terminal. Run screen -r when you need to reconnect it later, after the size of the log file will stop growing. Reading of an 8 MB flash memory should result in a ~40 MB log file, and for a 16 MB chip the file should be twice that size.

Convert the hex dump into a binary firmware file and use it for further research or restoring the camera to its pristine state.
```
cat fulldump.log | sed -E "s/^[0-9a-f]{8}\b: //i" | sed -E "s/ {4}.{16}\r?$//" > fulldump.hex
xxd -revert -plain fulldump.hex fulldump.bin
```
Use binwalk to unpack the binary file.

## Burn full image

#### burn full image from a SD card (8MB)
```
setenv flashsize 0x800000; mw.b ${baseaddr} 0xff ${flashsize};
fatload mmc 0:1 ${baseaddr} openipc-${soc}-lite-8mb.bin; 
sf probe 0; sf erase 0x0 ${flashsize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn full image from a TFTP server (8MB)
```
setenv flashsize 0x800000; mw.b ${baseaddr} 0xff ${flashsize};
tftp ${baseaddr} openipc-${soc}-lite-8mb.bin;
sf probe 0; sf erase 0x0 ${flashsize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn full image via a serial connection (8MB)
```
setenv flashsize 0x800000; mw.b ${baseaddr} 0xff ${flashsize}
loady
# press "Ctrl-a" followed by ":", then type `exec !! sz --ymodem openipc-${soc}-lite-8mb.bin;`
sf probe 0; sf erase 0x0 ${flashsize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn full image from a SD card (16MB)
```
setenv flashsize 0x1000000; mw.b ${baseaddr} 0xff ${flashsize};
fatload mmc 0:1 ${baseaddr} openipc-${soc}-ultimate-16mb.bin;
sf probe 0; sf erase 0x0 ${flashsize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn full image from a TFTP server (16MB)
```
setenv flashsize 0x1000000; mw.b ${baseaddr} 0xff ${flashsize};
tftp ${baseaddr} openipc-${soc}-lite-16mb.bin;
sf probe 0; sf erase 0x0 ${flashsize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn full image via a serial connection (16MB)
```
setenv flashsize 0x1000000; mw.b ${baseaddr} 0xff ${flashsize}
loady
# press "Ctrl-a" followed by ":", then type `exec !! sz --ymodem openipc-${soc}-lite-16mb.bin;`
sf probe 0; sf erase 0x0 ${flashsize}; sf write ${baseaddr} 0x0 ${filesize}
```

## Burn bootloader only

#### burn bootloader from a SD card
```
setenv bootsize 0x50000; mw.b ${baseaddr} 0xff ${bootsize};
fatload mmc 0:1 ${baseaddr} u-boot-${soc}-universal.bin; 
sf probe 0; sf erase 0x0 ${bootsize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn bootloader from a TFTP server
```
setenv bootsize 0x50000; mw.b ${baseaddr} 0xff ${bootsize};
tftp ${baseaddr} u-boot-${soc}-universal.bin;
sf probe 0; sf erase 0x0 ${bootsize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn bootloader via a serial connection
```
setenv bootsize 0x50000; mw.b ${baseaddr} 0xff ${bootsize}
loady
# press "Ctrl-a" followed by ":", then type `exec !! sz --ymodem u-boot-${soc}-universal.bin`
sf probe 0; sf erase 0x0 ${bootsize}; sf write ${baseaddr} 0x0 ${filesize}
```

## Burn kernel only

#### burn kernel from a SD card (lite)
```
setenv kernelsize 0x200000; mw.b ${baseaddr} 0xff ${kernelsize};
fatload mmc 0:1 ${baseaddr} uImage.${soc}; 
sf probe 0; sf erase 0x50000 ${kernelsize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn kernel from a TFTP server (lite)
```
setenv kernelsize 0x200000; mw.b ${baseaddr} 0xff ${kernelsize};
tftp ${baseaddr} uImage.${soc};
sf probe 0; sf erase 0x50000 ${kernelsize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn kernel via a serial connection (lite)
```
setenv kernelsize 0x200000; mw.b ${baseaddr} 0xff ${kernelsize}
loady
# press "Ctrl-a" followed by ":", then type `exec !! sz --ymodem uImage.${soc}`
sf probe 0; sf erase 0x0 ${kernelsize}; sf write ${baseaddr} 0x0 ${filesize}
```

#### burn kernel from a SD card (ultimate)
```
setenv kernelsize 0x300000; mw.b ${baseaddr} 0xff ${kernelsize};
fatload mmc 0:1 ${baseaddr} uImage.${soc}; 
sf probe 0; sf erase 0x50000 ${kernelsize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn kernel from a TFTP server (ultimate)
```
setenv kernelsize 0x300000; mw.b ${baseaddr} 0xff ${kernelsize};
tftp ${baseaddr} uImage.${soc};
sf probe 0; sf erase 0x50000 ${kernelsize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn kernel via a serial connection (ultimate)
```
setenv kernelsize 0x300000; mw.b ${baseaddr} 0xff ${kernelsize}
loady
# press "Ctrl-a" followed by ":", then type `exec !! sz --ymodem uImage.${soc}`
sf probe 0; sf erase 0x0 ${kernelsize}; sf write ${baseaddr} 0x0 ${filesize}
```

## Burn rootfs only

#### burn rootfs from a SD card (lite)
```
setenv rootfssize 0x500000; mw.b ${baseaddr} 0xff ${rootfssize};
fatload mmc 0:1 ${baseaddr} rootfs.squashfs.${soc}; 
sf probe 0; sf erase 0x250000 ${rootfssize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn rootfs from a TFTP server (lite)
```
setenv rootfssize 0x500000; mw.b ${baseaddr} 0xff ${rootfssize};
tftp ${baseaddr} rootfs.squashfs.${soc};
sf probe 0; sf erase 0x250000 ${rootfssize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn rootfs via a serial connection (lite)
```
setenv rootfssize 0x500000; mw.b ${baseaddr} 0xff ${rootfssize}
loady
# press "Ctrl-a" followed by ":", then type `exec !! sz --ymodem rootfs.squashfs.${soc}`
sf probe 0; sf erase 0x250000 ${rootfssize}; sf write ${baseaddr} 0x0 ${filesize}
```

#### burn rootfs from a SD card (ultimate)
```
setenv rootfssize 0xA00000; mw.b ${baseaddr} 0xff ${rootfssize};
fatload mmc 0:1 ${baseaddr} rootfs.squashfs.${soc}; 
sf probe 0; sf erase 0x350000 ${rootfssize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn rootfs from a TFTP server (ultimate)
```
setenv rootfssize 0xA00000; mw.b ${baseaddr} 0xff ${rootfssize};
tftp ${baseaddr} rootfs.squashfs.${soc};
sf probe 0; sf erase 0x350000 ${rootfssize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn rootfs via a serial connection (ultimate)
```
setenv rootfssize 0xA00000; mw.b ${baseaddr} 0xff ${rootfssize}
loady
# press "Ctrl-a" followed by ":", then type `exec !! sz --ymodem rootfs.squashfs.${soc}`
sf probe 0; sf erase 0x350000 ${rootfssize}; sf write ${baseaddr} 0x0 ${filesize}
```

## Erase changes

#### erase overlay partition (8MB, lite)
```
sf probe 0; sf erase 0x750000 0xb0000
```
#### erase overlay partition (16MB, lite)
```
sf probe 0; sf erase 0x750000 0x18B0000
```
#### erase overlay partition (16MB, ultimate)
```
sf probe 0; sf erase 0xD50000 0x2B0000
```
#### erase U-Boot environment
```
sf probe 0; sf erase 0x40000 0x10000
```

## Flash stock firmware
For each `.img` file in stock bundle run
```
mw.b ${baseaddr} 0xff ${flashsize}; tftp ${baseaddr} <filename.img>; sf probe 0; flwrite
```
