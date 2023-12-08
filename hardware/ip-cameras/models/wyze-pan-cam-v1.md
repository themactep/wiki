Wyze Pan Cam V1 / Xiaomi Dafang
-------------------------------

- Model: WYZECP1
- FCC ID: 2ANJHWYZECP1
- IC IC: 24984WYZECP1
- SoC: Ingenic T20X
- Sensor: JX-F22
- Flash: cFeon 25QH128A  
- WiFi: RTL8189FTV or RTL8189ETV (8189es)

### Specs

- Resolution: 1920x1080
- Lens: F2.3
- Angle of view: 120°
- LED: 6 x 940 nm, 0.5 W
- Pan angle: 360°
- Tilt angle: 93°
- Voice: Two-way audio
- Wi-Fi: 802.11 b/g/n 2.4 GHz
- Storage: Micro SD card up to 32GB
- Power Supply: 5V DC 2A
- Dimensions: 127.5 x 60 x 60 mm
- Weight: 249 g

### UART

View from the front of the camera.

```
 |  o  <- G
 |  o  <- T
 | [o] <- R
 +----------
```
Pitch 2.0 mm.


### Boot Log

```
U-Boot SPL 2013.07 (Jul 05 2018 - 13:33:27)
pll_init:365
l2cache_clk = 375000000
pll_cfg.pdiv = 8, pll_cfg.h2div = 4, pll_cfg.h0div = 4, pll_cfg.cdiv = 1, pll_cfg.l2div = 3
nf=36 nr = 1 od0 = 1 od1 = 1
cppcr is 02404900
CPM_CPAPCR 0470890d
nf=42 nr = 1 od0 = 1 od1 = 1
cppcr is 02a04900
CPM_CPMPCR 07d0c90d
nf=50 nr = 1 od0 = 1 od1 = 1
cppcr is 03204900
CPM_CPVPCR 0320490d
cppcr 0x9a794410
apll_freq 860160000
mpll_freq 1000000000
vpll_freq = 1200000000
ddr sel mpll, cpu sel apll
ddrfreq 500000000
cclk  860160000
l2clk 286720000
h0clk 250000000
h2clk 250000000
pclk  125000000
DDRC_DLP:0000f003
```
```
U-Boot 2013.07 (Jul 05 2018 - 13:33:27)

Board: ISVP (Ingenic XBurst T20 SoC)
DRAM:  128 MiB
Top of RAM usable for U-Boot at: 84000000
Reserving 399k for U-Boot at: 83f9c000
Reserving 32784k for malloc() at: 81f98000
Reserving 32 Bytes for Board Info at: 81f97fe0
Reserving 124 Bytes for Global Data at: 81f97f64
Reserving 128k for boot params() at: 81f77f64
Stack Pointer at: 81f77f48
Now running in RAM - U-Boot at: 83f9c000
MMC:   msc: 0
the manufacturer 1c
SF: Detected FM25Q64

*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
misc_init_r before change the wifi_enable_gpio
gpio_request lable = wifi_enable_gpio gpio = 62
misc_init_r after gpio_request the wifi_enable_gpio ret is 62
misc_init_r after change the wifi_enable_gpio ret is 0
misc_init_r before change the yellow_gpio
gpio_request lable = yellow_gpio gpio = 38
misc_init_r after gpio_request the yellow_gpio ret is 38
misc_init_r after change the yellow_gpio ret is 0
misc_init_r before change the blue_gpio
gpio_request lable = blue_gpio gpio = 39
misc_init_r after gpio_request the blue_gpio ret is 39
misc_init_r after change the blue_gpio ret is 1
gpio_request lable = night_gpio gpio = 81
misc_init_r after gpio_request the night_gpio ret is 81
misc_init_r after change the night_gpio ret is 0
gpio_request lable = night_gpio gpio = 25
misc_init_r after gpio_request the night_gpio ret is 25
misc_init_r after change the night_gpio ret is 0
gpio_request lable = night_gpio gpio = 49
misc_init_r after gpio_request the night_gpio ret is 49
misc_init_r after change the night_gpio ret is 0
gpio_request lable = USB_able_gpio gpio = 47
misc_init_r after gpio_request the USB_able_gpio ret is 47
misc_init_r after change the USB_able_gpio ret is 1
gpio_request lable = TF_able_gpio gpio = 43
misc_init_r after gpio_request the TF_able_gpio ret is 43
misc_init_r after change the TF_able_gpio ret is 1
gpio_request lable = SPK_able_gpio gpio = 63
misc_init_r after gpio_request the SPK_able_gpio ret is 63
misc_init_r after change the SPK_able_gpio ret is 0
gpio_request lable = SD_able_gpio gpio = 48
misc_init_r after gpio_request the SD_able_gpio ret is 48
misc_init_r after change the SD_able_gpio ret is 0
misc_init_r before change the wifi_enable_gpio
gpio_request lable = wifi_enable_gpio gpio = 62
misc_init_r after gpio_request the wifi_enable_gpio ret is 62
misc_init_r after change the wifi_enable_gpio ret is 1
Hit any key to stop autoboot:  1 ... 0
jiabo_do_auto_update!!!!!!!!!!!!!!!!!!!!!!!!
gpio_request lable = sdupgrade gpio = 46
the manufacturer 1c
SF: Detected FM25Q64

jiabo_update_to_flash!!!!!!!!!!!!!!!!!!!!!!!!
jiabo_au_do_update!!!!!!!!!!!!!!!!!!!!!!!!
start=0
start=40000
len=40000
flash check read...
FWGRADEUP not find !!!!!!!!!
gradeup check fail!!!!!!!!!!!!!!!!!!!
the manufacturer 1c
SF: Detected FM25Q64

Erasing SPI flash...addr align as 10000 !
sfc erase error
the manufacturer 1c
SF: Detected FM25Q64

--->probe spend 4 ms
SF: 2621440 bytes @ 0x40000 Read: OK
--->read spend 381 ms
## Booting kernel from Legacy Image at 80600000 ...
   Image Name:   Linux-3.10.14
   Image Type:   MIPS Linux Kernel Image (lzma compressed)
   Data Size:    1844117 Bytes = 1.8 MiB
   Load Address: 80010000
   Entry Point:  803f7280
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK
   
Starting kernel ...
```
```
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 3.10.14 (xiaoyongjian@xiaoyongjian-virtual-machine) (gcc version 4.7.2 (Ingenic r2.3.3 2016.12) ) #6 PREEMPT Mon Jun 22 14:42:59 CST 2020
[    0.000000] bootconsole [early0] enabled
[    0.000000] CPU0 RESET ERROR PC:FDA6FA81
[    0.000000] CPU0 revision is: 00d00101 (Ingenic Xburst)
[    0.000000] FPU revision is: 00b70000
[    0.000000] CCLK:860MHz L2CLK:430Mhz H0CLK:200MHz H2CLK:200Mhz PCLK:100Mhz
[    0.000000] Determined physical RAM map:
[    0.000000]  memory: 0053b000 @ 00010000 (usable)
[    0.000000]  memory: 00035000 @ 0054b000 (usable after init)
[    0.000000] User-defined physical RAM map:
[    0.000000]  memory: 06800000 @ 00000000 (usable)
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x00000000-0x067fffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x00000000-0x067fffff]
[    0.000000] Primary instruction cache 32kB, 8-way, VIPT, linesize 32 bytes.
[    0.000000] Primary data cache 32kB, 8-way, VIPT, no aliases, linesize 32 bytes
[    0.000000] pls check processor_id[0x00d00101],sc_jz not support!
[    0.000000] MIPS secondary cache 128kB, 8-way, linesize 32 bytes.
[    0.000000] Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 26416
[    0.000000] Kernel command line: console=ttyS1,115200n8 mem=104M@0x0 ispmem=8M@0x6800000 rmem=16M@0x7000000 init=/linuxrc rootfstype=squashfs root=/dev/mtdblock2 rw mtdparts=jz_sfc:256k(boot),2048k(kernel),3392k(root),640k(driver),4736k(appfs),2048k(ba
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Memory: 99300k/106496k available (4032k kernel code, 7196k reserved, 1321k data, 212k init, 0k highmem)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000] NR_IRQS:418
[    0.000000] clockevents_config_and_register success.
[    0.000024] Calibrating delay loop... 858.52 BogoMIPS (lpj=4292608)
[    0.087751] pid_max: default: 32768 minimum: 301
[    0.092736] Mount-cache hash table entries: 512
[    0.097838] Initializing cgroup subsys debug
[    0.102100] Initializing cgroup subsys freezer
[    0.109193] regulator-dummy: no parameters
[    0.113482] NET: Registered protocol family 16
[    0.135531] bio: create slab <bio-0> at 0
[    0.141858] jz-dma jz-dma: JZ SoC DMA initialized
[    0.147118] SCSI subsystem initialized
[    0.151046] usbcore: registered new interface driver usbfs
[    0.156630] usbcore: registered new interface driver hub
[    0.162062] usbcore: registered new device driver usb
[    0.167368] i2c-gpio i2c-gpio.1: using pins 57 (SDA) and 58 (SCL)
[    0.173570]  (null): set:249  hold:250 dev=100000000 h=500 l=500
[    0.179716] media: Linux media interface: v0.10
[    0.184269] Linux video capture interface: v2.00
[    0.191069] Switching to clocksource jz_clocksource
[    0.196026] cfg80211: Calling CRDA to update world regulatory domain
[    0.203124] jz-dwc2 jz-dwc2: cgu clk gate get error
[    0.208062] jz-dwc2 jz-dwc2: regulator vbus get error
[    0.213146] DWC IN OTG MODE
[    0.366397] sft id =========================off
[    0.370996] dwc2 dwc2: Keep PHY ON
[    0.374385] dwc2 dwc2: Using Buffer DMA mode
[    0.578530] dwc2 dwc2: Core Release: 3.00a
[    0.582652] dwc2 dwc2: DesignWare USB2.0 High-Speed Host Controller
[    0.588982] dwc2 dwc2: new USB bus registered, assigned bus number 1
[    0.596372] hub 1-0:1.0: USB hub found
[    0.600111] hub 1-0:1.0: 1 port detected
[    0.604267] dwc2 dwc2: DWC2 Host Initialized
[    0.608759] NET: Registered protocol family 2
[    0.613738] TCP established hash table entries: 1024 (order: 1, 8192 bytes)
[    0.620765] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
[    0.627244] TCP: Hash tables configured (established 1024 bind 1024)
[    0.633698] TCP: reno registered
[    0.636895] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.642850] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.649464] NET: Registered protocol family 1
[    0.654183] RPC: Registered named UNIX socket transport module.
[    0.660116] RPC: Registered udp transport module.
[    0.664950] RPC: Registered tcp transport module.
[    0.669652] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.676692] freq_udelay_jiffys[0].max_num = 10
[    0.681119] cpufreq  udelay  loops_per_jiffy
[    0.685586] dwc2 dwc2: ID PIN CHANGED!
[    0.689363] init DWC as A_HOST
[    0.692465] 12000     59885   59885
[    0.695688] 24000     119771  119771
[    0.699131] 60000     299428  299428
[    0.702766] 120000    598857  598857
[    0.706223] 200000    998095  998095
[    0.709754] 300000    1497142         1497142
[    0.713499] 600000    2994285         2994285
[    0.717171] 792000    3952457         3952457
[    0.720879] 1008000   5030400         5030400
[    0.724689] 1200000   5988571         5988571
[    0.734088] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.740947] jffs2: version 2.2. (NAND) © 2001-2006 Red Hat, Inc.
[    0.747543] msgmni has been set to 193
[    0.752781] io scheduler noop registered
[    0.756718] io scheduler cfq registered (default)
[    0.763398] jz-uart.1: ttyS1 at MMIO 0x10031000 (irq = 58) is a uart1
[    0.771589] console [ttyS1] enabled, bootconsole disabled
[    0.771589] console [ttyS1] enabled, bootconsole disabled
[    0.786822] brd: module loaded
[    0.792080] loop: module loaded
[    0.796229] zram: Created 2 device(s) ...
[    0.800476] logger: created 256K log 'log_main'
[    0.805872] jz SADC driver registeres over!
[    0.811195] jz TCU driver register completed
[    0.816440] the id code = 1c7018, the flash name is EN25QH128A
[    0.822534] JZ SFC Controller for SFC channel 0 driver register
[    0.828699] 11 cmdlinepart partitions found on MTD device jz_sfc
[    0.834959] Creating 11 MTD partitions on "jz_sfc":
[    0.840017] 0x000000000000-0x000000040000 : "boot"
[    0.845579] 0x000000040000-0x000000240000 : "kernel"
[    0.851233] 0x000000240000-0x000000590000 : "root"
[    0.856789] 0x000000590000-0x000000630000 : "driver"
[    0.862537] 0x000000630000-0x000000ad0000 : "appfs"
[    0.868151] 0x000000ad0000-0x000000cd0000 : "backupk"
[    0.873971] 0x000000cd0000-0x000000d70000 : "backupd"
[    0.879755] 0x000000d70000-0x000000f70000 : "backupa"
[    0.885597] 0x000000f70000-0x000000fb0000 : "config"
[    0.891338] 0x000000fb0000-0x000000ff0000 : "para"
[    0.896941] 0x000000ff0000-0x000001000000 : "flag"
[    0.902414] SPI NOR MTD LOAD OK
[    0.905788] tun: Universal TUN/TAP device driver, 1.6
[    0.911024] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
[    0.917587] usbcore: registered new interface driver zd1201
[    0.923437] usbcore: registered new interface driver r8152
[    0.929202] usbcore: registered new interface driver usb-storage
[    0.935578] usbcore: registered new interface driver usbserial
[    0.941662] usbcore: registered new interface driver usbserial_generic
[    0.948495] usbserial: USB Serial support registered for generic
[    0.954789] usbcore: registered new interface driver ch341
[    0.960503] usbserial: USB Serial support registered for ch341-uart
[    0.967053] usbcore: registered new interface driver cp210x
[    0.972875] usbserial: USB Serial support registered for cp210x
[    0.979054] usbcore: registered new interface driver ftdi_sio
[    0.985066] usbserial: USB Serial support registered for FTDI USB Serial Device
[    0.992761] usbcore: registered new interface driver pl2303
[    0.998567] usbserial: USB Serial support registered for pl2303
[    1.505713] i8042: i8042 controller selftest timeout
[    1.511356] jzmmc_v1.2 jzmmc_v1.2.0: vmmc regulator missing
[    1.552588] jzmmc_v1.2 jzmmc_v1.2.0: register success!
[    1.557978] jzmmc_v1.2 jzmmc_v1.2.1: vmmc regulator missing
[    1.603523] jzmmc_v1.2 jzmmc_v1.2.1: register success!
[    1.608993] hidraw: raw HID events driver (C) Jiri Kosina
[    1.614880] usbcore: registered new interface driver usbhid
[    1.620656] usbhid: USB HID core driver
[    1.624730] Netfilter messages via NETLINK v0.30.
[    1.629662] nf_conntrack version 0.5.0 (1551 buckets, 6204 max)
[    1.636423] ip_tables: (C) 2000-2006 Netfilter Core Team
[    1.642034] TCP: cubic registered
[    1.645520] NET: Registered protocol family 17
[    1.651157] input: gpio-keys as /devices/platform/gpio-keys/input/input0
[    1.658388] drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
[    1.669060] VFS: Mounted root (squashfs filesystem) readonly on device 31:2.
[    1.676868] Freeing unused kernel memory: 212K (8054b000 - 80580000)
[    1.815805] dwc2 dwc2:  ++OTG Interrupt: A-Device Timeout Change++
mdev is ok......
*****************************************
*   root password updated Nov 03, 2023  *
*****************************************


Ingenic-uc1_1 login: Updating device time to:
Fri Nov  3 02:19:36 EDT 2023
################################
######## this is dafang ########
################################
[    3.573172] register all isp device successfully!
[    3.582599] @@@@ tx-isp-probe ok @@@@@
[    3.632225] exFAT: Version 1.2.9
[    3.673485] motor_probe [ChenX @ Hualai Technologies]
[    3.678729] Hualai motor driver version: MT20180918g
[    3.705554] jz_pwm_probe[198] d_name = tcu_chn0
[    3.722108] request pwm channel 0 successfully
[    3.729573] pwm-jz pwm-jz: jz_pwm_probe register ok !
[    3.769029] jz_codec_register: probe() successful!
[    4.122926] dma dma0chan24: Channel 24 have been requested.(phy id 7,type 0x06 desc a47a8000)
[    4.132182] dma dma0chan25: Channel 25 have been requested.(phy id 6,type 0x06 desc a4874000)
[    4.619010] RTL871X: module init start
[    4.622953] RTL871X: rtl8189es v4.3.18.3_20185.20161116_pmpinclu_mac_monitor_minMem_EDCA542B_pbyr
[    4.632150] RTL871X: build time: May 26 2020 12:44:31
[    4.637457] wlan power on
[    4.652986] RTL871X: module init ret=0
[    4.709930] mmc1: new SDIO card at address 0001
[    4.726242] bFWReady == _FALSE call reset 8051...
[    4.754408] RTL871X: rtw_ndev_init(wlan0) if1 mac_addr=34:75:63:c5:e3:30
ifconfig: SIOCSIFADDR: No such device
route: SIOCADDRT: Network is unreachable
kernel.core_pattern = |/system/bin/ucoredmp_collector.sh --pid %p --signal %s --name %e --time %t --output-dir /media/mmc/cores
kernel.core_pipe_limit = 1
net.unix.max_dgram_qlen = 128
[    9.453919] jffs2: warning: (54) jffs2_do_read_inode_internal: Truncating ino #67 to 576972 bytes failed because it only had 59908 bytes to start with!
iCamera is Running
[   17.132261] name : i2c-gpio1 nr : 1
[   17.136023] name : i2c0 nr : 0
[   17.200076]  sensor_read: addr=0xa value = 0xf
[   17.205108]  sensor_read: addr=0xb value = 0x22
[   17.270758]  sensor_read: addr=0xa value = 0xf
[   17.275901]  sensor_read: addr=0xb value = 0x22
[   17.280676] info: success sensor find : jxf22
[   17.285251] misc sinfo_release
[   18.075151] set sensor gpio as PA-low-10bit
[   18.108273] jxf22 0-0040: jxf22 chip found @ 0x40 (i2c0)
[   18.113805] tx_isp: Registered sensor subdevice jxf22 0-0040
[   19.012244] ###### image_tuning_v4l2_open 4219 #######
[   19.467152] &&& chan1  scaler.max_width = 1920 max_height = 1080  min_width = 128 min_height = 128 &&&
[   19.772648] &&& chan2  scaler.max_width = 800 max_height = 800  min_width = 128 min_height = 128 &&&
[   20.192511] codec_set_device: set device: MIC...
[   20.932519] codec_set_device: set device: speaker...
[   22.112788] ==> rtl8188e_iol_efuse_patch
[   23.980341] [motor_speed1090] speed:900, level:15
[   23.987458] motor_ops_reset948
[   29.293322] RTL871X: rtw_cmd_thread: DriverStopped(True) SurpriseRemoved(False) break at line 564
[   29.316704] RTL871X: rtw_dev_unload: driver not in IPS
[   30.232780] ==> rtl8188e_iol_efuse_patch
[   36.664919] RTL871X: rtw_set_802_11_connect(wlan0)  fw_state=0x00000008
[   36.738454] RTL871X: start auth
[   36.744681] RTL871X: auth success, start assoc
[   36.754865] RTL871X: assoc success
[   36.768307] RTL871X: recv eapol packet
[   36.868566] RTL871X: send eapol packet
[   36.888020] RTL871X: recv eapol packet
[   36.904500] RTL871X: send eapol packet
[   36.926798] RTL871X: set pairwise key camid:4, addr:8a:d8:1b:dd:3e:c8, kid:0, type:AES
[   36.941426] RTL871X: set group key camid:5, addr:8a:d8:1b:dd:3e:c8, kid:1, type:AES
```
### U-Boot Shell

`Ctrl-C` brings U-Boot shell, no password needed.

```
isvp_t20# <INTERRUPT>
isvp_t20# help
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
printenv- print environment variables
reset   - Perform RESET of the CPU
run     - run commands in an environment variable
saveenv - save environment variables to persistent storage
sdupdate- auto upgrade file from mmc to flash
setenv  - set environment variables
sf      - SPI flash sub-system
sleep   - delay execution for some time
source  - run script from memory
version - print monitor, compiler and linker version

isvp_t20# printenv 
baudrate=115200
bootargs=console=ttyS1,115200n8 mem=104M@0x0 ispmem=8M@0x6800000 rmem=16M@0x7000000 init=/linuxrc rootfstype=squashfs root=/dev/mtdblock2 rw mtdparts=jz_sfc:256k(boot),2048k(kernel),3392k(root),640k(driver),4736k(appfs),2048k(backupk),640k(backupd),2048k(backupa),256k(config),256k(para),-(flag)
bootcmd=sdupdate;sf probe;sf read 0x80600000 0x40000 0x280000; bootm 0x80600000
bootdelay=1
ethaddr=00:11:22:33:44:55
gatewayip=193.169.4.1
ipaddr=193.169.4.81
loads_echo=1
netmask=255.255.255.0
serverip=193.169.4.2
stderr=serial
stdin=serial
stdout=serial

Environment size: 596/16380 bytes
```

### GPIO

- 25 - night_gpio (from uboot)
- 38 - yellow_gpio (from uboot)
- 39 - blue_gpio (from uboot)
- 43 - TF_able_gpio (from uboot)
- 46 - sdupgrade (from uboot)
- 47 - USB_able_gpio (from uboot)
- 48 - SD_able_gpio (from uboot)
- 49 - night_gpio (from uboot)
- 61 - WiFI ???
- 62 - wifi_enable_gpio (from uboot)
- 63 - SPK_able_gpio (from uboot)
- 77 - USB drive enable ???
- 81 - night_gpio (from uboot)

#### Motors
```
hmaxstep 2590
vmaxstep 710

wifi 62
spk 63
usb able 47
night 25/49/81
blue 38
yellow 39

horiz
    36h → 54
    35h → 53
    34h → 52
    33h → 51
vert
    4Bh → 75
    4Ch → 76
    4Fh → 79
    50h → 80
```

## Linux

`root:$6$wyzecampan$iH01lm9SqCfUrc4.Jjp3BLUErTGiiB.pBk/60XuPYxQo7uZIoBjwUrCcoGeesbTa1EP5N/DC1a/GOMVW8qUVY1:10933:0:99999:7:::`
