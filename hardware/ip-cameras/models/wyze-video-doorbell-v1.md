Wyze Video Doorbell V1
----------------------

- Model: WVDB1
- Input: 16VAC-24VAC, >=10VA
- FCC ID: [2AUIUWVDB1A](https://fccid.io/2AUIUWVDB1/)
- IC: 25466-WVDB1A
- SoC: T31ZX
- Sensor: SC4236
- Flash: ZB25VQ128
- WiFi: RTL8189FTV SDIO

### Stock FW

__/etc/shadow__
```
root:$6$1RvTcQLM$1K7XwU1HABg1rQQyB99kdHceeqiEsnGfWN3FecCgmc7vnpAL8wxdAzsbLVbLSCXsBRuwVVSnWnVqKDu2a.rw7/:17942:0:99999:7:::
```

#### Boot log
```
U-Boot SPL 2013.07 (Mar 03 2021 - 16:12:04)
Timer init
CLK stop
PLL init
pll_init:366
pll_cfg.pdiv = 10, pll_cfg.h2div = 5, pll_cfg.h0div = 5, pll_cfg.cdiv = 1, pll_cfg.l2div = 2
nf=116 nr = 1 od0 = 1 od1 = 2
cppcr is 07405100
CPM_CPAPCR 0740510d
nf=100 nr = 1 od0 = 1 od1 = 2
cppcr is 06405100
CPM_CPMPCR 0640510d
nf=100 nr = 1 od0 = 1 od1 = 2
cppcr is 06405100
CPM_CPVPCR 0640510d
cppcr 0x9a7b5510
apll_freq 1392000000
mpll_freq 1200000000
vpll_freq = 1200000000
ddr sel mpll, cpu sel apll
ddrfreq 600000000
cclk  1392000000
l2clk 696000000
h0clk 240000000
h2clk 240000000
pclk  120000000
CLK init
SDRAM init
sdram init start
ddr_inno_phy_init ..!
phy reg = 0x00000007, CL = 0x00000007
ddr_inno_phy_init ..! 11:  00000004
ddr_inno_phy_init ..! 22:  00000006
ddr_inno_phy_init ..! 33:  00000006
REG_DDR_LMR: 00000210
REG_DDR_LMR: 00000310
REG_DDR_LMR: 00000110
REG_DDR_LMR, MR0: 00f73011
T31_0x5: 00000007
T31_0x15: 0000000c
T31_0x4: 00000000
T31_0x14: 00000002
INNO_TRAINING_CTRL 1: 00000000
INNO_TRAINING_CTRL 2: 000000a1
T31_cc: 00000003
INNO_TRAINING_CTRL 3: 000000a0
T31_118: 0000003c
T31_158: 0000003c
T31_190: 0000001f
T31_194: 0000001e
jz-04 :  0x00000051
jz-08 :  0x000000a0
jz-28 :  0x00000024
DDR PHY init OK
INNO_DQ_WIDTH   :00000003
INNO_PLL_FBDIV  :00000014
INNO_PLL_PDIV   :00000005
INNO_MEM_CFG    :00000051
INNO_PLL_CTRL   :00000018
INNO_CHANNEL_EN :0000000d
INNO_CWL        :00000006
INNO_CL         :00000007
DDR Controller init
DDRC_STATUS         0x80000001
DDRC_CFG            0x0ae88a42
DDRC_CTRL           0x0000891c
DDRC_LMR            0x00400008
DDRC_DLP            0x00000000
DDRC_TIMING1        0x050f0a06
DDRC_TIMING2        0x021c0a07
DDRC_TIMING3        0x200a0722
DDRC_TIMING4        0x26240031
DDRC_TIMING5        0xff060405
DDRC_TIMING6        0x321c0505
DDRC_REFCNT         0x00911903
DDRC_MMAP0          0x000020f8
DDRC_MMAP1          0x00002800
DDRC_REMAP1         0x03020100
DDRC_REMAP2         0x07060504
DDRC_REMAP3         0x0b0a0908
DDRC_REMAP4         0x0f0e0d0c
DDRC_REMAP5         0x13121110
DDRC_AUTOSR_EN      0x00000000
sdram init finished
SDRAM init ok
board_init_r

image entry point: 0x80100000

U-Boot 2013.07 (Mar 03 2021 - 16:12:04)
Board: ISVP (Ingenic XBurst T31 SoC)
DRAM:  128 MiB
Top of RAM usable for U-Boot at: 84000000
Reserving 412k for U-Boot at: 83f98000
Reserving 32784k for malloc() at: 81f94000
Reserving 32 Bytes for Board Info at: 81f93fe0
Reserving 124 Bytes for Global Data at: 81f93f64
Reserving 128k for boot params() at: 81f73f64
Stack Pointer at: 81f73f48
Now running in RAM - U-Boot at: 83f98000
MMC:   msc: 0
the manufacturer 5e
SF: Detected ZB25VQ128
```
#### GPIO
```
misc_init_r before change the wifi_enable_gpio
gpio_request lable = wifi_enable_gpio gpio = 57
misc_init_r after gpio_request the wifi_enable_gpio ret is 57
misc_init_r after change the wifi_enable_gpio ret is 0
misc_init_r before change the yellow_gpio
gpio_request lable = yellow_gpio gpio = 38
misc_init_r after gpio_request the yellow_gpio ret is 38
misc_init_r after change the yellow_gpio ret is 1
misc_init_r before change the blue_gpio
gpio_request lable = blue_gpio gpio = 39
misc_init_r after gpio_request the blue_gpio ret is 39
misc_init_r after change the blue_gpio ret is 0
misc_init_r before change the white_gpio
gpio_request lable = white_gpio gpio = 49
misc_init_r after gpio_request the white_gpio ret is 49
misc_init_r after change the white_gpio ret is 0
gpio_request lable = SPK_able_gpio gpio = 58
misc_init_r after gpio_request the SPK_able_gpio ret is 58
misc_init_r after change the SPK_able_gpio ret is 0
gpio_request lable = SD_cd_gpio gpio = 62
misc_init_r after gpio_request the SD_cd_gpio ret is 62
misc_init_r after change the SD_cd_gpio ret is 1
misc_init_r before change the wifi_enable_gpio
gpio_request lable = wifi_enable_gpio gpio = 57
misc_init_r after gpio_request the wifi_enable_gpio ret is 57
misc_init_r after change the wifi_enable_gpio ret is 1
```
#### Kernel
```
--->probe spend 5 ms
SF: 2621440 bytes @ 0x40000 Read: OK
--->read spend 842 ms
## Booting kernel from Legacy Image at 80600000 ...
   Image Name:   Linux-3.10.14__isvp_swan_1.0__
   Image Type:   MIPS Linux Kernel Image (lzma compressed)
   Data Size:    1696009 Bytes = 1.6 MiB
   Load Address: 80010000
   Entry Point:  803ab950
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK

Starting kernel ...

[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 3.10.14__isvp_swan_1.0__ (xuxuequan@ubuntu) (gcc version 4.7.2 (Ingenic r2.3.3 2016.12) ) #17 PREEMPT Mon Dec 23 09:43:27 CST 2019
[    0.000000] bootconsole [early0] enabled
[    0.000000] CPU0 RESET ERROR PC:38807010
[    0.000000] CPU0 revision is: 00d00100 (Ingenic Xburst)
[    0.000000] FPU revision is: 00b70000
[    0.000000] CCLK:1392MHz L2CLK:696Mhz H0CLK:200MHz H2CLK:200Mhz PCLK:100Mhz
[    0.000000] Determined physical RAM map:
[    0.000000]  memory: 004c8000 @ 00010000 (usable)
[    0.000000]  memory: 00038000 @ 004d8000 (usable after init)
[    0.000000] User-defined physical RAM map:
[    0.000000]  memory: 05200000 @ 00000000 (usable)
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x00000000-0x051fffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x00000000-0x051fffff]
[    0.000000] Primary instruction cache 32kB, 8-way, VIPT, linesize 32 bytes.
[    0.000000] Primary data cache 32kB, 8-way, VIPT, no aliases, linesize 32 bytes
[    0.000000] pls check processor_id[0x00d00100],sc_jz not support!
[    0.000000] MIPS secondary cache 128kB, 8-way, linesize 32 bytes.
[    0.000000] Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 20828
[    0.000000] Kernel command line: console=ttyS1,115200n8 mem=82M@0x0 rmem=46M@0x5200000 init=/linuxrc rootfstype=squashfs root=/dev/mtdblock2 rw mtdparts=jz_sfc:256k(boot),2048k(kernel),3392k(root),640k(driver),4736k(appfs),4736k(backupa),256k(config),256k(para),-(flag)
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Memory: 77220k/83968k available (3729k kernel code, 6748k reserved, 1163k data, 224k init, 0k highmem)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1       ```
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000] NR_IRQS:358
[    0.000000] clockevents_config_and_register success.
[    0.000015] Calibrating delay loop... 1391.00 BogoMIPS (lpj=6955008)
[    0.087832] pid_max: default: 32768 minimum: 301
[    0.092693] Mount-cache hash table entries: 512
[    0.097639] Initializing cgroup subsys debug
[    0.101898] Initializing cgroup subsys freezer
[    0.108102] regulator-dummy: no parameters
[    0.112294] NET: Registered protocol family 16
[    0.126376] bio: create slab <bio-0> at 0
[    0.131863] jz-dma jz-dma: JZ SoC DMA initialized
[    0.136866] usbcore: registered new interface driver usbfs
[    0.142380] usbcore: registered new interface driver hub
[    0.147860] usbcore: registered new device driver usb
[    0.153013]  (null): set:249  hold:250 dev=100000000 h=500 l=500
[    0.159151] media: Linux media interface: v0.10
[    0.163690] Linux video capture interface: v2.00
[    0.169731] Switching to clocksource jz_clocksource
[    0.175134] cfg80211: Calling CRDA to update world regulatory domain
[    0.181543] jz-dwc2 jz-dwc2: cgu clk gate get error
[    0.186478] DWC IN OTG MODE
[    0.189915] dwc2 dwc2: Keep PHY ON
[    0.193280] dwc2 dwc2: Using Buffer DMA mode
[    0.197630] dwc2 dwc2: Core Release: 3.00a
[    0.201790] dwc2 dwc2: DesignWare USB2.0 High-Speed Host Controller
[    0.208136] dwc2 dwc2: new USB bus registered, assigned bus number 1
[    0.215197] hub 1-0:1.0: USB hub found
[    0.218928] hub 1-0:1.0: 1 port detected
[    0.222978] dwc2 dwc2: DWC2 Host Initialized
[    0.227451] NET: Registered protocol family 2
[    0.232197] TCP established hash table entries: 1024 (order: 1, 8192 bytes)
[    0.239248] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
[    0.245653] TCP: Hash tables configured (established 1024 bind 1024)
[    0.252120] TCP: reno registered
[    0.255364] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.261270] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.267818] NET: Registered protocol family 1
[    0.272404] RPC: Registered named UNIX socket transport module.
[    0.278389] RPC: Registered udp transport module.
[    0.283100] RPC: Registered tcp transport module.
[    0.287878] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.294727] freq_udelay_jiffys[0].max_num = 10
[    0.299150] cpufreq  udelay  loops_per_jiffy
[    0.303574] dwc2 dwc2: ID PIN CHANGED!
[    0.307431] 12000     59956   59956
[    0.310629] 24000     119913  119913
[    0.314072] 60000     299784  299784
[    0.317605] 120000    599569  599569
[    0.321057] 200000    999282  999282
[    0.324589] 300000    1498924         1498924
[    0.328380] 600000    2997848         2997848
[    0.332008] 792000    3957159         3957159
[    0.335735] 1008000   5036385         5036385
[    0.339513] 1200000   5995696         5995696
[    0.347138] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.353641] jffs2: version 2.2. © 2001-2006 Red Hat, Inc.
[    0.359463] msgmni has been set to 150
[    0.364131] io scheduler noop registered
[    0.368141] io scheduler cfq registered (default)
[    0.373906] jz-uart.0: ttyS0 at MMIO 0x10030000 (irq = 59) is a uart0
[    0.380560] jz-uart.1: ttyS1 at MMIO 0x10031000 (irq = 58) is a uart1
[    0.388122] console [ttyS1] enabled, bootconsole disabled
[    0.388122] console [ttyS1] enabled, bootconsole disabled
[    0.401838] brd: module loaded
[    0.406434] loop: module loaded
[    0.410095] zram: Created 2 device(s) ...
[    0.414290] logger: created 256K log 'log_main'
[    0.419554] jz TCU driver register completed
[    0.424254] the id code = 5e4018, the flash name is ZB25VQ128
[    0.430236] JZ SFC Controller for SFC channel 0 driver register
[    0.436376] 9 cmdlinepart partitions found on MTD device jz_sfc
[    0.442480] Creating 9 MTD partitions on "jz_sfc":
[    0.447450] 0x000000000000-0x000000040000 : "boot"
[    0.452803] 0x000000040000-0x000000240000 : "kernel"
[    0.458327] 0x000000240000-0x000000590000 : "root"
[    0.463610] 0x000000590000-0x000000630000 : "driver"
[    0.469152] 0x000000630000-0x000000ad0000 : "appfs"
[    0.474543] 0x000000ad0000-0x000000f70000 : "backupa"
[    0.480174] 0x000000f70000-0x000000fb0000 : "config"
[    0.485715] 0x000000fb0000-0x000000ff0000 : "para"
[    0.491014] 0x000000ff0000-0x000001000000 : "flag"
[    0.496404] SPI NOR MTD LOAD OK
[    0.499699] tun: Universal TUN/TAP device driver, 1.6
[    0.504945] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
[    0.511420] usbcore: registered new interface driver zd1201
[    0.517290] usbcore: registered new interface driver usbserial
[    0.523325] usbcore: registered new interface driver ch341
[    0.529046] usbserial: USB Serial support registered for ch341-uart
[    0.535544] usbcore: registered new interface driver pl2303
[    0.541311] usbserial: USB Serial support registered for pl2303
[    0.547670] jzmmc_v1.2 jzmmc_v1.2.0: vmmc regulator missing
[    0.584719] jzmmc_v1.2 jzmmc_v1.2.0: register success!
[    0.590082] jzmmc_v1.2 jzmmc_v1.2.1: vmmc regulator missing
[    0.635660] jzmmc_v1.2 jzmmc_v1.2.1: register success!
[    0.641204] TCP: cubic registered
[    0.644665] NET: Registered protocol family 17
[    0.649902] input: gpio-keys as /devices/platform/gpio-keys/input/input0
[    0.657034] drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
[    0.667685] VFS: Mounted root (squashfs filesystem) readonly on device 31:2.
[    0.675438] Freeing unused kernel memory: 224K (804d8000 - 80510000)
mdev is ok......
No version info
hualai login: 
[    4.792320] @@@@ tx-isp-probe ok(version H20210615a), compiler date=Jun 18 2021 @@@@@
[    4.819887] jz_pwm_probe[218] d_name = tcu_chn0
[    4.825111] jz_pwm_probe[218] d_name = tcu_chn2
[    4.831563] jz_pwm_probe[218] d_name = tcu_chn3
[    4.838059] The version of PWM driver is H20180309a
[    4.849257] request pwm channel 0 successfully
[    4.853872] request pwm channel 2 successfully
[    4.860029] request pwm channel 3 successfully
[    4.865095] pwm-jz pwm-jz: jz_pwm_probe register ok !
[    5.125201] jz_codec_register: probe() successful!
[    5.534906] dma dma0chan24: Channel 24 have been requested.(phy id 7,type 0x06 desc a25c7000)
[    5.544079] dma dma0chan25: Channel 25 have been requested.(phy id 6,type 0x06 desc a25c6000)
[    5.553304] dma dma0chan26: Channel 26 have been requested.(phy id 5,type 0x04 desc a25c5000)
[    5.825744] RTL871X: module init start
[    5.829616] RTL871X: rtl8189ftv v4.3.24.7_21113.20170208.nova.1.01
[    5.837425] RTL871X: build time: Jan 18 2021 17:16:19
[    5.842644] wlan power on
[    5.865014] RTL871X: module init ret=0
[    5.880764] zram0: detected capacity change from 0 to 16777216
Setting up swapspace version 1, size = 16773120 bytes
UUID=6639dd41-c3d7-498e-8544-340ab0a29484
[    5.892764] Adding 16380k swap on /dev/zram0.  Priority:-1 extents:1 across:16380k SS
[    5.912864] mmc1: card claims to support voltages below the defined range. These will be ignored.
[    5.940700] mmc1: new SDIO card at address 0001
[    5.955598] RTL871X: ++++++++rtw_drv_init: vendor=0x024c device=0xf179 class=0x07
[    6.011746] RTL871X: HW EFUSE
[    6.014916] RTL871X: hal_com_config_channel_plan chplan:0x20
=====Welcome login sdk sync shellcall tool=====
[    6.161708] RTL871X: rtw_regsty_chk_target_tx_power_valid return _FALSE for band:0, path:0, rs:0, t:-1
[    6.172374] RTL871X: rtw_ndev_init(wlan0) if1 mac_addr=78:f2:35:9e:68:56
ctx->msgqueueId = 0
111111111111111 ret = 0 0 96
pstCtx->msgID = 32769
[Sinker] don't have config file /etc/config/.sinker_config, taking default configuration
ctx->msgqueueId = 0
[Sinker] Init HttpRequest Instance failed
[Sinker] Init HttpRequest Instance failed
===========welcome to assis process=========
[Build date] Oct 13 2022 (06:34:03)
[exec] msgSndId:65538
[exec] msgRcvId:98307
ctx->msgqueueId = 0
metric_json: {"restart":1}
111111111111111 ret = 0 0 93
[SDK-DOG]dbg: turn on watchdog success!
[12/31/1969 19:00:16]===========welcome to iCamera_app===========
[exec] msgSndId:65538
[exec] msgRcvId:98307
msg productservices/communicate/msg/msg.c,77:[msg]dbg: msg_queue_create() ok  MsgId:32769
[timer]dbg: init complete.
[12/31/1969 19:00:16]watchdog_init() ok  TimerId:1
[12/31/1969 19:00:16]Metric server start
[12/31/1969 19:00:16]Metric msgQueueId create 0
[12/31/1969 19:00:16]Metric msgQueueId init finish
[12/31/1969 19:00:16]Create worker thread
[12/31/1969 19:00:16]pthread_create ret = 0
[12/31/1969 19:00:16]MetricsData recv:: {"metrics_type":"app/hl_client", "metrics_content":{"restart":1}, "metrics_ts":7946}
[12/31/1969 19:00:16]MetricsData recv:: {"metrics_type":"app/assis", "metrics_content":{"restart":1}, "metrics_ts":15869}
[12/31/1969 19:00:16].[1m<Reading> /params/config/.product_config .[0m
[12/31/1969 19:00:16].[1m<Reading> /system/bin/app.ver .[0m
[12/31/1969 19:00:16].[1m<Reading> /etc/config/.user_config .[0m
[PRODUCT] [PRODUCT_TYPE ] [Camera]
[PRODUCT] [PRODUCT_MODEL] [WYZEDB3]
[PRODUCT] [BOARD_TEST   ] [000F]
[PRODUCT] [FACTORY_TEST ] [0000]
[PRODUCT] [HARDWARE_VER ] [P00A0000]
[PRODUCT] [KEY          ] [wesDuQnRObp5uHRIXVdJJw6NFLTAPjZo6gq3lH34bUS57AgBuJrktzKX6TYF]
[PRODUCT] [KEY_CHECKSUM ] [00004023]
[PRODUCT] [CONFIG_INFO  ] [D03F272309EA|73487021|hmmEjQ2hoW5zkrGT|2929]
[PRODUCT] [macAddr      ] [D03F272309EA]
[PRODUCT] [appver       ] [4.25.1.314]
[USERSET] [indicator    ] [1]
[USERSET] [nightVision  ] [2]
[USERSET] [bitRate      ] [180]
[USERSET] [res          ] [1]
[USERSET] [fps          ] [20]
[USERSET] [horSwitch    ] [1]
[USERSET] [verSwitch    ] [1]
[USERSET] [osdSwitch    ] [1]
[USERSET] [logSd        ] [1]
[USERSET] [logUdisk     ] [1]
[USERSET] [telntSwitch  ] [2]
[USERSET] [recordType   ] [1]
[USERSET] [MASwitch     ] [2]
[USERSET] [MALevel      ] [5]
[USERSET] [AASwitch     ] [2]
[USERSET] [AALevel      ] [5]
[USERSET] [SASwitch     ] [2]
[USERSET] [CASwitch     ] [2]
[USERSET] [TBStart      ] [0]
[USERSET] [TBDuration   ] [1440]
[USERSET] [drawBoxSwitch] [1]
[USERSET] [timezone     ] [-4]
[USERSET] [MMALevel     ] [150]
[USERSET] [AMALevel     ] [100]
[USERSET] [MAT          ] [0]
[USERSET] [AST          ] [1]
[USERSET] [motionTrack  ] [2]
[USERSET] [motionCruisin] [2]
[USERSET] [AASX         ] [25]
[USERSET] [AASY         ] [25]
[USERSET] [AALX         ] [50]
[USERSET] [AALY         ] [50]
[USERSET] [motionback   ] [1]
[USERSET] [slide_x      ] [0]
[USERSET] [slide_y      ] [0]
[USERSET] [preset_x     ] [0]
[USERSET] [preset_y     ] [0]
[USERSET] [ubootflag    ] [0]
[USERSET] [exposureModel] [0]
[USERSET] [limit_max_x  ] [0]
[USERSET] [limit_min_x  ] [0]
[USERSET] [limit_max_y  ] [0]
[USERSET] [limit_min_y  ] [0]
[USERSET] [motor_limit  ] [0]
[USERSET] [resoluselect ] [1]
[USERSET] [low_bitrate  ] [30]
[USERSET] [watermark_flag] [0]
[USERSET] [speaker_vol  ] [50]
[USERSET] [pir_alaram   ] [0]
[USERSET] [alarmDate    ] [255]
[USERSET] [alarmInterval] [180]
[USERSET] [storage_device] [1]
[USERSET] [white_switch ] [2]
[USERSET] [white_brightness] [100]
[USERSET] [white_face_switch] [1]
[USERSET] [faceSwtich   ] [2]
[USERSET] [osdLogoSwitch] [1]
[USERSET] [firstBindFlag] [0]
[USERSET] [chime_voice  ] [6]
[USERSET] [chime_music  ] [1]
[USERSET] [chime_times  ] [1]
[USERSET] [chime_bucket_start] [960]
[USERSET] [chime_bucket_duration] [1440]
[USERNET] [ssid         ] [themactep]
[USERNET] [password     ] [**********]
[USERNET] [wifiType     ] [5]
[USERNET] [p2pid        ] [YYAEKRPFZ2YFE589111A]
[USERNET] [r_encr       ] [fa4J36UFYGHcLnMN]
[USERNET] [sub1gMac     ] []
timezone string set to [EST+0500EDT+0400,M3.2.0/02:00:00,M11.1.0/02:00:00]
mutilApartBase64Len is 0
no mutil apart alarm config

----------------------------------------
    WELCOME TO LOCALSDK      ('_)')
----------------------------------------
    platform: ingenict31
    version : SDK20190612d
    update  : Oct 13 2022 (06:33:44)
----------------------------------------
[   17.439827] name : i2c0 nr : 0
[SDK-GPIO]dbg: Pin(39)  Lvl(0)  Dir(out)
[SDK-GPIO]dbg: Pin(38)  Lvl(0)  Dir(out)
[SDK-GPIO]dbg: Pin(53)  Lvl(0)  Dir(out)
[SDK-GPIO]dbg: Pin(52)  Lvl(0)  Dir(out)
[SDK-GPIO]dbg: Pin(6)  Lvl(1)  Dir(in)
[SDK-GPIO]dbg: Pin(7)  Lvl(1)  Dir(in)
[SDK-GPIO]dbg: Pin(61)  Lvl(1)  Dir(out)
[SDK-THREAD]dbg: Platform Thread Create OK!  ('_)')
[SDK-THREAD]dbg: Platform Thread Create OK!  ('_)')
dbg: (local_sdk_set_major_error_callback) Doing...
[localsdk_get_version][5]
[12/31/1969 19:00:17][init_local_sdk] localsdk version:5
[12/31/1969 19:00:17][init_local_sdk] localsdk version:5
[SDK-THREAD]dbg: Platform Thread Start...
[   17.535243]  sensor_read: addr=0x3107 value = 0x32
[   17.540891]  sensor_read: addr=0x3108 value = 0x35
[   17.545889] info: success sensor find : sc4236
[   17.550487] misc sinfo_release
##### sensor type: sc4236 #####
[   18.256800] probe ok ------->sc4236
[   18.315240] -----sc4236_detect: 494 ret = 0, v = 0x32
[   18.321081] -----sc4236_detect: 502 ret = 0, v = 0x35
[   18.326317] sc4236 chip found @ 0x30 (i2c0)
[Sinker] Init HttpRequest Instance failed
---- FPGA board is ready ----
  Board UID : 30AB6E51
  Board HW ID : 72000460
  Board rev.  : 5DE5A975
  Board date  : 20190326
-----------------------------
##### sensor fps: 20 #####
dbg: Enc_thread(chn0) create OK!  ('_)')
[SDK-OSD]dbg: layer[0] is Enable...
sdkosd.c 229 channel:0 time_x_StartingPoint:1633 time_y_StartingPoint:0
[SDK-OSD]dbg: layer[1] is Enable...
sdkosd.c 278 channel:0 time_x_StartingPoint:1633 time_y_StartingPoint:0
[SDK-OSD]dbg: layer[2] is Enable...
sdkosd.c 254 channel:0 time_x_StartingPoint:1633 time_y_StartingPoint:0
[SDK-OSD]dbg: layer[3] is Enable...
[SDK-THREAD]dbg: Set Video Enc Callback Doing...
channel:0
channel:0
pEncConfig->index:0
!! The specified ScalingList is not allowed; it will be adjusted!!
dbg: Encoder Chn0 Thread Start...
channel:0
channel:0
[SDK-OSD]dbg: layer[0] create OK...
[SDK-OSD]dbg: layer[1] create OK...
[SDK-OSD]dbg: layer[2] create OK...
[SDK-OSD]dbg: layer[3] create OK...
ivsenable channel:0 pFsConfig->algoEnable:0 pCb->pfunc:0
FS channel:0 tmpGrpCellIndex:0
OSD channel:0 tmpGrpCellIndex:1
ENC channel:0 tmpGrpCellIndex:2
channel:0 i:1 tmpGrpCellIndex:3
dbg: IMP_System_Bind(chn0) [FS]--bind->[OSD] OK!
channel:0 i:2 tmpGrpCellIndex:3
dbg: IMP_System_Bind(chn0) [OSD]--bind->[ENC] OK!
dbg: start fs chn0...
dbg: start enc chn0...
dbg: Enc_thread(chn1) create OK!  ('_)')
[SDK-OSD]dbg: layer[0] is Enable...
sdkosd.c 229 channel:1 time_x_StartingPoint:595 time_y_StartingPoint:0
[SDK-OSD]dbg: layer[1] is Enable...
sdkosd.c 278 channel:1 time_x_StartingPoint:595 time_y_StartingPoint:0
[SDK-OSD]dbg: layer[2] is Enable...
sdkosd.c 254 channel:1 time_x_StartingPoint:595 time_y_StartingPoint:0
[SDK-OSD]dbg: layer[3] is Enable...
[SDK-THREAD]dbg: Set Video Enc Callback Doing...
[SDK-THREAD]dbg: Set Video Enc Callback Doing...
channel:1
channel:1
pEncConfig->index:1
!! The specified ScalingList is not allowed; it will be adjusted!!
dbg: Encoder Chn1 Thread Start...
channel:1
channel:1
[SDK-OSD]dbg: layer[0] create OK...
[SDK-OSD]dbg: layer[1] create OK...
[SDK-OSD]dbg: layer[2] create OK...
[SDK-OSD]dbg: layer[3] create OK...
ivsenable channel:1 pFsConfig->algoEnable:0 pCb->pfunc:0
FS channel:1 tmpGrpCellIndex:0
OSD channel:1 tmpGrpCellIndex:1
ENC channel:1 tmpGrpCellIndex:2
channel:1 i:1 tmpGrpCellIndex:3
dbg: IMP_System_Bind(chn1) [FS]--bind->[OSD] OK!
channel:1 i:2 tmpGrpCellIndex:3
dbg: IMP_System_Bind(chn1) [OSD]--bind->[ENC] OK!
dbg: start fs chn1...
dbg: start enc chn1...
dbg: stop enc chn1...
dbg: stop fs chn1...
dbg: Yuv_thread(chn2) create OK!  ('_)')
dbg: YUV Chn2 Thread Start...
dbg: Enc_thread(chn2) create OK!  ('_)')
[SDK-OSD]dbg: layer[0] is Enable...
sdkosd.c 229 channel:2 time_x_StartingPoint:595 time_y_StartingPoint:0
[SDK-OSD]dbg: layer[1] is Enable...
sdkosd.c 278 channel:2 time_x_StartingPoint:595 time_y_StartingPoint:0
[SDK-OSD]dbg: layer[2] is Enable...
sdkosd.c 254 channel:2 time_x_StartingPoint:595 time_y_StartingPoint:0
[SDK-OSD]dbg: layer[3] is Enable...
[SDK-THREAD]dbg: Set Video Enc Callback Doing...
channel:2
channel:2
pEncConfig->index:2
!! The specified ScalingList is not allowed; it will be adjusted!!
dbg: Encoder Chn2 Thread Start...
channel:2
channel:2
channel:2
[set_osd_layer_handler] err: pls free old handler [0] before to set [8] new
[SDK-OSD]dbg: layer[0] create OK...
[set_osd_layer_handler] err: pls free old handler [0] before to set [9] new
[SDK-OSD]dbg: layer[1] create OK...
[set_osd_layer_handler] err: pls free old handler [0] before to set [10] new
[SDK-OSD]dbg: layer[2] create OK...
[set_osd_layer_handler] err: pls free old handler [0] before to set [11] new
[SDK-OSD]dbg: layer[3] create OK...
ivsenable channel:2 pFsConfig->algoEnable:1 pCb->pfunc:0
ivsenable channel:2
FS channel:2 tmpGrpCellIndex:0
IVS channel:2 tmpGrpCellIndex:1
OSD channel:2 tmpGrpCellIndex:2
ENC channel:2 tmpGrpCellIndex:3
channel:2 i:1 tmpGrpCellIndex:4
dbg: IMP_System_Bind(chn2) [FS]--bind->[IVS] OK!
channel:2 i:2 tmpGrpCellIndex:4
dbg: IMP_System_Bind(chn2) [IVS]--bind->[OSD] OK!
channel:2 i:3 tmpGrpCellIndex:4
dbg: IMP_System_Bind(chn2) [OSD]--bind->[ENC] OK!
dbg: start fs chn2...
dbg: start enc chn2...
dbg: start yuv chn2...
[SDK-AUDIO]dbg: Audio Thread(chn0) create OK!  ('_)')
[SDK-THREAD]dbg: Set Audio Enc Callback Doing...
[SDK-THREAD]dbg: Set Video PCM Callback Doing...
[SDK-THREAD]dbg: Set Video PCM Callback Doing...
[SDK-AUDIO]dbg: Audio Thread(chn0) Start...
[   20.724626] codec_set_device: set device: MIC...
[   21.120435] SPEAKERCTL_MODE2!!!!!!!!!!!!!!!!!!!
[local_sdk_speaker_init]: ioctl = 0
[   21.364644] codec_set_device: set device: speaker...
[SDK-SPKER]dbg: speaker volume: 60
[SDK-SPKER]dbg: speaker gain: 27
[netServ]dbg: Set net_state Callback Doing...
[12/31/1969 19:00:21]wifi sta mode....
[12/31/1969 19:00:21]ssid: xxxxxxxx
[12/31/1969 19:00:21]passwd: xxxxxxxx
[12/31/1969 19:00:22]dhcp doing...
shellcall/shellcall.c,453:[exec]cmd:killall -9 wpa_supplicant;killall -9 udhcpc;killall -9 udhcpd;killall -9 hostapd;killall -9 telnetd;ifconfig wlan0 0.0.0.0
shellcall/shellcall.c,401:cmd=[killall -9 wpa_supplicant;killall -9 udhcpc;killall -9 udhcpd;killall -9 hostapd;killall -9 telnetd;ifconfig wlan0 0.0.0.0]
##dbg## (local_sdk_swith_sta) func return...
[SDK-THREAD]dbg: Set night_state Callback Doing...
<>===================< IRcut on >==================<>
killall: wpa_supplicant: no process killed
killall: udhcpc: no process killed
killall: udhcpd: no process killed
killall: hostapd: no process killed
killall: telnetd: no process killed
(local_sdk_close_night_light) =======================stateFlag:2, LastState:0
[SDK-THREAD]dbg: Set Video YUV Callback Doing...
[SDK-THREAD]dbg: Set setup_keydown Callback Doing...
[SDK-THREAD]dbg: Set reset_keydown Callback Doing...
[SDK-THREAD]dbg: Set setup_keydown Callback Doing...
[12/31/1969 19:00:22]devmonitor/devmonitor.c,31:======monitor_fd:25======
event/event.c,49:EVENT_READABLE
event/event.c,73:Event Add OK[fd=25], evnets[1]
[12/31/1969 19:00:22]devmonitor/devmonitor.c,42:dev_monitor_init complete.
motion alarm switch : 2
[12/31/1969 19:00:22][sub1g]tty_info.fd0=26
[sub1g]sub1g_init:ttyS0 open success
_________________ Write (len:8) ________________
SndData:0xaa 0x55 0x53 0x04 0x14 0xff 0x02 0x69
==================pst->photoPwmDuty = 0
<>===================< IRcut off >=================<>
[DONGLE_RECORD->productservices/sub1g/sub1g.c,825]:dongle_stop_net_work
_________________ Write (len:8) ________________
SndData:0xaa 0x55 0x53 0x04 0x1c 0x00 0x01 0x72
---sub1g_get_dongle_version---
0xaa 0x55 0x53 0x03 0x16 0x01 0x6b
---end---
_________________ Write (len:8) ________________
SndData:0xaa 0x55 0x53 0x03 0x16 0x01 0x6b 0x00
[sub1g]Send success!  nSndLen=8
shellcall/shellcall.c,453:[exec]cmd:cp -f /system/etc/wpa_supplicant.conf /tmp/
shellcall/shellcall.c,401:cmd=[cp -f /system/etc/wpa_supplicant.conf /tmp/]
[netServ]exec: wpa_supplicant -D nl80211 -i wlan0 -c /tmp/wpa_supplicant.conf -B;wpa_cli -a /system/bin/wifi_monitor.sh &
RcvData:
0x55 0xaa 0x53 0x14 0xff 0x02 0x65 0x55
0xaa 0x53 0x03 0x15 0x01 0x6a 0x55 0xaa
0x53 0x1c 0xff 0x02 0x6d 0x55 0xaa 0x53
0x03 0x1d 0x01 0x72 0x55 0xaa 0x53 0x16
0xff 0x02 0x67 0x55 0xaa 0x53 0x1c 0x17
0x30 0x2e 0x30 0x2e 0x30 0x2e 0x35 0x37
0x20 0x56 0x31 0x2e 0x34 0x20 0x44 0x6f
0x6e 0x67 0x6c 0x65 0x20 0x55 0x44 0x33
0x55 0x07 0xce
[Sinker] mac address d03f272309ea
[Sinker] Get enr successfully
[Sinker] Curl return code 6
[Sinker] Get processes from domain https://api.wyzecam.com, status 2
[Sinker] Failed to get processes for version latest
led_light_do_action:whiteLedState3
led_light_do_action:actionTmp:1 brightnessStart:0 brightnessEnd:0
(local_sdk_close_night_light) =======================stateFlag:2, LastState:2
white_led_init complete
Successfully initialized wpa_supplicant
rfkill: Cannot open RFKILL control device
nl80211: Could not re-add multicast membership for vendor events: -2 (No such file or directory)
[netServ]dbg: wifi connect...
Selected interface 'wlan0'
[netServ]dbg: wifi connect...
[   27.843126] RTL871X: rtw_set_802_11_connect(wlan0)  fw_state=0x00000008
[   27.908412] RTL871X: start auth
[   27.914052] RTL871X: auth success, start assoc
[   27.924181] RTL871X: assoc success
[netServ]dbg: wifi connect...
[   28.945863] RTL871X: recv eapol packet
[   28.950654] RTL871X: send eapol packet
[   28.970320] RTL871X: recv eapol packet
[   28.974936] RTL871X: send eapol packet
[   28.987222] RTL871X: set pairwise key camid:4, addr:84:d8:1b:dd:3e:c8, kid:0, type:AES
[   29.001916] RTL871X: set group key camid:5, addr:84:d8:1b:dd:3e:c8, kid:1, type:AES
[/system/bin/wifi_monitor.sh][derek]wifi conencted\n
[Sinker] Curl return code 6
[Sinker] Get processes from domain https://api.wyzecam.com, status 2
[Sinker] Failed to get processes for version latest
[netServ]dbg: wifi connect...
shellcall/shellcall.c,453:[exec]cmd:wpa_cli blacklist clear
shellcall/shellcall.c,401:cmd=[wpa_cli blacklist clear]
[netServ]exec: udhcpc -t 10 -i wlan0 -p /var/run/udhcpc.pid -b &
udhcpc (v1.22.1) started
Sending discover...
Sending select for 192.168.1.161...
Lease of 192.168.1.161 obtained, lease time 300
deleting routers
adding dns 192.168.1.53
adding dns 192.168.1.1
check_wifi_dhcp_ok:ip obtained
[12/31/1969 19:00:29]Current network dhcp ok...
[ping statistics]5 transmitted, 5 received, 0% lost
[12/31/1969 19:00:30]ping:ip[142.251.41.36] 0 lost
[netServ]dbg: gateway: 192.168.1.1
[netServ]dbg: ip addr: 192.168.1.161
@@@ localsdk wifi STA mode ok @@@
[12/31/1969 19:00:30]Current network connect ok...
[hlntp][productservices/NTP/hl_ntp.c:311]NTP success! set time to: 1686804095
[06/15/2023 00:41:35](hlcloud_init) ntp finished
[hlcloud][...cloud_common.c:228]dbg: server_domain: api.wyzecam.com
[hlcloud][...cloud_common.c:248]dbg: hlcloud initialized success
DEBUG:curl_post L#174 https://api.wyzecam.com:8443/device/system/get_p2pid, curl_easy_perform res 0, code 200, totaltime 1.493, connecttime 0.096
[06/15/2023 00:41:36]put metrics:{"metrics_type":"connectivity/curlPost","metrics_content":{"url":"api.wyzecam.com:8443/device/system/get_p2pid", "respCode":200, "totalTime":1.493, "connectTime": 0.096}, "metrics_ts":1686804096501}
[SET USERNET] [p2pid] [YYAEKRPFZ2YFE589111A]
{"mac":"D03F272309EA","enr":"fa4J36UFYGHcLnMN","product_model":"WYZEDB3","product_type":"Camera","hardware_ver":"P00A0000","firmware_ver":"4.25.1.314","sc":"3d8e3e9018b44c8792cf21d49ab54fec","sv":"4e0dc251ae4243b4857fe3898b3fe7a1","ts":1686804096,"ssid":"themactep","ip":"192.168.1.161"}
DEBUG:curl_post L#174 https://api.wyzecam.com:8443/device/system/set_device_info, curl_easy_perform res 0, code 200, totaltime 0.860, connecttime 0.095
[06/15/2023 00:41:37]put metrics:{"metrics_type":"connectivity/curlPost","metrics_content":{"url":"api.wyzecam.com:8443/device/system/set_device_info", "respCode":200, "totalTime":0.860, "connectTime": 0.095}, "metrics_ts":1686804097389}
DEBUG:curl_post L#174 https://api.wyzecam.com:8443/device/system/get_iot_certificate, curl_easy_perform res 0, code 200, totaltime 0.557, connecttime 0.096
[06/15/2023 00:41:37]put metrics:{"metrics_type":"connectivity/curlPost","metrics_content":{"url":"api.wyzecam.com:8443/device/system/get_iot_certificate", "respCode":200, "totalTime":0.557, "connectTime": 0.096}, "metrics_ts":1686804097963}
[hlcloud][..._certificate.c:134]dbg: [username]:[]
[hlcloud][..._certificate.c:148]dbg: [password]:[]
[hlcloud][..._certificate.c:162]dbg: [ClientID]:[d03f272309ea]
[hlcloud][..._certificate.c:182]dbg: [keepAlive]:[300]
[hlcloud][..._certificate.c:201]dbg: [ready to download client cert] URL:https://wyze-iot.s3-us-west-2.amazonaws.com/iot_cert_files/client/wyzedb3/d03f272309ea/8e03817646-certificate.pem.crt?X-Amz-Expires=1200&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJM5QPBNDBHJBMYQA/20230615/us-west-2/s3/aws4_request&X-Amz-Date=20230615T044138Z&X-Amz-SignedHeaders=host&X-Amz-Signature=0c10ac2ebe50ea9e9afa0ddd1fb2fb2ce04a40fd4992fe915730c38021b741a9
* STATE: INIT => CONNECT handle 0xd09620; line 1654 (connection #-5000)
* Added connection 0. The cache now contains 1 members
* STATE: CONNECT => WAITRESOLVE handle 0xd09620; line 1700 (connection #0)
* family0 == v4, family1 == v6
*   Trying 52.92.133.18:443...
* STATE: WAITRESOLVE => WAITCONNECT handle 0xd09620; line 1782 (connection #0)
* Connected to wyze-iot.s3-us-west-2.amazonaws.com (52.92.133.18) port 443 (#0)
* STATE: WAITCONNECT => SENDPROTOCONNECT handle 0xd09620; line 1848 (connection #0)
* Marked for [keep alive]: HTTP default
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*  CAfile: /system/bin/cacert.pem
*  CApath: none
* STATE: SENDPROTOCONNECT => PROTOCONNECT handle 0xd09620; line 1866 (connection #0)
* SSL connection using TLSv1.2 / ECDHE-RSA-AES128-GCM-SHA256
* ALPN, server accepted to use http/1.1
* Server certificate:
*  subject: CN=*.s3-us-west-2.amazonaws.com
*  start date: Apr 11 00:00:00 2023 GMT
*  expire date: Dec 28 23:59:59 2023 GMT
*  subjectAltName: host "wyze-iot.s3-us-west-2.amazonaws.com" matched cert's "*.s3-us-west-2.amazonaws.com"
*  issuer: C=US; O=Amazon; CN=Amazon RSA 2048 M01
*  SSL certificate verify ok.
* STATE: PROTOCONNECT => DO handle 0xd09620; line 1885 (connection #0)
> GET /iot_cert_files/client/wyzedb3/d03f272309ea/8e03817646-certificate.pem.crt?X-Amz-Expires=1200&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJM5QPBNDBHJBMYQA/20230615/us-west-2/s3/aws4_request&X-Amz-Date=20230615T044138Z&X-Amz-SignedHeaders=host&X-Amz-Signature=0c10ac2ebe50ea9e9afa0ddd1fb2fb2ce04a40fd4992fe915730c38021b741a9 HTTP/1.1
Host: wyze-iot.s3-us-west-2.amazonaws.com
Accept: */*
* STATE: DO => DO_DONE handle 0xd09620; line 1940 (connection #0)
* STATE: DO_DONE => PERFORM handle 0xd09620; line 2061 (connection #0)
* Mark bundle as not supporting multiuse
* HTTP 1.1 or later with persistent connection
< HTTP/1.1 200 OK
< x-amz-id-2: pYq8C7KQTo2Q30yMl0e2P+zHThOCUqQblFqoMLCYemkzfGLYHwKVUVg2SjOLEY1vLh8yZdgce/Q=
< x-amz-request-id: ACBZQWM7PEPB958C
< Date: Thu, 15 Jun 2023 04:41:39 GMT
< Last-Modified: Mon, 22 Nov 2021 03:25:04 GMT
< ETag: "79bc048f00588a84886def3a8575fce7"
< Accept-Ranges: bytes
< Content-Type: application/octet-stream
< Server: AmazonS3
< Content-Length: 1220
<
* STATE: PERFORM => DONE handle 0xd09620; line 2251 (connection #0)
* multi_done
* Connection #0 to host wyze-iot.s3-us-west-2.amazonaws.com left intact
* Expire cleared (transfer 0xd09620)
curl_easy_perform ret:0
[hlcloud][..._certificate.c:204]dbg: download client cert url success
[hlcloud][..._certificate.c:238]dbg: [ready to download client private key] URL:https://wyze-iot.s3-us-west-2.amazonaws.com/iot_cert_files/client/wyzedb3/d03f272309ea/8e03817646-private.pem.key?X-Amz-Expires=1200&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJM5QPBNDBHJBMYQA/20230615/us-west-2/s3/aws4_request&X-Amz-Date=20230615T044138Z&X-Amz-SignedHeaders=host&X-Amz-Signature=8c89f0fa3425119865a4c9bd895dbdf6626957027cba923c49c70ea35f5e0c27
* STATE: INIT => CONNECT handle 0xd09620; line 1654 (connection #-5000)
* Added connection 0. The cache now contains 1 members
* STATE: CONNECT => WAITRESOLVE handle 0xd09620; line 1700 (connection #0)
* family0 == v4, family1 == v6
*   Trying 52.92.133.18:443...
* STATE: WAITRESOLVE => WAITCONNECT handle 0xd09620; line 1782 (connection #0)
* Connected to wyze-iot.s3-us-west-2.amazonaws.com (52.92.133.18) port 443 (#0)
* STATE: WAITCONNECT => SENDPROTOCONNECT handle 0xd09620; line 1848 (connection #0)
* Marked for [keep alive]: HTTP default
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*  CAfile: /system/bin/cacert.pem
*  CApath: none
* STATE: SENDPROTOCONNECT => PROTOCONNECT handle 0xd09620; line 1866 (connection #0)
* SSL connection using TLSv1.2 / ECDHE-RSA-AES128-GCM-SHA256
* ALPN, server accepted to use http/1.1
* Server certificate:
*  subject: CN=*.s3-us-west-2.amazonaws.com
*  start date: Apr 11 00:00:00 2023 GMT
*  expire date: Dec 28 23:59:59 2023 GMT
*  subjectAltName: host "wyze-iot.s3-us-west-2.amazonaws.com" matched cert's "*.s3-us-west-2.amazonaws.com"
*  issuer: C=US; O=Amazon; CN=Amazon RSA 2048 M01
*  SSL certificate verify ok.
* STATE: PROTOCONNECT => DO handle 0xd09620; line 1885 (connection #0)
> GET /iot_cert_files/client/wyzedb3/d03f272309ea/8e03817646-private.pem.key?X-Amz-Expires=1200&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJM5QPBNDBHJBMYQA/20230615/us-west-2/s3/aws4_request&X-Amz-Date=20230615T044138Z&X-Amz-SignedHeaders=host&X-Amz-Signature=8c89f0fa3425119865a4c9bd895dbdf6626957027cba923c49c70ea35f5e0c27 HTTP/1.1
Host: wyze-iot.s3-us-west-2.amazonaws.com
Accept: */*
* STATE: DO => DO_DONE handle 0xd09620; line 1940 (connection #0)
* STATE: DO_DONE => PERFORM handle 0xd09620; line 2061 (connection #0)
* Mark bundle as not supporting multiuse
* HTTP 1.1 or later with persistent connection
< HTTP/1.1 200 OK
< x-amz-id-2: roileqEZiwIzuBdLwunqSHA5xeqB3hra4Luxc5SGqxoWPsokBKH1PE6UK8PJ2YbtZSHWJ8tIi9E=
< x-amz-request-id: 4NDR0YR4KK76VX70
< Date: Thu, 15 Jun 2023 04:41:40 GMT
< Last-Modified: Mon, 22 Nov 2021 03:25:04 GMT
< ETag: "8fefe601f288576c595523ac13acd0b5"
< Accept-Ranges: bytes
< Content-Type: application/octet-stream
< Server: AmazonS3
< Content-Length: 1679
<
* STATE: PERFORM => DONE handle 0xd09620; line 2251 (connection #0)
* multi_done
* Connection #0 to host wyze-iot.s3-us-west-2.amazonaws.com left intact
* Expire cleared (transfer 0xd09620)
curl_easy_perform ret:0
[hlcloud][..._certificate.c:241]dbg: download client private key success
[hlcloud][..._certificate.c:275]dbg: [ready to download root cert] URL:https://wyze-iot.s3-us-west-2.amazonaws.com/iot_cert_files/server/VeriSign-Class-3-Public-Primary-Certification-Authority-G5.pem?X-Amz-Expires=1200&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJM5QPBNDBHJBMYQA/20230615/us-west-2/s3/aws4_request&X-Amz-Date=20230615T044138Z&X-Amz-SignedHeaders=host&X-Amz-Signature=969b6e1408cfa9f636423000c4ef7aa0a003fde2bc5a98cb3a421300dd1d9e1c
* STATE: INIT => CONNECT handle 0xd18250; line 1654 (connection #-5000)
* Added connection 0. The cache now contains 1 members
* STATE: CONNECT => WAITRESOLVE handle 0xd18250; line 1700 (connection #0)
* family0 == v4, family1 == v6
*   Trying 3.5.82.144:443...
* STATE: WAITRESOLVE => WAITCONNECT handle 0xd18250; line 1782 (connection #0)
* Connected to wyze-iot.s3-us-west-2.amazonaws.com (3.5.82.144) port 443 (#0)
* STATE: WAITCONNECT => SENDPROTOCONNECT handle 0xd18250; line 1848 (connection #0)
* Marked for [keep alive]: HTTP default
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*  CAfile: /system/bin/cacert.pem
*  CApath: none
* STATE: SENDPROTOCONNECT => PROTOCONNECT handle 0xd18250; line 1866 (connection #0)
[Sinker] Get processes from domain https://api.wyzecam.com, status 0
[Sinker] Parsed component launch.sh, version 1.0.2.3
[Sinker] Parsed component webrtc_1_0_2_3.tar.gz, version 1.0.2.3
[Sinker] Got 1 processes from cloud
[Sinker] Get latest version processes succeeded
* SSL connection using TLSv1.2 / ECDHE-RSA-AES128-GCM-SHA256
* ALPN, server accepted to use http/1.1
* Server certificate:
*  subject: CN=*.s3-us-west-2.amazonaws.com
*  start date: Apr 11 00:00:00 2023 GMT
*  expire date: Dec 28 23:59:59 2023 GMT
*  subjectAltName: host "wyze-iot.s3-us-west-2.amazonaws.com" matched cert's "*.s3-us-west-2.amazonaws.com"
*  issuer: C=US; O=Amazon; CN=Amazon RSA 2048 M01
*  SSL certificate verify ok.
* STATE: PROTOCONNECT => DO handle 0xd18250; line 1885 (connection #0)
> GET /iot_cert_files/server/VeriSign-Class-3-Public-Primary-Certification-Authority-G5.pem?X-Amz-Expires=1200&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJM5QPBNDBHJBMYQA/20230615/us-west-2/s3/aws4_request&X-Amz-Date=20230615T044138Z&X-Amz-SignedHeaders=host&X-Amz-Signature=969b6e1408cfa9f636423000c4ef7aa0a003fde2bc5a98cb3a421300dd1d9e1c HTTP/1.1
Host: wyze-iot.s3-us-west-2.amazonaws.com
Accept: */*
* STATE: DO => DO_DONE handle 0xd18250; line 1940 (connection #0)
* STATE: DO_DONE => PERFORM handle 0xd18250; line 2061 (connection #0)
* Mark bundle as not supporting multiuse
* HTTP 1.1 or later with persistent connection
< HTTP/1.1 200 OK
< x-amz-id-2: ZYctX0ZlB4ja5ZOlc2bUOqimZZCUtnkT2Y1qt3IZsa0y4eMAKlY4P8RgNdf84oPcQPtbXpjUDeUvKSRf8HIniQ==
< x-amz-request-id: HBH6EWW5CKZ7YS4B
< Date: Thu, 15 Jun 2023 04:41:41 GMT
< Last-Modified: Tue, 02 Jan 2018 08:55:36 GMT
< ETag: "2c1b4b2fd443ee3f9fe2edc46ea797c9"
< Accept-Ranges: bytes
< Content-Type: binary/octet-stream
< Server: AmazonS3
< Content-Length: 1758
<
* STATE: PERFORM => DONE handle 0xd18250; line 2251 (connection #0)
* multi_done
* Connection #0 to host wyze-iot.s3-us-west-2.amazonaws.com left intact
* Expire cleared (transfer 0xd18250)
curl_easy_perform ret:0
[hlcloud][..._certificate.c:278]dbg: download root cert success
[06/15/2023 00:41:40][tutk/tutk.c:339]log: tutk_init start
[06/15/2023 00:41:40][tutk/tutk.c:403]log: tutk_init authkey= 2gmzl5FZ loginInput.auth_key=2gmzl5FZі..<,.}...9ȭ.Afa4J36UFYGHcLnMND03F272309EA uid = YYAEKRPFZ2YFE589111A
[06/15/2023 00:41:40][hl_client] [iot_socket.c:198]accept client connect
[iot] [productservices/communicate/hliot/iot.c:1284]iot_rcv
[06/15/2023 00:41:40][tutk/tutk.c:501]log: IOTC_Initialize2(), success!
[06/15/2023 00:41:40][tutk/tutk.c:507]log: IOTCAPI version[3.4.2.0-0-g519133d_openssl_Mips_T20Z_4.7.2_uclibc] AVAPI version[3.4.2.0-0-g519133d_openssl_Mips_T20Z_4.7.2_uclibc]
[06/15/2023 00:41:40][tutk/tutk.c:538]log: avInitialize(), success!
[06/15/2023 00:41:40]tutk_dev_login_status_cb:info : 1
[06/15/2023 00:41:40][tutk/tutk.c:834]log: I can not connect via Internet!!! [info:1]
[Sinker] Get download location from domain https://api.wyzecam.com, status 0
[Sinker] Parsed component info: name launch.sh, version 1.0.2.3, url https://wyze-sinker-process-prod.s3.us-west-2.amazonaws.com/kvsWebrtcClientMaster/1.0.2.3/launch.sh?X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJNFQFXEM46KZVY7A/20230615/us-west-2/s3/aws4_request&X-Amz-Date=20230615T044140Z&X-Amz-SignedHeaders=host&X-Amz-Signature=93267fb48ea033a0fce39e00f9b71cbeeb2ccf56fab8b55e07e75f2842f60d76
[06/15/2023 00:41:40]tutk_dev_login_status_cb:info : 5
[06/15/2023 00:41:40][tutk/tutk.c:826]log: I can be connected via Internet... [info:5]
[06/15/2023 00:41:40]tutk_dev_login_status_cb:info : 7
[06/15/2023 00:41:40][tutk/tutk.c:826]log: I can be connected via Internet... [info:7]
[06/15/2023 00:41:40][tutk/tutk.c:569]log: IOTC_Device_LoginEx(), success!
fullmotion_init
[KVS] fullmotion init create msgqueue successfully 131076
stream_snd_create:create ok,ready to start
[KVS] fullmotion init stream_snd_create finished
[KVS] fullmotion init stream_get_create finished
kvs_stream start
[06/15/2023 00:41:40]cmc_monitor start
[06/15/2023 00:41:40]cmc_worker:waiting signal
[06/15/2023 00:41:40]begin to download motion_lib
* STATE: INIT => CONNECT handle 0xd5fe10; line 1654 (connection #-5000)
* Added connection 0. The cache now contains 1 members
* STATE: CONNECT => WAITRESOLVE handle 0xd5fe10; line 1700 (connection #0)
* family0 == v4, family1 == v6
*   Trying 52.218.168.105:443...
* STATE: WAITRESOLVE => WAITCONNECT handle 0xd5fe10; line 1782 (connection #0)
* Connected to wyze-file-test.s3-us-west-2.amazonaws.com (52.218.168.105) port 443 (#0)
* STATE: WAITCONNECT => SENDPROTOCONNECT handle 0xd5fe10; line 1848 (connection #0)
* Marked for [keep alive]: HTTP default
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*  CAfile: /system/bin/cacert.pem
*  CApath: none
* STATE: SENDPROTOCONNECT => PROTOCONNECT handle 0xd5fe10; line 1866 (connection #0)
[Sinker] Get response from url https://wyze-sinker-process-prod.s3.us-west-2.amazonaws.com/kvsWebrtcClientMaster/1.0.2.3/launch.sh?X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJNFQFXEM46KZVY7A/20230615/us-west-2/s3/aws4_request&X-Amz-Date=20230615T044140Z&X-Amz-SignedHeaders=host&X-Amz-Signature=93267fb48ea033a0fce39e00f9b71cbeeb2ccf56fab8b55e07e75f2842f60d76, status 0
[Sinker] CheckIntegrity ffff2242494970f2eb3c8310f18c9c51 vs. ffff2242494970f2eb3c8310f18c9c51
[Sinker] Downloaded component: name launch.sh, version 1.0.2.3
* SSL connection using TLSv1.2 / ECDHE-RSA-AES128-GCM-SHA256
* ALPN, server accepted to use http/1.1
* Server certificate:
*  subject: CN=*.s3-us-west-2.amazonaws.com
*  start date: Apr 11 00:00:00 2023 GMT
*  expire date: Dec 28 23:59:59 2023 GMT
*  subjectAltName: host "wyze-file-test.s3-us-west-2.amazonaws.com" matched cert's "*.s3-us-west-2.amazonaws.com"
*  issuer: C=US; O=Amazon; CN=Amazon RSA 2048 M01
*  SSL certificate verify ok.
* STATE: PROTOCONNECT => DO handle 0xd5fe10; line 1885 (connection #0)
> GET /DeviceAlgorithmFile/motionlib_v0.3.tar.gz HTTP/1.1
Host: wyze-file-test.s3-us-west-2.amazonaws.com
Accept: */*
* STATE: DO => DO_DONE handle 0xd5fe10; line 1940 (connection #0)
* STATE: DO_DONE => PERFORM handle 0xd5fe10; line 2061 (connection #0)
* Mark bundle as not supporting multiuse
* HTTP 1.1 or later with persistent connection
< HTTP/1.1 200 OK
< x-amz-id-2: ImuI8NQtI1twS0mFff1q/42fR9Hxy10VN9Nrtjgd1lFocfsjyfOaUxI+IlcxF7OD3lSZq4SX4LA=
< x-amz-request-id: C7SF42THKFCKY5FZ
< Date: Thu, 15 Jun 2023 04:41:42 GMT
< Last-Modified: Wed, 27 Jan 2021 23:22:08 GMT
< ETag: "113d5fe4c80effd329f2c67bdfd8eed6"
< Accept-Ranges: bytes
< Content-Type: application/x-gzip
< Server: AmazonS3
< Content-Length: 836425
<
iot status: 1
iot status: 3
Establishing a TLS session to aws-iot.wyzecam.com:8883.
[Sinker] Get download location from domain https://api.wyzecam.com, status 0
[Sinker] Parsed component info: name webrtc_1_0_2_3.tar.gz, version 1.0.2.3, url https://wyze-sinker-process-prod.s3.us-west-2.amazonaws.com/kvsWebrtcClientMaster/1.0.2.3/webrtc_1_0_2_3.tar.gz?X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJNFQFXEM46KZVY7A/20230615/us-west-2/s3/aws4_request&X-Amz-Date=20230615T044142Z&X-Amz-SignedHeaders=host&X-Amz-Signature=58097ff0f37a3fda417187ffb136f79ed9493e17abf33475e8b6282fc52362c1
ctx->msgqueueId = 0
111111111111111 ret = 0 0 99
[INFO]: [15/06-00:41:42.978][KVS_APP][kvs_func.c::154][KVS] init success
[INFO]: [15/06-00:41:42.990][KVS_APP][kvs_module.c::160]n:0,r:0,e:0,t:12, 0,-1,0,-1
tlsHandshake:357(Network connection 0x4bc498) TLS handshake successful.
Mbedtls_Connect:564(Network connection 0x4bc498) Connection to aws-iot.wyzecam.com established.
MQTT connection successfully established with broker.
iot status: 4
111111111111111 ret = 0 0 108
An MQTT session with broker is re-established. Resending unacked publishes.PUBLISH  sent for topic $aws/things/d03f272309ea/shadow/get to broker with packet ID 1.
[iot] [productservices/communicate/hliot/iot.c:781]hl_client MQTT subtopic success
=========================dtls==========
iot_msg_item_add:new item addr 0x54d0ec
iot_msg_item_add:new item addr 0x54e108
iot_msg_process_loop:get temp[0x54d0ec] next[0x54d0ec] prev[0x54e108]
[iot] [productservices/communicate/hliot/iot.c:1181]msg->cmd:13
[iot] [productservices/communicate/hliot/iot.c:1201]iot_send success :13,{"mac":"D03F272309EA","model":"WYZEDB3","data":{"P18":"1"},"ts":1686804104000}!!
send iot msg:{"P18":"1"}
iot_msg_process_loop:get temp[0x54e108] next[0x54e108] prev[0x54e108]
[iot] [productservices/communicate/hliot/iot.c:1181]msg->cmd:13
[iot] [productservices/communicate/hliot/iot.c:1201]iot_send success :13,{"mac":"D03F272309EA","model":"WYZEDB3","data":{"P1013":"79"},"ts":1686804104000}!!
send iot msg:{"P1013":"79"}
[06/15/2023 00:41:44]msgsend:[{"mac":"D03F272309EA","model":"WYZEDB3","data":{"P18":"1"},"ts":1686804104000}] msg successful
111111111111111 ret = 0 0 109
[06/15/2023 00:41:44]msgsend:[{"mac":"D03F272309EA","model":"WYZEDB3","data":{"P1013":"79"},"ts":1686804104000}] msg successful
111111111111111 ret = 0 0 109
PUBACK received for packet id 1.
[$aws/things/d03f272309ea/shadow/get]send message: result:0
Cleaned up outgoing publish packet with packet id 1.
* STATE: PERFORM => DONE handle 0xd5fe10; line 2251 (connection #0)
* multi_done
* Connection #0 to host wyze-file-test.s3-us-west-2.amazonaws.com left intact
* Expire cleared (transfer 0xd5fe10)
Incoming QOS : 1.Incoming Publish Topic Name: $aws/things/d03f272309ea/shadow/get/accepted matches subscribed topic.
Incoming Publish message Packet Id is 1.
Incoming Publish Message : {"state":{"reported":{"TZ_STR":"EST+0500EDT+0400,M3.2.0/02:00:00,M11.1.0/02:00:00","wyzeService":{"sid_package_detection_doorbell_v1":{"switch":1},"sid_vehicle_detection_doorbell_v1":{"switch":1},"sid_person_detection_doorbell_v1":{"switch":1},"sid_cloud_ai_doorbell_v1":{"switch":1},"sid_pet_detection_doorbell_v1":{"switch":1},"sid_full_motion_doorbell_v1":{"switch":1}},"AI":{"setting":{"image_size":"480P","image_batch_size":3,"image_time_interval":2000,"image_type":"jpg"}}}},"metadata":{"reported":{"TZ_STR":{"timestamp":1686802678},"wyzeService":{"sid_package_detection_doorbell_v1":{"switch":{"timestamp":1686802710}},"sid_vehicle_detection_doorbell_v1":{"switch":{"timestamp":1686802710}},"sid_person_detection_doorbell_v1":{"switch":{"timestamp":1686802710}},"sid_cloud_ai_doorbell_v1":{"switch":{"timestamp":1686802710}},"sid_pet_detection_doorbell_v1":{"switch":{"timestamp":1686802710}},"sid_full_motion_doorbell_v1":{"switch":{"timestamp":1686802710}}},"AI":{"setting":{"image_size":{"timestamp":1686802710},"image_batch_size":{"timestamp":1686802710},"image_time_interval":{"timestamp":1686802710},"image_type":{"timestamp":1686802710}}}}},"version":5,"timestamp":1686804105}.
curl_easy_perform ret:0
shellcall/shellcall.c,453:[exec]cmd:gzip -d /tmp/motionlib.tar.gz;tar -xvf /tmp/motionlib.tar -C /tmp;rm /tmp/motionlib.tar
shellcall/shellcall.c,401:cmd=[gzip -d /tmp/motionlib.tar.gz;tar -xvf /tmp/motionlib.tar -C /tmp;rm /tmp/motionlib.tar]
[iot] [productservices/communicate/hliot/iot.c:1284]iot_rcv
[iot] [productservices/communicate/hliot/iot.c:804]hl_client MQTT publish {"mac":"D03F272309EA","model":"WYZEDB3","data":{"P18":"1"},"ts":1686804104000} success
[iot] [productservices/communicate/hliot/iot.c:804]hl_client MQTT publish {"mac":"D03F272309EA","model":"WYZEDB3","data":{"P1013":"79"},"ts":1686804104000} success
[iot] [productservices/communicate/hliot/iot.c:809]IOT_BACK_CMD_GET_SHADOW
[iot] [productservices/communicate/hliot/iot.c:830]get shadow set aishadowinfo
[06/15/2023 00:41:45]put metrics:{"metrics_type":"ShadowAiSetting","metrics_content":{"image_size":"480P","image_batch_size":3,"image_time_interval":2000,"image_type":"jpg"}, "metrics_ts":1686804105743}
[06/15/2023 00:41:45]image_batch_size 4300648428
[06/15/2023 00:41:45]image_time_interval 2000
[06/15/2023 00:41:45]{"state":{"reported":{"TZ_STR":"EST+0500EDT+0400,M3.2.0/02:00:00,M11.1.0/02:00:00","wyzeService":{"sid_package_detection_doorbell_v1":{"switch":1},"sid_vehicle_detection_doorbell_v1":{"switch":1},"sid_person_detection_doorbell_v1":{"switch":1},"sid_cloud_ai_doorbell_v1":{"switch":1},"sid_pet_detection_doorbell_v1":{"switch":1},"sid_full_motion_doorbell_v1":{"switch":1}},"AI":{"setting":{"image_size":"480P","image_batch_size":3,"image_time_interval":2000,"image_type":"jpg"}}}},"metadata":{"reported":{"TZ_STR":{"timestamp":1686802678},"wyzeService":{"sid_package_detection_doorbell_v1":{"switch":{"timestamp":1686802710}},"sid_vehicle_detection_doorbell_v1":{"switch":{"timestamp":1686802710}},"sid_person_detection_doorbell_v1":{"switch":{"timestamp":1686802710}},"sid_cloud_ai_doorbell_v1":{"switch":{"timestamp":1686802710}},"sid_pet_detection_doorbell_v1":{"switch":{"timestamp":1686802710}},"sid_full_motion_doorbell_v1":{"switch":{"timestamp":1686802710}}},"AI":{"setting":{"image_size":{"timestamp":1686802710},"image_batch_size":{"timestamp":1686802710},"image_time_interval":{"timestamp":1686802710},"image_type":{"timestamp":1686802710}}}}},"version":5,"timestamp":1686804105}
[06/15/2023 00:41:45]iot_shadow_update_handler:enter
paracfg_set_user_config_item(22, -4) param value equal!
[SET TZ_STR] EST+0500EDT+0400,M3.2.0/02:00:00,M11.1.0/02:00:00
[06/15/2023 00:41:45][iot_shadow_update_handler:300]:timezone:-4
[06/15/2023 00:41:45]json_cloudai_switch=1[06/15/2023 00:41:45]json_fullmotion_switch=1[iot] [productservices/communicate/hliot/iot.c:1284]iot_rcv
[06/15/2023 00:41:48]VC_video_move_filter_thread
IVS Version:1.0.5 built: Sep  3 2020 14:15:52
move_filter_ivs_move_start ret= 0
[06/15/2023 00:41:48]move_filter_init() success!
motion sensitivity change to 65
[06/15/2023 00:41:48]net_valid_init finish
upload_ota_st_snd_msg_to_assis_process:begin,cmd=0
/configs/.upgrade_ver not exist, exit
upload_ota_st_snd_msg_to_assis_process:end
[06/15/2023 00:41:48][/backupa/log] does not exist
[Sinker] Get response from url https://wyze-sinker-process-prod.s3.us-west-2.amazonaws.com/kvsWebrtcClientMaster/1.0.2.3/webrtc_1_0_2_3.tar.gz?X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJNFQFXEM46KZVY7A/20230615/us-west-2/s3/aws4_request&X-Amz-Date=20230615T044142Z&X-Amz-SignedHeaders=host&X-Amz-Signature=58097ff0f37a3fda417187ffb136f79ed9493e17abf33475e8b6282fc52362c1, status 0
[Sinker] CheckIntegrity 09353fe892afa634f7aacc96d6aa4c8a vs. 09353fe892afa634f7aacc96d6aa4c8a
[Sinker] Downloaded component: name webrtc_1_0_2_3.tar.gz, version 1.0.2.3
[Sinker] Launched process kvsWebrtcClientMaster
[Sinker] Launch process kvsWebrtcClientMaster successfully
111111111111111 ret = 0 0 226
[Sinker] {"processes":[{"name":"kvsWebrtcClientMaster","version":"1.0.2.3","state":"running","launchFailures":"0","heartbeatMissing":"0"}]}
[KVS Master] Using trickleICE by default
ctx->msgqueueId = 0
Jun 15 00:41:49 kvsWebrtcClientMaster[379]: main(): [KVS Master] Created signaling channel d03f272309ea
Jun 15 00:41:49 kvsWebrtcClientMaster[379]: initKvsWebRtc(): SDK version: 64cd3d7b58e58d6b02726297635742008aa16189
Jun 15 00:41:49 kvsWebrtcClientMaster[379]: sendAndRecv(): Send local data: {"method":"metrics", "version":1,"level": 0, "hitRate": 255, "type": "kvsWebRTCCredential", "content":{"iotCert" : "available"}}
[webrtc_controller] webrtc controller received message {"method":"metrics", "version":1,"level": 0, "hitRate": 255, "type": "kvsWebRTCCredential", "content":{"iotCert" : "available"}}
PUBLISH {"mac":"D03F272309EA","model":"WYZEDB3","data":{"P18":"1"},"ts":1686804104000} sent for topic hl/v1/devices/d03f272309ea/property/report to broker with packet ID 2.
PUBLISH {"mac":"D03F272309EA","model":"WYZEDB3","data":{"P1013":"79"},"ts":1686804104000} sent for topic hl/v1/devices/d03f272309ea/property/report to broker with packet ID 3.
PUBACK received for packet id 2.
[hl/v1/devices/d03f272309ea/property/report]send message:{"mac":"D03F272309EA","model":"WYZEDB3","data":{"P18":"1"},"ts":1686804104000} result:0
Cleaned up outgoing publish packet with packet id 2.
PUBACK received for packet id 3.
[hl/v1/devices/d03f272309ea/property/report]send message:{"mac":"D03F272309EA","model":"WYZEDB3","data":{"P1013":"79"},"ts":1686804104000} result:0
Cleaned up outgoing publish packet with packet id 3.
DEBUG:curl_post L#174 https://device-api.wyzecam.com/ddc/v1/metrics_list/report, curl_easy_perform res 22, code 504, totaltime 11.113, connecttime 0.105
[06/15/2023 00:41:50]put metrics:{"metrics_type":"connectivity/curlPost","metrics_content":{"url":"https://device-api.wyzecam.com/ddc/v1/metrics_list/report", "respCode":504, "totalTime":11.113, "connectTime": 0.105}, "metrics_ts":1686804110502}
DEBUG:curl_post L#187 curl_easy_perform() failed:[22] HTTP response code said error
DEBUG:curl_post L#195 remote host abnormal
[06/15/2023 00:41:50]metric_post: 22, url:https://device-api.wyzecam.com/ddc/v1/metrics_list/report
DEBUG:curl_post L#174 https://dms-api.wyzecam.com:443/api/v1/kinesis/auth/get, curl_easy_perform res 0, code 200, totaltime 0.692, connecttime 0.128
[06/15/2023 00:41:51]put metrics:{"metrics_type":"connectivity/curlPost","metrics_content":{"url":"dms-api.wyzecam.com:443/api/v1/kinesis/auth/get", "respCode":200, "totalTime":0.692, "connectTime": 0.128}, "metrics_ts":1686804111201}
data_parse_kvs:buf={"ts":1686804111365,"code":"1","msg":"","data":{"stream_name":"8e038176462fb98238a2cd1b3d3e767b11c12022ddabd195e035f9ab5afdba42","role_alias":"alias_iam_wyze_kvs_role","ca_cert_url":"https://www.amazontrust.com/repository/SFSRootCAG2.pem","credential_endpoint":"c1ybkrkbr1j10x.credentials.iot.us-west-2.amazonaws.com"}}:"","data":{"stream_name":"8e038176462fb98238a2cd1b3d3e767b11c12022ddabd195e035f9ab5afdba42","role_alias":"alias_iam_wyze_kvs_role","ca_cert_url":"https://www.amazontrust.com/repository/SFSRootCAG2.pem","credential_endpoint":"c1ybkrkbr1j10x.credentials.iot.us-west-2.amazonaws.com"}}
[stream_name]:[8e038176462fb98238a2cd1b3d3e767b11c12022ddabd195e035f9ab5afdba42]
[roleAlias]:[alias_iam_wyze_kvs_role]
[endpointString]:[c1ybkrkbr1j10x.credentials.iot.us-west-2.amazonaws.com]
* STATE: INIT => CONNECT handle 0xd3f710; line 1654 (connection #-5000)
* Added connection 0. The cache now contains 1 members
* STATE: CONNECT => WAITRESOLVE handle 0xd3f710; line 1700 (connection #0)
* family0 == v4, family1 == v6
*   Trying 18.67.17.114:443...
* STATE: WAITRESOLVE => WAITCONNECT handle 0xd3f710; line 1782 (connection #0)
* Connected to www.amazontrust.com (18.67.17.114) port 443 (#0)
* STATE: WAITCONNECT => SENDPROTOCONNECT handle 0xd3f710; line 1848 (connection #0)
* Marked for [keep alive]: HTTP default
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*  CAfile: /system/bin/cacert.pem
*  CApath: none
* STATE: SENDPROTOCONNECT => PROTOCONNECT handle 0xd3f710; line 1866 (connection #0)
* SSL connection using TLSv1.3 / TLS_AES_128_GCM_SHA256
* ALPN, server did not agree to a protocol
* Server certificate:
*  subject: CN=www.amazontrust.com
*  start date: Jun  9 00:00:00 2023 GMT
*  expire date: Jul  7 23:59:59 2024 GMT
*  subjectAltName: host "www.amazontrust.com" matched cert's "www.amazontrust.com"
*  issuer: C=US; O=Amazon; CN=Amazon RSA 2048 M01
*  SSL certificate verify ok.
* STATE: PROTOCONNECT => DO handle 0xd3f710; line 1885 (connection #0)
> GET /repository/SFSRootCAG2.pem HTTP/1.1
Host: www.amazontrust.com
Accept: */*
* STATE: DO => DO_DONE handle 0xd3f710; line 1940 (connection #0)
* STATE: DO_DONE => PERFORM handle 0xd3f710; line 2061 (connection #0)
* Mark bundle as not supporting multiuse
* HTTP 1.1 or later with persistent connection
< HTTP/1.1 200 OK
< Content-Type: text/plain; charset=US-ASCII
< Content-Length: 1424
< Connection: keep-alive
< Date: Tue, 16 May 2023 23:50:37 GMT
< Cache-Control: max-age=31556952, public
< Last-Modified: Tue, 16 May 2023 23:46:54 GMT
< x-amz-version-id: CIhRi9QkUud_tCULZgs8R7uSXIicqsai
< ETag: "afa7c51b1be82699985b1cf2f6552663"
< Server: AmazonS3
< X-Cache: Hit from cloudfront
< Via: 1.1 614ee5305862f7e9bae65335466e5512.cloudfront.net (CloudFront)
< X-Amz-Cf-Pop: YTO50-P1
< X-Amz-Cf-Id: 5oQTh2jLysnKOp-5Vpq8lK388Q3XonVV6vG-0jUPP2MdW_ppJJQVXg==
< Age: 2523075
<
* STATE: PERFORM => DONE handle 0xd3f710; line 2251 (connection #0)
* multi_done
* Connection #0 to host www.amazontrust.com left intact
* Expire cleared (transfer 0xd3f710)
curl_easy_perform ret:0
download client cert url success
[06/15/2023 00:41:51]g_kiness_message_get_Flag = 1,touch /tmp/kvs/kvsok
[06/15/2023 00:41:52]1 == g_kiness_message_get_Flag
[INFO]: [15/06-00:41:52.991][KVS_APP][kvs_module.c::483]lala track id 1: 1, track id 2 2, track count 2
[INFO]: [15/06-00:41:52.992][KVS_APP][kvs_module.c::488][FM] createDefaultDeviceInfo
[INFO]: [15/06-00:41:52.992][KVS_APP][kvs_module.c::491][FM] setDeviceInfoStorageSize
[INFO]: [15/06-00:41:53.692][KVS_APP][kvs_module.c::513][FM] createDefaultCallbacksProviderWithIotCertificate
[INFO]: [15/06-00:41:53.693][KVS_APP][kvs_module.c::531][FM] ready to  addStreamCallbacks
[INFO]: [15/06-00:41:53.693][KVS_APP][kvs_module.c::534][FM] createKinesisVideoClient
[INFO]: [15/06-00:41:53.694][KVS_APP][kvs_module.c::540][-kvs-]aws kvs isvideo  ---- createKinesisVideoStreamSync ---- init
111111111111111 ret = 0 0 103
[INFO]: [15/06-00:41:53.694][KVS_APP][streamrcv.c::270][FM] strem rcv create, ready to start
Jun 15 00:41:54 kvsWebrtcClientMaster[379]: sendAndRecv(): Recv message from iCamera failed. errno: 11
Jun 15 00:41:54 kvsWebrtcClientMaster[379]: WyzePutMetrics(): message answer to use old version of put_metrics_JSON
ret = 0 0 123
[webrtc_controller] webrtc controller received message {"method":"metrics", "version":1,"level": 0, "hitRate": 255, "type": "kvsWebRTCCredential", "content":{"iotCredentialProvider" : "available"}}
Jun 15 00:41:55 kvsWebrtcClientMaster[379]: sendAndRecv(): Send local data: {"method":"metrics", "version":1,"level": 0, "hitRate": 255, "type": "kvsWebRTCCredential", "content":{"iotCredentialProvider" : "available"}}
Jun 15 00:42:00 kvsWebrtcClientMaster[379]: sendAndRecv(): Recv message from iCamera failed. errno: 11
Jun 15 00:42:00 kvsWebrtcClientMaster[379]: WyzePutMetrics(): message answer to use old version of put_metrics_JSON
ret = 0 0 137
Jun 15 00:42:00 kvsWebrtcClientMaster[379]: main(): {"WebRTCVersion":"1.0.2.3"}
Jun 15 00:42:00 kvsWebrtcClientMaster[379]: sendAndRecv(): Send local data: {"method":"metrics", "version":1,"level": 0, "hitRate": 255, "type": "kvsWebRTCVersion", "content":{"WebRTCVersion":"1.0.2.3"}}
[webrtc_controller] webrtc controller received message {"method":"metrics", "version":1,"level": 0, "hitRate": 255, "type": "kvsWebRTCVersion", "content":{"WebRTCVersion":"1.0.2.3"}}: "available"}}
DEBUG:curl_post L#174 https://device-api.wyzecam.com/ddc/v1/metrics_list/report, curl_easy_perform res 22, code 504, totaltime 11.176, connecttime 0.098
[06/15/2023 00:42:03]put metrics:{"metrics_type":"connectivity/curlPost","metrics_content":{"url":"https://device-api.wyzecam.com/ddc/v1/metrics_list/report", "respCode":504, "totalTime":11.176, "connectTime": 0.098}, "metrics_ts":1686804123694}
DEBUG:curl_post L#187 curl_easy_perform() failed:[22] HTTP response code said error
DEBUG:curl_post L#195 remote host abnormal
[06/15/2023 00:42:03]metric_post: 22, url:https://device-api.wyzecam.com/ddc/v1/metrics_list/report
[ping statistics]5 transmitted, 5 received, 0% lost
[06/15/2023 00:42:04]ping:ip[142.251.41.36] 0 lost
Jun 15 00:42:05 kvsWebrtcClientMaster[379]: sendAndRecv(): Recv message from iCamera failed. errno: 11
Jun 15 00:42:05 kvsWebrtcClientMaster[379]: WyzePutMetrics(): message answer to use old version of put_metrics_JSON
ret = 0 0 122
Jun 15 00:42:05 kvsWebrtcClientMaster[379]: createSignalingSync(): stateLock is created! pSignalingClient = b51038
[webrtc_controller] webrtc controller received message {"method":"metrics", "version":1,"level": 0, "hitRate": 255, "type": "kvsWebRTCSessions", "content":{
"sessions":[
],
"signalingConnectTries":0,
"maxConcurrentSessions":"0",
"signalingMessagesSent":"0",
"signalingMessagesReceived":"0"
}}
Jun 15 00:42:05 kvsWebrtcClientMaster[379]: sendAndRecv(): Send local data: {"method":"metrics", "version":1,"level": 0, "hitRate": 255, "type": "kvsWebRTCSessions", "content":{
"sessions":[
],
"signalingConnectTries":0,
"maxConcurrentSessions":"0",
"signalingMessagesSent":"0",
"signalingMessagesReceived":"0"
}}
Jun 15 00:42:10 kvsWebrtcClientMaster[379]: sendAndRecv(): Recv message from iCamera failed. errno: 11
Jun 15 00:42:10 kvsWebrtcClientMaster[379]: WyzePutMetrics(): message answer to use old version of put_metrics_JSON
ret = 0 0 232
Jun 15 00:42:10 kvsWebrtcClientMaster[379]: sessionCleanupWait(): Metrics Json:
{
"sessions":[
],
"signalingConnectTries":0,
"maxConcurrentSessions":"0",
"signalingMessagesSent":"0",
"signalingMessagesReceived":"0"
}
DEBUG:curl_post L#174 https://device-api.wyzecam.com/ddc/v1/metrics_list/report, curl_easy_perform res 22, code 504, totaltime 10.833, connecttime 0.122
[06/15/2023 00:42:16]put metrics:{"metrics_type":"connectivity/curlPost","metrics_content":{"url":"https://device-api.wyzecam.com/ddc/v1/metrics_list/report", "respCode":504, "totalTime":10.833, "connectTime": 0.122}, "metrics_ts":1686804136544}
DEBUG:curl_post L#187 curl_easy_perform() failed:[22] HTTP response code said error
DEBUG:curl_post L#195 remote host abnormal
[06/15/2023 00:42:16]metric_post: 22, url:https://device-api.wyzecam.com/ddc/v1/metrics_list/report
[06/15/2023 00:42:18]post url: https://dcl-api.wyzecam.com/api/v1/device_log/upload_url/get
[06/15/2023 00:42:18]post data: {"mac":"D03F272309EA","enr":"fa4J36UFYGHcLnMN","product_model":"WYZEDB3","product_type":"Camera","hardware_ver":"P00A0000","firmware_ver":"4.25.1.314","sc":"3d8e3e9018b44c8792cf21d49ab54fec","sv":"f14f26fae2164ba2ac996b9d5aa3a927","ts":1686804138000,"log_type":2,"file_relative_path":"WYZEDB3/D03F272309EA/20230615/Metrics/044218.txt"}
DEBUG:curl_post L#174 https://dcl-api.wyzecam.com/api/v1/device_log/upload_url/get, curl_easy_perform res 0, code 200, totaltime 0.635, connecttime 0.137
[06/15/2023 00:42:19]put metrics:{"metrics_type":"connectivity/curlPost","metrics_content":{"url":"https://dcl-api.wyzecam.com/api/v1/device_log/upload_url/get", "respCode":200, "totalTime":0.635, "connectTime": 0.137}, "metrics_ts":1686804139183}
[06/15/2023 00:42:19]post resp: HTTP/1.1 200 OK
Date: Thu, 15 Jun 2023 04:42:19 GMT
Content-Type: application/json; charset=utf-8
Content-Length: 485
Connection: keep-alive
Cache-Control: no-cache
Pragma: no-cache
Expires: -1
Server: Microsoft-IIS/8.5
X-AspNet-Version: 4.0.30319
X-Powered-By: ASP.NET
{"ts":1686804136320,"code":"1","msg":"","data":{"upload_url":"https://wyze-device-log.s3.us-west-2.amazonaws.com/WYZEDB3/D03F272309EA/20230615/Metrics/044218.txt?X-Amz-Expires=3600&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJNFQFXEM46KZVY7A/20230615/us-west-2/s3/aws4_request&X-Amz-Date=20230615T044216Z&X-Amz-SignedHeaders=content-type;host&X-Amz-Signature=35d2211c56c23435c2b09dbaa7fdda32e79b97358b16e2b2ecefa93d31cad153"},"response_id":"1a09db21de574f7eb5c5fc6c2930fc18"}
[06/15/2023 00:42:19]post msg resp: {"ts":1686804136320,"code":"1","msg":"","data":{"upload_url":"https://wyze-device-log.s3.us-west-2.amazonaws.com/WYZEDB3/D03F272309EA/20230615/Metrics/044218.txt?X-Amz-Expires=3600&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJNFQFXEM46KZVY7A/20230615/us-west-2/s3/aws4_request&X-Amz-Date=20230615T044216Z&X-Amz-SignedHeaders=content-type;host&X-Amz-Signature=35d2211c56c23435c2b09dbaa7fdda32e79b97358b16e2b2ecefa93d31cad153"},"response_id":"1a09db21de574f7eb5c5fc6c2930fc18"}HMAC-SHA256&X-Amz-Credential=AKIAJNFQFXEM46KZVY7A/20230615/us-west-2/s3/aws4_request&X-Amz-Date=20230615T044216Z&X-Amz-SignedHeaders=content-type;host&X-Amz-Signature=35d2211c56c23435c2b09dbaa7fdda32e79b97358b16e2b2ecefa93d31cad153"},"response_id":"1a09db21de574f7eb5c5fc6c2930fc18"}
filesize:2503
[UPLOAD] file_size = 3527
[upload_File]HTTP_flag is 200
res = 1
[06/15/2023 00:42:20]upload succes
[06/15/2023 00:42:20]randNum:640
[06/15/2023 00:42:23]MetricsData recv:: {"metrics_type":"app/kvs", "metrics_content":{"restart":1}, "metrics_ts":1686804102975}
[06/15/2023 00:42:23]MetricsData recv:: {"metrics_type":"connectivity/mqtt", "metrics_content":{"online":1}, "metrics_ts":1686804104741}
[06/15/2023 00:42:23]MetricsData recv:: {"metrics_type":"connectivity/mqtt", "metrics_content":{"msgSend":2}, "metrics_ts":1686804104743}
[06/15/2023 00:42:23]MetricsData recv:: {"metrics_type":"connectivity/mqtt", "metrics_content":{"msgSend":3}, "metrics_ts":1686804104743}
[06/15/2023 00:42:23]MetricsData recv:: {"metrics_type":"sinkerProcessList", "metrics_content":{"processes":[{"name":"kvsWebrtcClientMaster","version":"1.0.2.3","state":"running","launchFailures":"0","heartbeatMissing":"0"}]}, "metrics_ts":1686804109303}
[06/15/2023 00:42:23]MetricsData recv:: {"metrics_type":"app/kvs_init", "metrics_content":{"status":0}, "metrics_ts":1686804113694}
[06/15/2023 00:42:23]MetricsData recv:: {"metrics_type":"kvsWebRTCCredential", "metrics_content":{"iotCert" : "available"}, "metrics_ts":1686804114456}
[06/15/2023 00:42:23]MetricsData recv:: {"metrics_type":"kvsWebRTCCredential", "metrics_content":{"iotCredentialProvider" : "available"}, "metrics_ts":1686804120096}
[06/15/2023 00:42:23]MetricsData recv:: {"metrics_type":"kvsWebRTCVersion", "metrics_content":{"WebRTCVersion":"1.0.2.3"}, "metrics_ts":1686804125096}
[06/15/2023 00:42:23]MetricsData recv:: {"metrics_type":"kvsWebRTCSessions", "metrics_content":{
"sessions":[
],
"signalingConnectTries":0,
"maxConcurrentSessions":"0",
"signalingMessagesSent":"0",
"signalingMessagesReceived":"0"
}, "metrics_ts":1686804130096}
[ping statistics]5 transmitted, 5 received, 0% lost
```

Short pins 5-6 of flash memory chip during boot ot get into bootloader shell.

### U-Boot shell

#### help
```
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
md5sum  - compute MD5 message digest
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
```

#### version
```
U-Boot 2013.07 (Mar 03 2021 - 16:12:04)
mips-linux-gnu-gcc (Ingenic r2.3.3 2016.12) 4.7.2
GNU ld (Ingenic r2.3.3 2016.12) 2.24.51.20140512
```

#### coninfo
```
List of available devices:
serial   80000003 SIO stdin stdout stderr
jz_serial 00000003 .IO
```

#### printenv
```
baudrate=115200
bootargs=console=ttyS1,115200n8 mem=82M@0x0 rmem=46M@0x5200000 init=/linuxrc rootfstype=squashfs root=/dev/mtdblock2 rw mtdparts=jz_sfc:256k(boot),2048k(kernel),3392k(root),640k(driver),4736k(appfs),4736k(backupa),256k(config),256k(para),-(flag)
bootcmd=sdupdate;sf probe;sf read 0x80600000 0x40000 0x280000; bootm 0x80600000
bootdelay=1
ethaddr=00:d0:d0:00:95:27
gatewayip=193.169.4.1
ipaddr=193.169.4.81
loads_echo=1
netmask=255.255.255.0
serverip=193.169.4.2
stderr=serial
stdin=serial
stdout=serial
Environment size: 546/16380 bytes
```
