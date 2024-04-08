U-Boot Cheatsheet
-----------------

__Flashing from bootloader is risky due to lack of verification!__

### Prepare the environment

Set the base address for your SoC.
Refer to your SoC datasheet for the correct value.

```
setenv baseaddr 0x82000000;
saveenv
```

Make sure the network settings are set correctly in the U-Boot environment.
If not, set them yourself according to your network configuration.

[prepare the environment](#prepare-the-environment)
```
setenv ipaddr 192.168.1.10;
setenv netmask 255.255.255.0;
setenv gatewayip 192.168.1.1;
setenv serverip 192.168.1.254;
saveenv
```

### Save firmware

#### save firmware image to an SD card (8MB)

[prepare the environment](#prepare-the-environment)
```
mmc dev 0;
mmc erase 0x10 0x4000;
setenv flashsize 0x800000;
mw.b ${baseaddr} ff ${flashsize};
sf probe 0; sf read ${baseaddr} 0x0 ${flashsize};
mmc write ${baseaddr} 0x10 0x4000
```

Read the saved data on a desktop PC by running
`sudo dd bs=512 skip=16 count=16384 if=/dev/sdb of=./fulldump.bin`,
where `/dev/sdb` is the SD card device.

#### save firmware image to an SD card (16MB)

[prepare the environment](#prepare-the-environment)
```
mmc dev 0;
mmc erase 0x10 0x8000;
setenv flashsize 0x1000000;
mw.b ${baseaddr} ff ${flashsize};
sf probe 0; sf read ${baseaddr} 0x0 ${flashsize};
mmc write ${baseaddr} 0x10 0x8000
```

Read the saved data on a desktop PC by running
`sudo dd bs=512 skip=16 count=32768 if=/dev/sdb of=./fulldump.bin`,
where `/dev/sdb` is the SD card device.

#### save firmware to a TFTP server (8MB)

[prepare the environment](#prepare-the-environment)
```
setenv flashsize 0x800000;
mw.b ${baseaddr} 0xff ${flashsize};
sf probe 0; sf read ${baseaddr} 0x0 ${flashsize};
tftpput ${baseaddr} ${flashsize} backup-${soc}-nor8m.bin
```

if there is no `tftpput` but `tftp` then run this instead

```
tftp ${baseaddr} backup-${soc}-nor8m.bin ${flashsize}
```

#### save firmware to a TFTP server (16MB)

[prepare the environment](#prepare-the-environment)
```
setenv flashsize 0x1000000;
mw.b ${baseaddr} 0xff ${flashsize};
sf probe 0; sf read ${baseaddr} 0x0 ${flashsize};
tftpput ${baseaddr} ${flashsize} backup-${soc}-nor16m.bin
```

if there is no `tftpput` but `tftp` then run this instead

```
tftp ${baseaddr} backup-${soc}-nor16m.bin ${flashsize}
```

#### saving firmware via hex dump

In the terminal program you use to connect to the UART port,
enable saving the session log files.

```
$ screen -L -Logfile fulldump.log /dev/ttyUSB0 115200
```

Set flash memory size. Use this command for an 8MB flash chip

```
setenv flashsize 0x800000
```

or this one for a 16MB flash chip

```
setenv flashsize 0x1000000
```

then dump the memory contents to the console

[prepare the environment](#prepare-the-environment)
```
mw.b ${baseaddr} 0xff ${flashsize};
sf probe 0; sf read ${baseaddr} 0x0 ${flashsize};
md.b ${baseaddr} ${flashsize}
```

Since the reading process will take a considerable amount of time
(literally hours), you may want to disconnect from the terminal session
to prevent accidental keystrokes from contaminating the output.

Press `Ctrl-a` then `d` to disconnect the session from the active terminal.

Run `screen -r` when you need to reconnect it later, after the size of the log
file has stopped growing.

Reading of an 8 MB flash memory should result in about 40 MB log file,
and for a 16 MB chip the file should be twice that size.

Convert the hex dump into a binary firmware file.

```
cat fulldump.log | sed -E "s/^[0-9a-f]{8}\b: //i" | sed -E "s/ {4}.{16}\r?$//" > fulldump.hex
xxd -revert -plain fulldump.hex fulldump.bin
```

Use it for further investigation or to restore the camera to its original state.

Use [binwalk](https://github.com/ReFirmLabs/binwalk) to unpack the binary file.


### Burn the full image

#### burn the full image from an SD card (8MB)

[prepare the environment](#prepare-the-environment)
```
setenv flashsize 0x800000;
mw.b ${baseaddr} 0xff ${flashsize};
fatload mmc 0:1 ${baseaddr} openipc-${soc}-lite-8mb.bin;
sf probe 0; sf erase 0x0 ${flashsize};
sf write ${baseaddr} 0x0 ${filesize}
```

#### burn the full image from a TFTP server (8MB)

[prepare the environment](#prepare-the-environment)
```
setenv flashsize 0x800000;
mw.b ${baseaddr} 0xff ${flashsize};
tftp ${baseaddr} openipc-${soc}-lite-8mb.bin;
sf probe 0; sf erase 0x0 ${flashsize};
sf write ${baseaddr} 0x0 ${filesize}
```

#### burn the full image via a serial connection (8MB)

To upload a file over a serial connection by name only, the file should be
located in the user's home directory, or use the full path to the file instead.

[prepare the environment](#prepare-the-environment)
```
setenv flashsize 0x800000;
mw.b ${baseaddr} 0xff ${flashsize}
loady
# press "Ctrl-a" followed by ":", then type `exec !! sz --ymodem openipc-${soc}-lite-8mb.bin;`
sf probe 0; sf erase 0x0 ${flashsize};
sf write ${baseaddr} 0x0 ${filesize}
```

#### burn the full image from an SD card (16MB)

[prepare the environment](#prepare-the-environment)
```
setenv flashsize 0x1000000;
mw.b ${baseaddr} 0xff ${flashsize};
fatload mmc 0:1 ${baseaddr} openipc-${soc}-ultimate-16mb.bin;
sf probe 0; sf erase 0x0 ${flashsize};
sf write ${baseaddr} 0x0 ${filesize}
```

#### burn the full image from a TFTP server (16MB)

[prepare the environment](#prepare-the-environment)
```
setenv flashsize 0x1000000;
mw.b ${baseaddr} 0xff ${flashsize};
tftp ${baseaddr} openipc-${soc}-ultimate-16mb.bin;
sf probe 0; sf erase 0x0 ${flashsize};
sf write ${baseaddr} 0x0 ${filesize}
```

#### burn the full image via a serial connection (16MB)

To upload a file over a serial connection by name only, the file should be
located in the user's home directory, or use the full path to the file instead.

[prepare the environment](#prepare-the-environment)
```
setenv flashsize 0x1000000;
mw.b ${baseaddr} 0xff ${flashsize}
loady
# press "Ctrl-a" followed by ":", then type `exec !! sz --ymodem openipc-${soc}-lite-16mb.bin;`
sf probe 0; sf erase 0x0 ${flashsize};
sf write ${baseaddr} 0x0 ${filesize}
```


### Burn bootloader only

#### burn bootloader from an SD card

[prepare the environment](#prepare-the-environment)
```
setenv bootsize 0x50000;
mw.b ${baseaddr} 0xff ${bootsize};
fatload mmc 0:1 ${baseaddr} u-boot-${soc}-universal.bin;
sf probe 0; sf erase 0x0 ${bootsize};
sf write ${baseaddr} 0x0 ${filesize}
```

#### burn bootloader from a TFTP server

[prepare the environment](#prepare-the-environment)
```
setenv bootsize 0x50000;
mw.b ${baseaddr} 0xff ${bootsize};
tftp ${baseaddr} u-boot-${soc}-universal.bin;
sf probe 0; sf erase 0x0 ${bootsize};
sf write ${baseaddr} 0x0 ${filesize}
```

#### burn bootloader via a serial connection

[prepare the environment](#prepare-the-environment)
```
setenv bootsize 0x50000;
mw.b ${baseaddr} 0xff ${bootsize}
loady
# press "Ctrl-a" followed by ":", then type `exec !! sz --ymodem u-boot-${soc}-universal.bin`
sf probe 0; sf erase 0x0 ${bootsize};
sf write ${baseaddr} 0x0 ${filesize}
```


### Burn kernel only

#### burn kernel from an SD card (lite)

[prepare the environment](#prepare-the-environment)
```
setenv kernelsize 0x200000;
mw.b ${baseaddr} 0xff ${kernelsize};
fatload mmc 0:1 ${baseaddr} uImage.${soc};
sf probe 0; sf erase 0x50000 ${kernelsize};
sf write ${baseaddr} 0x50000 ${filesize}
```

#### burn kernel from a TFTP server (lite)

[prepare the environment](#prepare-the-environment)
```
setenv kernelsize 0x200000;
mw.b ${baseaddr} 0xff ${kernelsize};
tftp ${baseaddr} uImage.${soc};
sf probe 0; sf erase 0x50000 ${kernelsize};
sf write ${baseaddr} 0x50000 ${filesize}
```

#### burn kernel via a serial connection (lite)

[prepare the environment](#prepare-the-environment)
```
setenv kernelsize 0x200000;
mw.b ${baseaddr} 0xff ${kernelsize}
loady
# press "Ctrl-a" followed by ":", then type `exec !! sz --ymodem uImage.${soc}`
sf probe 0; sf erase 0x0 ${kernelsize};
sf write ${baseaddr} 0x50000 ${filesize}
```

#### burn kernel from an SD card (ultimate)

[prepare the environment](#prepare-the-environment)
```
setenv kernelsize 0x300000;
mw.b ${baseaddr} 0xff ${kernelsize};
fatload mmc 0:1 ${baseaddr} uImage.${soc};
sf probe 0; sf erase 0x50000 ${kernelsize};
sf write ${baseaddr} 0x50000 ${filesize}
```

#### burn kernel from a TFTP server (ultimate)

[prepare the environment](#prepare-the-environment)
```
setenv kernelsize 0x300000;
mw.b ${baseaddr} 0xff ${kernelsize};
tftp ${baseaddr} uImage.${soc};
sf probe 0; sf erase 0x50000 ${kernelsize};
sf write ${baseaddr} 0x50000 ${filesize}
```

#### burn kernel via a serial connection (ultimate)

[prepare the environment](#prepare-the-environment)
```
setenv kernelsize 0x300000;
mw.b ${baseaddr} 0xff ${kernelsize}
loady
# press "Ctrl-a" followed by ":", then type `exec !! sz --ymodem uImage.${soc}`
sf probe 0; sf erase 0x0 ${kernelsize};
sf write ${baseaddr} 0x50000 ${filesize}
```


### Burn rootfs only

#### burn rootfs from an SD card (lite)

[prepare the environment](#prepare-the-environment)
```
setenv rootfssize 0x500000;
mw.b ${baseaddr} 0xff ${rootfssize};
fatload mmc 0:1 ${baseaddr} rootfs.squashfs.${soc};
sf probe 0; sf erase 0x250000 ${rootfssize};
sf write ${baseaddr} 0x250000 ${filesize}
```

#### burn rootfs from a TFTP server (lite)

[prepare the environment](#prepare-the-environment)
```
setenv rootfssize 0x500000;
mw.b ${baseaddr} 0xff ${rootfssize};
tftp ${baseaddr} rootfs.squashfs.${soc};
sf probe 0; sf erase 0x250000 ${rootfssize};
sf write ${baseaddr} 0x250000 ${filesize}
```

#### burn rootfs via a serial connection (lite)

[prepare the environment](#prepare-the-environment)
```
setenv rootfssize 0x500000;
mw.b ${baseaddr} 0xff ${rootfssize}
loady
# press "Ctrl-a" followed by ":", then type `exec !! sz --ymodem rootfs.squashfs.${soc}`
sf probe 0; sf erase 0x250000 ${rootfssize};
sf write ${baseaddr} 0x250000 ${filesize}
```

#### burn rootfs from an SD card (ultimate)

[prepare the environment](#prepare-the-environment)
```
setenv rootfssize 0xA00000;
mw.b ${baseaddr} 0xff ${rootfssize};
fatload mmc 0:1 ${baseaddr} rootfs.squashfs.${soc};
sf probe 0; sf erase 0x350000 ${rootfssize};
sf write ${baseaddr} 0x350000 ${filesize}
```

#### burn rootfs from a TFTP server (ultimate)

[prepare the environment](#prepare-the-environment)
```
setenv rootfssize 0xA00000;
mw.b ${baseaddr} 0xff ${rootfssize};
tftp ${baseaddr} rootfs.squashfs.${soc};
sf probe 0; sf erase 0x350000 ${rootfssize};
sf write ${baseaddr} 0x350000 ${filesize}
```

#### burn rootfs via a serial connection (ultimate)

[prepare the environment](#prepare-the-environment)
```
setenv rootfssize 0xA00000;
mw.b ${baseaddr} 0xff ${rootfssize}
loady
# press "Ctrl-a" followed by ":", then type `exec !! sz --ymodem rootfs.squashfs.${soc}`
sf probe 0; sf erase 0x350000 ${rootfssize};
sf write ${baseaddr} 0x350000 ${filesize}
```


### Erase changes

#### erase overlay partition (8MB, lite)

```
sf probe 0;
sf erase 0x750000 0xb0000
```

#### erase overlay partition (16MB, lite)

```
sf probe 0;
sf erase 0x750000 0x18B0000
```

#### erase overlay partition (16MB, ultimate)

```
sf probe 0;
sf erase 0xD50000 0x2B0000
```

#### erase U-Boot environment

```
sf probe 0;
sf erase 0x40000 0x10000
```

#### Import environment from SD card

```
fatload mmc 0 ${baseaddr} uEnv.txt;
env import -t ${baseaddr} ${filesize};
saveenv
```

### Flash stock firmware

For each `.img` file in stock bundle run

[prepare the environment](#prepare-the-environment)
```
mw.b ${baseaddr} 0xff ${flashsize};
tftp ${baseaddr} <filename.img>;
sf probe 0;
flwrite
```
