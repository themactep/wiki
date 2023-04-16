U-Boot Cheatsheet
-----------------

## Save firmware

#### save firmware image to an SD card (8MB)
```
mmc dev 0;
mmc erase 0x10 0x4000;
setenv flashsize 0x800000; mw.b ${baseaddr} ff ${flashsize};
sf probe 0; sf read ${baseaddr} 0x0 ${flashsize};
mmc write ${baseaddr} 0x10 0x4000
```
Read it later on a desktop with `sudo dd bs=512 skip=16 count=16384 if=/dev/sdc of=./fulldump.bin`
#### save firmware image to an SD card (16MB)
```
mmc dev 0;
mmc erase 0x10 0x8000;
setenv flashsize 0x1000000; mw.b ${baseaddr} ff ${flashsize};
sf probe 0; sf read ${baseaddr} 0x0 ${flashsize};
mmc write ${baseaddr} 0x10 0x8000
```
Read it later on a desktop with `sudo dd bs=512 skip=16 count=32768 if=/dev/sdc of=./fulldump.bin`

## Burn full image

#### burn full image from an SD card (8MB)
```
setenv flashsize 0x800000; mw.b ${baseaddr} 0xff ${flashsize};
fatload mmc 0:1 ${baseaddr} openipc-${soc}-lite-8mb.bin; 
sf probe 0; sf erase 0x0 ${flashsize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn full image from an TFTP (8MB)
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
#### burn full image from an SD card (16MB)
```
setenv flashsize 0x1000000; mw.b ${baseaddr} 0xff ${flashsize};
fatload mmc 0:1 ${baseaddr} openipc-${soc}-ultimate-16mb.bin;
sf probe 0; sf erase 0x0 ${flashsize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn full image from an TFTP (16MB)
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

#### burn bootloader from an SD card
```
setenv bootsize 0x50000; mw.b ${baseaddr} 0xff ${bootsize};
fatload mmc 0:1 ${baseaddr} u-boot-${soc}-universal.bin; 
sf probe 0; sf erase 0x0 ${bootsize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn bootloader from an TFTP
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

#### burn kernel from an SD card (lite)
```
setenv kernelsize 0x200000; mw.b ${baseaddr} 0xff ${kernelsize};
fatload mmc 0:1 ${baseaddr} uImage.${soc}; 
sf probe 0; sf erase 0x50000 ${kernelsize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn kernel from TFTP (lite)
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

#### burn kernel from an SD card (ultimate)
```
setenv kernelsize 0x300000; mw.b ${baseaddr} 0xff ${kernelsize};
fatload mmc 0:1 ${baseaddr} uImage.${soc}; 
sf probe 0; sf erase 0x50000 ${kernelsize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn kernel from TFTP (ultimate)
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

#### burn rootfs from an SD card (lite)
```
setenv rootfssize 0x500000; mw.b ${baseaddr} 0xff ${rootfssize};
fatload mmc 0:1 ${baseaddr} rootfs.squashfs.${soc}; 
sf probe 0; sf erase 0x250000 ${rootfssize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn rootfs from TFTP (lite)
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

#### burn rootfs from an SD card (ultimate)
```
setenv rootfssize 0xA00000; mw.b ${baseaddr} 0xff ${rootfssize};
fatload mmc 0:1 ${baseaddr} rootfs.squashfs.${soc}; 
sf probe 0; sf erase 0x350000 ${rootfssize}; sf write ${baseaddr} 0x0 ${filesize}
```
#### burn rootfs from TFTP (ultimate)
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
