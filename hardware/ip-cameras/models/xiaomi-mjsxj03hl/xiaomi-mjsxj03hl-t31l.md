Xiaomi MJSXJ03HL, T31L edition
------------------------------

[Stock firmware dump](/dl/xiaomi-mjsxj03hl-t31l-stock.bin)

### Security

#### /etc/shadow

Default password hash is tored in `/etc/shadow` as uses MD5 encryption.
Plain text password is _ismart12_.

```
root:rJ0FHsG0ZbyZo:10933:0:99999:7:::
```

#### Linux console

Linux console is disabled in `/etc/inittab`:

```
# Put a getty on the serial port
#去除控制台
#console::respawn:/sbin/getty -L console 115200 vt100 # GENERIC_SERIAL
```

### Bootloader shell

Shorting pins 5 and 6 on the flash chip during boot brings up the shell. 

```
isvp_t31# help
?       - alias for 'help'
base    - print or set address offset
boot    - boot default, i.e., run 'bootcmd'
boota   - boot android system
bootd   - boot default, i.e., run 'bootcmd'
bootm   - boot application image from memory
chpart  - change active partition
cmp     - memory compare
coninfo - print console devices and information
cp      - memory copy
crc32   - checksum calculation
echo    - echo args to console
env     - environment handling commands
fatinfo - print information about filesystem
fatload - load binary file from a dos filesystem
fatls   - list files in a directory (default /)
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
printenv- print environment variables
reset   - Perform RESET of the CPU
sdstart - auto sd start!
sdupdate- auto upgrade file!
setenv  - set environment variables
sf      - SPI flash sub-system
sleep   - delay execution for some time
```

There is no way to save changes in environment. `saveenv` command is not enabled in this version of  U-Boot. 

```
isvp_t31# version

U-Boot 2013.07-g8581847-dirty (Aug 09 2021 - 18:07:12)
mips-linux-gnu-gcc (Ingenic r2.3.3 2016.12) 4.7.2
GNU ld (Ingenic r2.3.3 2016.12) 2.24.51.20140512
```
```
isvp_t31# printenv
baudrate=115200
bootargs=console=ttyS1,115200n8 mem=42M@0x0 rmem=22M@0x2A00000 init=/linuxrc rootfstype=squashfs root=/dev/mtdblock2 rw mtdparts=jz_sfc:256K(boot),1984K(kernel),3904K(rootfs),3904K(app),1984K(kback),3904K(aback),384K(cfg),64K(para)
bootcmd=mw 0xb0011134 0x300 1;sdstart;sdupdate;sf probe;sf read 0x80600000 0x40000 0x1F0000; bootm 0x80600000
bootdelay=0
ethaddr=00:d0:d0:00:95:27
gatewayip=193.169.4.1
ipaddr=193.169.4.81
loads_echo=1
netmask=255.255.255.0
serverip=193.169.4.2
stderr=serial
stdin=serial
stdout=serial

Environment size: 562/4092 bytes
```
```
isvp_t31# sdstart
Interface:  MMC
Device 0: Vendor: Man 000000 Snr 00011800 Rev: 10.11 Prod: APPSD
Type: Removable Hard Disk
Capacity: 60.0 MB = 0.0 GB (122880 x 512)
Filesystem: FAT16 "NO NAME    "
file_fat_detectfs OK
reading factory_t31_ZMC6tiIDQN
factory_t31_ZMC6tiIDQN not found
```

The firmware expects a file named `factory_t31_ZMC6tiIDQN` on the SD card.

```
isvp_t31# sdupdate
gpio_request lable = sdupgrade gpio = 51
the manufacturer 5e
SF: Detected ZB25VQ128

The upgrade flag could not be found!
```

The upgrade flag must be set by `mw 0xb0011134 0x300 1` command.
