ISP
---

The max resolution supported by ISP
- T10: 1280x1024
- T20: 2048x1536
- T21: 2048x2048
- T30: 2688x2048
- T31: 2592x2048

#### cat /proc/jz/isp/isp-fs
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

#### cat /proc/jz/isp/isp-m0
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

#### cat /proc/jz/isp/isp-w00
```

```
#### cat /proc/jz/isp/isp-w01
```
```

#### cat /proc/jz/isp/isp-w02
```
 20633, 0
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
```
