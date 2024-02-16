```
[root@Ingenic-uc1_1:~]# ps
PID USER       VSZ STAT COMMAND
1 root      1600 S    {linuxrc} init
2 root         0 SW   [kthreadd]
3 root         0 SW   [ksoftirqd/0]
4 root         0 SW   [kworker/0:0]
5 root         0 SW<  [kworker/0:0H]
6 root         0 SW   [kworker/u2:0]
7 root         0 SW   [rcu_preempt]
8 root         0 SW   [rcu_bh]
9 root         0 SW   [rcu_sched]
10 root         0 SW   [watchdog/0]
11 root         0 SW<  [khelper]
12 root         0 SW<  [writeback]
13 root         0 SW<  [bioset]
14 root         0 SW<  [kblockd]
15 root         0 SW   [khubd]
16 root         0 SW   [kworker/0:1]
17 root         0 SW<  [cfg80211]
18 root         0 SW   [kworker/0:2]
19 root         0 SW   [kswapd0]
20 root         0 SW   [fsnotify_mark]
21 root         0 SW<  [crypto]
32 root         0 SW   [kworker/u2:1]
33 root         0 SW<  [deferwq]
34 root         0 SW<  [kworker/0:1H]
47 root         0 SWN  [jffs2_gcd_mtd6]
74 root         0 SW   [kworker/u2:2]
91 root         0 SW   [ksdioirqd/mmc1]
95 root         0 SW   [irq/37-isp-m0]
97 root         0 SW   [irq/38-isp-w02]
121 root      1592 S    {factory.sh} /bin/sh /system/init/factory.sh
142 root      448m S    /system/bin/iCamera_app
143 root      1600 S    -sh
146 root     63780 S    /system/bin/assis
182 root      1592 S    {sysMonitor.sh} /bin/sh /system/bin/sysMonitor.sh
204 root         0 DW   [isp_fw_process]
227 root         0 SW   [kworker/0:3]
251 root         0 SW   [RTW_XMIT_THREAD]
252 root         0 SW   [RTW_CMD_THREAD]
253 root         0 SW   [RTWHALXT]
276 root     43028 S    /etc/miio_client/miio_client -D -L /tmp/miio_log.txt
278 root      1644 S    {miio_client_hel} /bin/sh /etc/miio_client/miio_clie
342 root       956 S    /etc/miio_client/miio_recv_line
401 root      5120 S    hostapd -B /tmp/hostapd_wpa2.conf
408 root      1596 S    udhcpd /system/share/udhcpd_wpa2.conf
411 root      1584 S    sleep 5
413 root      1584 S    sleep 1
414 root      1592 R    ps
```
```
[root@Ingenic-uc1_1:~]# mount -t debugfs none /sys/kernel/debug; cat /sys/kernel/debug/gpio
GPIOs 0-31, GPIO A:
 gpio-10  (sysfs               ) out hi
 gpio-18  (jxq03p_reset        ) out hi

GPIOs 32-63, GPIO B:
 gpio-38  (sysfs               ) out lo
 gpio-39  (sysfs               ) out hi
 gpio-47  (mmc_detect          ) in  hi
 gpio-48  (sysfs               ) in  hi
 gpio-49  (sysfs               ) out lo
 gpio-50  (sysfs               ) out lo
 gpio-51  (sysfs               ) in  hi
 gpio-54  (mmc_power           ) out hi
 gpio-60  (sysfs               ) out lo
 gpio-62  (sdio_wifi_power_on  ) out hi
 gpio-63  (speakerctl_gpio     ) out hi

GPIOs 64-95, GPIO C:
 gpio-64  (home key            ) in  hi
```
```
[root@Ingenic-uc1_1:~]# top
Mem: 35824K used, 1572K free, 0K shrd, 3936K buff, 13120K cached
CPU: 21.1% usr  6.4% sys  0.0% nic 72.3% idle  0.0% io  0.0% irq  0.0% sirq
Load average: 1.79 1.72 1.08 2/108 2037
  PID  PPID USER     STAT   VSZ %VSZ CPU %CPU COMMAND
  142     1 root     S     448m1227.9   0 12.0 /system/bin/iCamera_app
  204     2 root     DW       0  0.0   0  3.2 [isp_fw_process]
   18     2 root     RW       0  0.0   0  0.3 [kworker/0:2]
  146     1 root     S    63780170.5   0  0.1 /system/bin/assis
  276     1 root     S    43028115.0   0  0.1 /etc/miio_client/miio_client -D -L
 2023   143 root     R     1596  4.2   0  0.1 top
  121     1 root     S     1592  4.2   0  0.1 {factory.sh} /bin/sh /system/init/
    7     2 root     SW       0  0.0   0  0.1 [rcu_preempt]
   91     2 root     SW       0  0.0   0  0.1 [ksdioirqd/mmc1]
    3     2 root     SW       0  0.0   0  0.1 [ksoftirqd/0]
  252     2 root     SW       0  0.0   0  0.1 [RTW_CMD_THREAD]
  401     1 root     S     5120 13.6   0  0.0 hostapd -B /tmp/hostapd_wpa2.conf
  278     1 root     S     1644  4.3   0  0.0 {miio_client_hel} /bin/sh /etc/mii
    1     0 root     S     1600  4.2   0  0.0 {linuxrc} init
  143     1 root     S     1600  4.2   0  0.0 -sh
  408     1 root     S     1596  4.2   0  0.0 udhcpd /system/share/udhcpd_wpa2.c
  182     1 root     S     1592  4.2   0  0.0 {sysMonitor.sh} /bin/sh /system/bi
 2037   121 root     R     1592  4.2   0  0.0 {factory.sh} sleep 1
 2035   182 root     S     1584  4.2   0  0.0 sleep 5
  342   278 root     S      956  2.5   0  0.0 /etc/miio_client/miio_recv_line
```
```
[root@Ingenic-uc1_1:~]# free
             total         used         free       shared      buffers
Mem:         37396        35844         1552            0         3936
-/+ buffers:              31908         5488
Swap:        16380            0        16380
```
```
[root@Ingenic-uc1_1:~]# df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/root                 3968      3968         0 100% /
tmpfs                    18696         8     18688   0% /dev
tmpfs                    18696        64     18632   0% /tmp
tmpfs                    18696         4     18692   0% /run
media                    18696         0     18696   0% /media
/dev/mtdblock3            3840      3840         0 100% /system
/dev/mtdblock4            1024      1024         0 100% /kback
/dev/mtdblock5             128       128         0 100% /aback
/dev/mtdblock6             384       188       196  49% /configs
```
```
[root@Ingenic-uc1_1:~]# cat /proc/version 
Linux version 3.10.14__isvp_swan_1.0__ (xuxuequan@ubuntu) (gcc version 4.7.2 (Ingenic r2.3.3 2016.12) ) #0 PREEMPT Mon Jul 12 02:36:24 CST 2021
```
```
[root@Ingenic-uc1_1:~]# cat /proc/cpuinfo 
system type             : Swan
machine                 : Unknown
processor               : 0
cpu model               : Ingenic Xburst V0.0  FPU V0.0
BogoMIPS                : 1001.88
wait instruction        : yes
microsecond timers      : no
tlb_entries             : 32
extra interrupt vector  : yes
hardware watchpoint     : yes, count: 1, address/irw mask: [0x0fff]
isa                     : mips32r1
ASEs implemented        :
shadow register sets    : 1
kscratch registers      : 7
core                    : 0
VCED exceptions         : not available
VCEI exceptions         : not available

Hardware                : isvp
Serial                  : 00000000 00000000 00000000 00000000
```
```
[root@Ingenic-uc1_1:~]# cat /proc/cmdline 
console=ttyS1,115200n8 mem=42M@0x0 rmem=22M@0x2A00000 init=/linuxrc rootfstype=squashfs root=/dev/mtdblock2 rw mtdparts=jz_sfc:256K(boot),1984K(kernel),3904K(rootfs),3904K(app),1984K(kback),3904K(aback),384K(cfg),64K(para)
```
```
[root@Ingenic-uc1_1:~]# cat /proc/jz/isp/isp-fs 
############## framesource 0 ###############
chan status: running
output pixformat: NV12
output resolution: 2304 * 1296
scaler : disable
crop : disable
the state of buffers:
queue count: 0
done count: 0
the output buffers is: 0
the losted buffers is: 0
ch0_pre_dequeue_drop is: 4
ch0_pre_dequeue_intc_ahead_cnt is: 0
pdq cnt: 20239, pdq intc cnt:0, pdq intc cnt1:0
---------------------------
buf:0, state:0, buf_state:102, buf_qcnt:20239, buf_dqcnt:20239
############## framesource 1 ###############
chan status: running
output pixformat: NV12
output resolution: 640 * 360
scaler : enable
scaler width: 640
scaler height: 360
crop : disable
the state of buffers:
queue count: 2
queue addr: 0x03f7b200
queue addr: 0x03f24e00
done count: 0
the output buffers is: 0
the losted buffers is: 0
---------------------------
buf:0, state:3, buf_state:30, buf_qcnt:10121, buf_dqcnt:10120
buf:1, state:3, buf_state:30, buf_qcnt:10120, buf_dqcnt:10119
############## framesource 2 ###############
chan status: stop
```

```
[root@Ingenic-uc1_1:~]# cat /proc/jz/isp/isp-m0 [ 1041.405167] SPEAKER CTL MODE0 !

****************** ISP INFO **********************
Software Version : H20210112a
SENSOR NAME : jxq03p
SENSOR OUTPUT WIDTH : 2304
SENSOR OUTPUT HEIGHT : 1296
ISP OUTPUT FPS : 20 / 1
SENSOR OUTPUT RAW PATTERN : BGGR
ISP Top Value : 0xb5740209
ISP Runing Mode : Day
ISP Custom Mode : Disable
ISP WDR Mode : Disable
SENSOR Integration Time : 4 lines
SENSOR Max Integration Time : 1996 lines
SENSOR analog gain : 12
MAX SENSOR analog gain : 158
SENSOR digital gain : 0
MAX SENSOR digital gain : 0
ISP digital gain : 1
MAX ISP digital gain : 64
ISP Tgain DB : 0
ISP EV value: 5
ISP EV value log2: 160843
ISP EV value us: 100
ISP EV min int: 2
ISP EV min again: 1024
ISP WB weighted rgain: 360
ISP WB weighted bgain: 387
ISP WB color temperature: 5000
ISP AWB Start rgain 256: bgain 256
Saturation : 128
Saturation : 128
Sharpness : 128
Contrast : 128
Brightness : 128
Antiflicker : 0
Antiflicker nodes: 4: step : 400, 800, 1200, 1600, 
debug : 20618,0,0,0,0,0,0
debug1 : 14,0,537
```

```
[root@Ingenic-uc1_1:~]# cat /proc/jz/audio/audio_info 
The version of audio driver is V20-20200426a
audio replay status is running
replay fd[8296b8c0]: ioctrl(4402), datasize(2817280)
The objects state of replay: [using 1, run 1] [free 15]
The living rate of replay 8000
The living channel of replay 1
The living format of replay 16
The dma paddr of replay 0x01840000
The dma tracer of replay 65
The io tracer of replay 70
audio record status is running
record fd[8296bb40]: ioctrl(26625), datasize(17040000)
The objects state of record: [using 1, run 1] [free 15]
The living rate of record 8000
The living channel of record 1
The living format of record 16
The dma paddr of record 0x01880000
The dma tracer of record 95
The io tracer of record 95
The aec state is disable
```

```
[root@Ingenic-uc1_1:~]# cat /proc/jz/ddr/ddr_Register 
--------------------dump the DDRC1---------------
DDRC_STATUS     :0x80000001     address :0xb34f0000
DDRC_CFG        :0x0a288a40     address :0xb34f0004
DDRC_CTRL       :0x0000011c     address :0xb34f0008
DDRC_LMR        :0x00400008     address :0xb34f000c
DDRC_TIMING1    :0x050f0a06     address :0xb34f0060
DDRC_TIMING2    :0x021c0807     address :0xb34f0064
DDRC_TIMING3    :0x20080723     address :0xb34f0068
DDRC_TIMING4    :0x1f240031     address :0xb34f006c
DDRC_TIMING5    :0xff060405     address :0xb34f0070
DDRC_TIMING6    :0x321c0505     address :0xb34f0074
DDRC_REFCNT     :0x00910a03     address :0xb34f0018
DDRC_MMAP0      :0x000020fc     address :0xb34f0024
DDRC_MMAP1      :0x00002400     address :0xb34f0028
DDRC_REMAP1     :0x03020d0c     address :0xb34f009c
DDRC_REMAP2     :0x07060504     address :0xb34f00a0
DDRC_REMAP3     :0x0b0a0908     address :0xb34f00a4
DDRC_REMAP4     :0x0f0e0100     address :0xb34f00a8
DDRC_REMAP5     :0x13121110     address :0xb34f00ac
DDRC_AUTOSR_EN  :0x00000000     address :0xb34f0304
--------------------dump the DDRP---------------
DDRP_PIR        :0x00000051     address :0xb3011004
DDRP_PGCR       :0x000000a0     address :0xb3011008
DDRP_PGSR       :0x00000000     address :0xb301100c
DDRP_PTR0       :0x00000000     address :0xb3011018
DDRP_PTR1       :0x00000006     address :0xb301101c
DDRP_PTR2       :0x00000001     address :0xb3011020
DDRP_DSGCR      :0x00000091     address :0xb301102c
DDRP_DCR        :0x00000020     address :0xb3011030
DDRP_DTPR0      :0x00000000     address :0xb3011034
DDRP_DTPR1      :0x00000008     address :0xb3011038
DDRP_DTPR2      :0x00000000     address :0xb301103c
DDRP_MR0        :0x00000014     address :0xb3011040
DDRP_MR1        :0x00000014     address :0xb3011044
DDRP_MR2        :0x00000014     address :0xb3011048
DDRP_MR3        :0x00000014     address :0xb301104c
DDRP_ODTCR      :0x00000002     address :0xb3011050
DX0GSR0         :0x00000000     address :0xb30111c4
@pas:DXDQSTR(0) :0x00000000     address :0xb30111d4
DX1GSR0         :0x00000000     address :0xb3011204
@pas:DXDQSTR(1) :0x00000000     address :0xb3011214
DX2GSR0         :0x00000000     address :0xb3011244
@pas:DXDQSTR(2) :0x00000000     address :0xb3011254
DX3GSR0         :0x00000000     address :0xb3011284
@pas:DXDQSTR(3) :0x00000000     address :0xb3011294
```
```
[root@Ingenic-uc1_1:~]# cat /proc/jz/ddr/ddr_monitor1 
[ 1122.905334] 
[ 1122.905334] Simple MODE to collect DDR rate 
[ 1122.905334] 
[ 1122.915472] Usage: For Example
[ 1122.918908] ********************************************
[ 1122.925944] Start: echo 1 > /proc/jz/ddr/ddr_monitor1
[ 1122.931547] Stop : echo 0 > /proc/jz/ddr/ddr_monitor1
[ 1122.936892] ********************************************
```
```
[root@Ingenic-uc1_1:~]# cat /proc/jz/ddr/ddr_monitor2
[ 1135.168003] 
[ 1135.168003] 
[ 1135.168003] MODE2 to collect DDR's  [ Using && IDLE ] rate 
[ 1135.168003] 
[ 1135.199816] Usage: For Example
[ 1135.203028] ********************************************
[ 1135.209023] Start: echo 1 > /proc/jz/ddr/ddr_monitor2
[ 1135.216759] Stop : echo 0 > /proc/jz/ddr/ddr_monitor2
[ 1135.222353] ********************************************
```
```
[root@Ingenic-uc1_1:~]# cat /proc/jz/ddr/ddr_monitor3
[ 1152.139313] 
[ 1152.139313] 
[ 1152.139313] MODE3 to collect DDR's [ Change_bank && Change_rw && Miss_page ] rate 
[ 1152.139313] 
[ 1152.152854] Usage: For Example
[ 1152.156485] ********************************************
[ 1152.165787] Start: echo 1 > /proc/jz/ddr/ddr_monitor3
[ 1152.171285] Stop : echo 0 > /proc/jz/ddr/ddr_monitor3
[ 1152.177009] ********************************************
```
```
[root@Ingenic-uc1_1:~]# cat /proc/jz/gpio/gpios 
INT             MASK            PAT1            PAT0
0x00000000      0x06444fc0      0x06434bc0      0x1f84b400
0x00008000      0xfe7f00ff      0x2a390000      0x44406f80
0x00000001      0x07fffbfe      0x07fffbfe      0x00000000
```
```
[root@Ingenic-uc1_1:~]# cat /proc/jz/sinfo/info 
sensor :jxq03p
```
