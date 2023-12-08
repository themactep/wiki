/proc
-----

#### cat /proc/jz/clock/clocks
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

#### cat /proc/jz/clock/misc
```
CLKGR   : 094f5780
CLKGR1  : 000033a2
LCR1    : 00000000
```
