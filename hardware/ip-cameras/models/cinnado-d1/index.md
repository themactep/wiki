Cinnado D1
----------
- https://www.cinnado.com/D1
- https://www.amazon.com/gp/product/B0CBBT5RMP/

### Specs

- SoC: Ingenic T31L
- Sensor: SmartSens SC2336
- Flash: BoyaMicro 25Q64ESSIG
- Wi-Fi: Altobeam 6031
- Pan motor: 
- Tilt motor: 24BYJ48 5V
- 4 940nm IR LEDs
- SD Card Slot
- Microphone
- Speaker
- Cloud: Wansview

### Hardware

#### Sensor

    Part Number:    SC2336
    Manufacturer:   SmartSens Technology
    Resolution:     1928 (H) x 1088 (V)
    Mega Pixels:    2 MP
    Supply Voltage: 2.8 V (Analog), 1.8 V (I/O)
    Optical Format: 1/3 Inch
    Package Type:   CSP
    Chroma:         RGB
    Shutter Type:   Rolling Shutter
    Frame Rate:     30 Frames/sec
    ADC Resolution: 8 Bit, 10 Bit
    Pixel Size:     2.7 µm x 2.7 µm
    Pixel:          2 MP
    Dynamic Range:  74 dB
    Pixel Type:     DSI-2
    Sensitivity:    6594 mV/Lux-s
    SNR:            36 dB
    Note:           Output Format: RAW RGB, CRA: 12 Degrees
    Interface:      DVP, MIPI
    Package:        35 pin CSP package
    Dimensions:     5.718 mm x 3.663 mm

#### UART 

UART terminals are located near SD card slot and marked in a silk print.

![](pix)


### Stock firmware analysis

#### Bootloader

Access to bootloader shell during system start is not guarded by anything.
Pressing Ctrl-C aborts a booting process and loads the shell.

```
isvp_t31# version

U-Boot 2013.07 (Dec 05 2022 - 10:55:23)
mips-linux-gnu-gcc (Ingenic r2.3.3 2016.12) 4.7.2
GNU ld (Ingenic r2.3.3 2016.12) 2.24.51.20140512

isvp_t31# help
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

isvp_t31# printenv
baudrate=115200
bootargs=tf=0 console=ttyS1,115200n8 mem=43520K@0x0 rmem=22016K@0x2A80000 init=/linuxrc rootfstype=squashfs root=/dev/mtdblock2 rw mtdparts=jz_sfc:256k(boot),1632k(kernel),2752k(rootfs),3136k(app),384k(syscfg),32k(flag),8M@0(all)
bootcmd=sf probe;sf read 0x80600000 0x40000 0x280000; bootm 0x80600000
bootdelay=1
ethact=Jz4775-9161
ethaddr=00:d0:d0:00:95:27
gatewayip=193.169.4.1
ipaddr=193.169.4.81
loads_echo=1
netmask=255.255.255.0
serverip=193.169.4.2
stderr=serial
stdin=serial
stdout=serial

Environment size: 542/16380 bytes
```

#### GPIO

```
[@Ingenic-uc1_1:root]# cat /sys/kernel/debug/gpio
GPIOs 0-31, GPIO A:
 gpio-7   SPEAKER_EN          ) out hi
 gpio-8   RED_LED             ) out hi
 gpio-9   BLUE_LED            ) out lo
 gpio-11  IR LED              ) out lo
 gpio-14  BUTTON              ) in  hi
 gpio-16  sda                 ) in  hi
 gpio-17  scl                 ) in  hi
 gpio-18  sc2336_reset        ) out hi

GPIOs 32-63, GPIO B:
 gpio-47  sdio_wifi_power_on  ) out hi
 gpio-49  PTZ-H Phase A       ) out lo
 gpio-50  mmc_detect          ) in  lo
 gpio-52  PTZ-V Phase C       ) out lo
 gpio-53  PTZ-V Phase B       ) out lo
 gpio-57  IRCUT 1             ) out lo
 gpio-58  IRCUT 2             ) out lo
 gpio-59  PTZ-V Phase D       ) out lo
 gpio-61  PTZ-H Phase D       ) out lo
 gpio-62  PTZ-H Phase C       ) out lo
 gpio-63  PTZ-H Phase B       ) out lo

GPIOs 64-95, GPIO C:
 gpio-64  PTZ-V Phase A       ) out lo
 ```

#### Modules

```
[@Ingenic-uc1_1:root]# lsmod
ptzCtrl 14693 2 - Live 0xc05bf000 (O)
audio 71526 1 - Live 0xc05a0000 (O)
sensor_sc2336_t31 8418 0 - Live 0xc057e000 (O)
sinfo 9574 0 - Live 0xc0573000 (O)
tx_isp_t31 962822 1 sensor_sc2336_t31, Live 0xc045e000 (O)
avpu 13463 2 - Live 0xc0341000 (O)
gpioCtrl 10912 3 - Live 0xc032a000 (O)
atbm603x_ht20_sdio 827109 0 - Live 0xc0247000 (O)
mmc_block 24526 2 - Live 0xc012c000
jzmmc_v12 15451 1 atbm603x_ht20_sdio, Live 0xc0119000
mmc_core 85246 3 atbm603x_ht20_sdio,mmc_block,jzmmc_v12, Live 0xc00f5000
exfat 102741 0 - Live 0xc00b6000 (O)
```

#### Processes

```
[@Ingenic-uc1_1:root]# ps
  PID USER       VSZ STAT COMMAND
    1 0         1716 S    {linuxrc} init
    2 0            0 SW   [kthreadd]
    3 0            0 SW   [ksoftirqd/0]
    4 0            0 SW   [kworker/0:0]
    5 0            0 SW<  [kworker/0:0H]
    7 0            0 SW   [rcu_preempt]
    8 0            0 SW   [rcu_bh]
    9 0            0 SW   [rcu_sched]
   10 0            0 SW   [watchdog/0]
   11 0            0 SW<  [khelper]
   12 0            0 SW<  [writeback]
   13 0            0 SW<  [bioset]
   14 0            0 SW<  [kblockd]
   15 0            0 SW   [khubd]
   17 0            0 SW<  [cfg80211]
   18 0            0 SW   [kswapd0]
   19 0            0 SW   [fsnotify_mark]
   20 0            0 SW<  [crypto]
   34 0            0 SW<  [deferwq]
   35 0            0 SW   [kworker/u2:1]
   36 0            0 SW<  [kworker/0:1H]
   65 0            0 SWN  [jffs2_gcd_mtd4]
   67 0         1716 S    -sh
   83 0            0 SW   [kworker/u2:2]
   94 0            0 SW<  [phy0-atbm_wq]
   95 0            0 SW   [phy0-atbm_bh]
   96 0            0 SW   [phy0-sdio_tx]
   97 0            0 SW   [phy0-sdio_rx]
   98 0            0 SW   [ksdioirqd/mmc1]
  118 0         1264 S    /bin/shellcmdD
  119 0         9464 S    /bin/shellcmdD
  122 0            0 SW   [mmcqd/0]
  151 0            0 SW   [irq/37-isp-m0]
  153 0            0 SW   [irq/38-isp-w02]
  186 0         1704 S    {boa.sh} /bin/sh /mnt/mtd/bin/boa.sh
  187 0         1708 S    {daemon.sh} /bin/sh /mnt/mtd/bin/daemon.sh
  188 0         425m S    {main} /mnt/mtd/bin/initApp
  189 0         1060 S    /mnt/mtd/bin/boa
  205 0            0 DW   [isp_fw_process]
  356 0         2428 S    /bin/hostapd /var/hostapd.conf -B
  358 0         1716 S    /usr/sbin/udhcpd -f /etc/udhcpd.conf
 1053 0            0 SW   [kworker/0:2]
 1690 0            0 SW   [kworker/0:1]
 1994 0            0 SW   [kworker/0:3]
 2126 0         1708 R    ps
```

### OpenIPC

```
fw_setenv gpio_mmc_cd 50
fw_setenv gpio_wlan 47
fw_setenv wlandev atbm603x-generic
fw_setenv wlanssid <wifi ssid>
fw_setenv wlanpass <wifi password>
cli -s .isp.blkCnt 1
sleep 3
reboot
```

Save this as `autoconfig.sh` on a microSD card and reboot camera with it to apply the commands. The file will be deleted afterwards.


**Motors:**
 
`modprobe motor hmaxstep=3700 vmaxstep=1000 hst1=49 hst2=63 hst3=62 hst4=61 vst1=64 vst2=53 vst3=52 vst4=59`

