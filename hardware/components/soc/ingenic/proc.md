Ingenic-specific /proc/jz/ virtual filesystem
---------------------------------------------

### Audio

__cat /proc/jz/audio/audio_info__
```
The version of audio driver is V20-20200426a
audio replay status is closed
audio record status is closed
```

### GPIO

__cat /proc/jz/gpio/gpios__
```
INT             MASK            PAT1            PAT0
0x00000000      0x06474fc0      0x06434fc0      0x1f84b000
0x08000000      0xf63f8000      0x84060000      0x52406f00
0x00000000      0x07fffbff      0x07fffbff      0x00000000
```

### Clocks

__ls -p /proc/jz/clock/__
```
aes/         cgu_i2s_spk/ cpu/         hash/        msc1/        ssi0/
ahb0/        cgu_isp/     csi/         i2c0/        otg1/        ssi1/
ahb1/        cgu_lpc/     ddr/         i2c1/        otg_phy/     ssi_slv/
aic/         cgu_macphy/  des/         ipu/         pclk/        sys_ost/
apb0/        cgu_msc0/    dmic/        isp/         pdma/        tcu/
apll/        cgu_msc1/    dtrng/       l2clk/       riscv/       uart0/
avpu/        cgu_msc_mux/ ext0/        lcd/         rsa/         uart1/
cclk/        cgu_rsa/     ext1/        misc         rtc/         uart2/
cgu_cim/     cgu_ssi/     gmac/        mpll/        sadc/        vpll/
cgu_ddr/     cgu_vpu/     h0clk/       msc/         sclka/
cgu_i2s_mic/ clocks       h2clk/       msc0/        sfc/
```

The `/proc/jz/clock/clocks` file has a summary of all clocks in the system.

__cat /proc/jz/clock/clocks__
```
ID NAME       FRE        stat       count     parent
--------------------------------------------------------
 1 ext0          0.032MHz  enable   0 root
 2 ext1         24.000MHz  enable   11 root
 3 otg_phy      48.000MHz  enable   0 root
--------------------------------------------------------
 5 apll       1404.000MHz  enable   1 ext1
 6 mpll       1000.000MHz  enable   7 ext1
 7 vpll       1080.000MHz  enable   2 ext1
 8 sclka      1404.000MHz  enable   9 apll
--------------------------------------------------------
10 cclk       1404.000MHz  enable   0 sclka
11 l2clk       702.000MHz  enable   0 sclka
12 h0clk       250.000MHz  enable   4 mpll
13 h2clk       250.000MHz  enable   7 mpll
14 pclk        125.000MHz  enable   6 mpll
15 msc          24.000MHz  enable   0 ext1
--------------------------------------------------------
17 cgu_isp     200.000MHz  enable   1 mpll
18 cgu_cim      27.000MHz  enable   1 vpll
19 cgu_ssi      50.000MHz  enable   2 mpll
20 cgu_msc_mux 1404.000MHz  enable   0 sclka
21 cgu_i2s_spk    2.048MHz  enable   1 sclka
22 cgu_i2s_mic    2.048MHz  enable   1 sclka
23 cgu_msc1     23.400MHz  enable   1 sclka
24 cgu_msc0     23.400MHz  enable   0 sclka
25 cgu_lpc       4.687MHz disable   0 vpll
26 cgu_macphy   50.000MHz  enable   1 mpll
27 cgu_vpu     400.000MHz  enable   2 vpll
28 cgu_ddr     500.000MHz  enable   0 mpll
29 cgu_rsa      62.500MHz disable   0 mpll
--------------------------------------------------------
31 ddr         250.000MHz  enable   0 h0clk
32 tcu         125.000MHz  enable   0 pclk
33 rtc         125.000MHz  enable   0 pclk
34 des         125.000MHz  enable   0 pclk
35 csi         125.000MHz  enable   1 pclk
36 lcd         250.000MHz disable   0 h0clk
37 isp         250.000MHz  enable   1 h0clk
38 pdma        250.000MHz  enable   1 h2clk
39 sfc         250.000MHz  enable   1 h2clk
40 uart2        24.000MHz disable   0 ext1
41 uart1        24.000MHz  enable   1 ext1
42 uart0        24.000MHz disable   0 ext1
43 sadc        125.000MHz  enable   0 pclk
44 dmic        125.000MHz disable   0 pclk
45 aic         125.000MHz  enable   1 pclk
46 hash        250.000MHz disable   0 h2clk
47 i2c1        125.000MHz disable   0 pclk
48 i2c0        125.000MHz disable   0 pclk
49 ssi0         50.000MHz  enable   0 cgu_ssi
50 ssi1         50.000MHz disable   0 cgu_ssi
51 ssi_slv     125.000MHz disable   0 pclk
52 msc1        250.000MHz  enable   0 h2clk
53 msc0        250.000MHz  enable   0 h2clk
54 otg1        250.000MHz  enable   1 h2clk
--------------------------------------------------------
56 cpu          24.000MHz  enable   0 ext1
57 apb0         24.000MHz  enable   0 ext1
58 sys_ost      24.000MHz  enable   2 ext1
59 ahb0         24.000MHz  enable   0 ext1
--------------------------------------------------------
61 riscv       250.000MHz  enable   0 h2clk
62 aes         250.000MHz disable   0 h2clk
63 rsa         125.000MHz disable   0 pclk
64 ahb1         24.000MHz  enable   2 ext1
65 gmac        250.000MHz  enable   1 h2clk
66 ipu         250.000MHz  enable   1007 h0clk
67 dtrng       125.000MHz disable   0 pclk
68 avpu        250.000MHz  enable   2 h0clk
```

__cat /proc/jz/clock/misc__
```
CLKGR   : 094f5780
CLKGR1  : 000033a2
LCR1    : 00000000
```

#### Individual clocks

Each of the clock subdirectories has two files, `enable` that returns clock
status (`enabled` or `disabled`), and `rate` that reports the clock rate,
e.g. `rate: 24000000`.

__cat /proc/jz/clock/uart1/enable__
```
enabled
```

__cat /proc/jz/clock/uart1/rate__
```
rate: 24000000
```

### DDR

__cat /proc/jz/ddr/ddr_Register__
```
--------------------dump the DDRC1---------------
DDRC_STATUS     :0x80000001     address :0xb34f0000
DDRC_CFG        :0x0aa88a42     address :0xb34f0004
DDRC_CTRL       :0x0000011c     address :0xb34f0008
DDRC_LMR        :0x00400008     address :0xb34f000c
DDRC_TIMING1    :0x050f0a06     address :0xb34f0060
DDRC_TIMING2    :0x021c0a07     address :0xb34f0064
DDRC_TIMING3    :0x200a0722     address :0xb34f0068
DDRC_TIMING4    :0x26240031     address :0xb34f006c
DDRC_TIMING5    :0xff060405     address :0xb34f0070
DDRC_TIMING6    :0x321c0505     address :0xb34f0074
DDRC_REFCNT     :0x00911503     address :0xb34f0018
DDRC_MMAP0      :0x000020f8     address :0xb34f0024
DDRC_MMAP1      :0x00002800     address :0xb34f0028
DDRC_REMAP1     :0x030e0d0c     address :0xb34f009c
DDRC_REMAP2     :0x07060504     address :0xb34f00a0
DDRC_REMAP3     :0x0b0a0908     address :0xb34f00a4
DDRC_REMAP4     :0x0f020100     address :0xb34f00a8
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

### ISP

__cat /proc/jz/isp/isp-fs__
```
############## framesource 0 ###############
chan status: running
output pixformat: NV12
output resolution: 1920 * 1080
scaler : disable
crop : disable
the state of buffers:
queue count: 2
queue addr: 0x03b1ea00
queue addr: 0x03821a00
done count: 0
the output buffers is: 0
the losted buffers is: 0
ch0_pre_dequeue_drop is: 0
ch0_pre_dequeue_intc_ahead_cnt is: 0
pdq cnt: 0, pdq intc cnt:0, pdq intc cnt1:0
---------------------------
buf:0, state:3, buf_state:30, buf_qcnt:2249, buf_dqcnt:2248
buf:1, state:3, buf_state:30, buf_qcnt:2248, buf_dqcnt:2247
############## framesource 1 ###############
chan status: running
output pixformat: NV12
output resolution: 704 * 576
scaler : enable
scaler width: 704
scaler height: 576
crop : disable
the state of buffers:
queue count: 2
queue addr: 0x03e1ba00
queue addr: 0x03eb0200
done count: 0
the output buffers is: 0
the losted buffers is: 0
---------------------------
buf:0, state:3, buf_state:30, buf_qcnt:2268, buf_dqcnt:2267
buf:1, state:3, buf_state:30, buf_qcnt:2268, buf_dqcnt:2267
############## framesource 2 ###############
chan status: stop
```

__cat /proc/jz/isp/isp-m0__
```
****************** ISP INFO **********************
Software Version : H20221206a
SENSOR NAME : gc2083
SENSOR OUTPUT WIDTH : 1920
SENSOR OUTPUT HEIGHT : 1080
ISP OUTPUT FPS : 25 / 1
SENSOR OUTPUT RAW PATTERN : RGGB
ISP Top Value : 0xb5742a49
ISP Runing Mode : Day
ISP Custom Mode : Disable
ISP WDR Mode : Disable
SENSOR Integration Time : 1346 lines
SENSOR Max Integration Time : 1346 lines
SENSOR analog gain : 215
MAX SENSOR analog gain : 222
SENSOR digital gain : 0
MAX SENSOR digital gain : 0
ISP digital gain : 26
MAX ISP digital gain : 26
ISP Tgain DB : 7
ISP EV value: 252505
ISP EV value log2: 1176104
ISP EV value us: 39881
ISP EV min int: 2
ISP EV min again: 1024
ISP WB weighted rgain: 358
ISP WB weighted bgain: 668
ISP WB color temperature: 3825
ISP AWB Start rgain 188: bgain 395
Saturation : 127
Saturation : 127
Sharpness : 128
Contrast : 127
Brightness : 127
Antiflicker : 0
Mirror: Disable, Flip: Disable
debug : ch0 done 6135,ip done 6190,0,0,0,0,0,0
debug1 : 0,0,900
```

__cat /proc/jz/isp/isp-w00__
```
```

__cat /proc/jz/isp/isp-w01__
```
```

__cat /proc/jz/isp/isp-w02__
```
 20633, 0
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
```

### Watchdog

__cat /proc/jz/watchdog/reset__
```
```

__cat /proc/jz/reset/reset__
```
wdt     hibernate       recovery
```

__cat /proc/jz/reset/wdt_control__
```
>off<on
```

__cat /proc/jz/reset/wdt_time__
```
3000 msecs
``` 

### Sensor

__/proc/jz/sinfo/info__
```
sensor not found
```

to detect the sensor, first send `1` to the file 
```
# echo 1 > /proc/jz/sinfo/info
# cat /proc/jz/sinfo/info
sensor :gc2053
```
