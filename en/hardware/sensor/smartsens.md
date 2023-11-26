SmartSens
---------
https://www.smartsenstech.com/

### CMOS Image Sensors

| Sensor   | I2C  | register:value           | fps |    WxH    | Act. WxH  |    Size |  Pixel |   SNR |  Sensitivity |   DR | Technology                 | References                                                                              |
|----------|------|--------------------------|----:|:---------:|:---------:|--------:|-------:|------:|-------------:|-----:|----------------------------|-----------------------------------------------------------------------------------------|
| SC031AP  |      |                          |     |     x     |     x     |         |        |       |              |      |                            |                                                                                         |
| SC101AP  |      |                          |     |     x     |     x     |         |        |       |              |      |                            |                                                                                         |
| SC1020   |      |                          |  60 |     x     | 1280x720  |  1/1.8” | 6.00µm |       |              |      | RAW DVP PLCC-48            |                                                                                         |
| SC1035   | 0x30 | 0x3008:0x60              |  45 | 1800x1200 | 1280x960  |  1/2.8" | 4.00µm |  70dB |              |      | RAW DVP PLCC-48            | [DS](docs/SmartSens_SC1035_DS_V1.2_20140604.CN.pdf), [T20][t20]                         |
| SC1042   |      |                          |  30 |     x     | 1280x720  |  1/4.0” | 3.00µm |       |              |      | YUV DVP/SMPTE296 PLCC-52   |                                                                                         |
| SC1045   | 0x60 | ?:0x10 ?:0x45            |  60 | 1920x900  | 1280x720  |  1/4.0” | 3.00µm |       |              |      | RAW DVP CSP-28             | [T20][t20]                                                                              |
| SC1135   | 0x60 | ?:0x00 ?:0x35            |  25 | 1800x1200 | 1280x960  |  1/3.0" | 3.75µm |       |              |      | RAW DVP SCP-48             | [T20][t20]                                                                              |
| SC1145   | 0x60 | ?:0x11 ?:0x45            |  30 | 1920x900  |     x     |         |        |       |              |      |                            | [T20][t20]                                                                              |
| SC1200   |      |                          |     | 1280x720  |     x     |  1/1.8" | 6.00μm |       |              |      | iLLUMi SmartPixel          |                                                                                         |
| SC1235   | 0x60 | ?:0x12 ?:0x35            |  30 | 1800x1200 |     x     |         |        |       |              |      |                            | [T30][t30]                                                                              |
| SC1245   | 0x60 | ?:0x12 ?:0x45  ?:0x03    |  30 | 1600x900  |     x     |         |        |       |              |      |                            | [T30][t30]                                                                              |
| SC1245A  | 0x60 | ?:0x12 ?:0x45  ?:0x02    |  30 | 1600x900  |     x     |         |        |       |              |      |                            | [T30][t30]                                                                              |
| SC130AT  |      |                          |  30 |     x     | 1304x984  |  1/3.0" | 2.00μm |       |              |      | SmartClarity -2            |                                                                                         |
| SC1346   |      |                          |     |     x     |     x     |  1/4.6" | 2.65μm |       |              |      | IMP DSI-2                  |                                                                                         |
| SC1600CS |      |                          |     |     x     |     x     |         | 1.00μm |       |              |      |                            |                                                                                         |
| SC201CS  | 0x60 | ?:0xEB ?:0x2C            |  30 | 1600x1200 |     x     |         |        |       |              |      |                            |                                                                                         |
| SC2032   |      |                          |  30 |     x     | 1920x1080 |  1/2.7" | 3.00μm |       |              |      | YUV DVP/BT1120 PLCC-52     |                                                                                         |
| SC2035   | 0x60 | ?:0x20 ?:0x32            |  30 | 2000x1125 |     x     |         |        |       |              |      |                            | [T20][t20]                                                                              |
| SC2045   |      |                          |  30 |     x     | 1920x1080 |  1/3.6" | 2.20μm |       |              |      | RAW DVP SCP-54             |                                                                                         |
| SC2135   | 0x60 | ?:0x21 ?:0x35            |  30 | 2250x1440 | 1920x1080 |  1/2.7" | 3.00μm |       |              |      | RAW DVP PLCC-48            | [T20][t20], [T30][t30]                                                                  |
| SC2210   | 0x60 | ?:0x22 ?:0x10            |  30 | 1920x1080 |     x     |         |        |       |              |      |                            |                                                                                         |
| SC223A   | 0x60 | 0x3107:0xCB 0x3108:0x3E            |  30 | 1920x1080 |     x     |         |        |       |              |      | DSI-2                      |                                                                                         |
| SC2232   | 0x60 | ?:0x22 ?:0x32 ?:0x01     |  30 | 2080x1500 |     x     |         |        |       |              |      |                            | [T30][t30]                                                                              |
| SC2232H  | 0x60 | ?:0xCB ?:0x07 ?:0x01     |  30 | 2080x1500 |     x     |         |        |       |              |      |                            | [T30][t30], [T31][t31], [T40][t40]                                                      |
| SC2235   | 0x60 | ?:0x22 ?:0x35            |  50 | 1936x1096 | 1928x1028 |         |        |       |              |      | CSP-41                     | [DS](docs/SmartSens_SC2235_DS_V1.5_20170831.CN.pdf), [T30][t30]                         |
| SC2239   | 0x60 | ?:0xCB ?:0x10            |  30 | 2200x1350 |     x     |         |        |       |              |      |                            |                                                                                         |
| SC2239P  | 0x60 | ?:0xCB ?:0x3E            |  30 | 1920x1080 |     x     |         |        |       |              |      |                            |                                                                                         |
| SC2300   | 0x60 | 0x3107:0x23 0x3108:0x00  |  30 | 1944x1104 |     x     |  1/2.8" | 2.90μm |       |              |      | iLLUMi SmartClarity        |                                                                                         |
| SC2310   | 0x60 | ?:0x23 ?:0x11            |  30 | 2250x1440 |     x     |         |        |       |              |      |                            | [T30][t30]                                                                              |
| SC2315E  | 0x60 | ?:0x22 ?:0x38 ?:0x20     |  30 | 2200x1350 |     x     |         |        |       |              |      |                            |                                                                                         |
| SC233A   |      |                          |     |     x     |     x     |         |        |       |              |      | DSI-2                      |                                                                                         |
| SC2332   | 0x60 | ?:0xCB ?:0x17            |  30 | 1920x1080 |     x     |         |        |       |              |      |                            |                                                                                         |
| SC2335   | 0x30 | 0x3107:0xCB 0x3108:0x14  |  30 | 1928x1088 | 1920x1080 |  1/2.8" | 2.90μm |  74dB |  4.65V/lux.s | 39dB | CSP-41, PLCC-48            | [DS](docs/SmartSens_SC2335_DS_V0.6_20200421.CN.pdf), [T31][t31], [T40][t40]             |
| SC2336   | 0x60 | ?:0xCB ?:0x3A            |  30 | 1920x1080 |     x     |  1/3.0" | 2.70μm |       | 6.594V/lux.s |      | DSI-2                      | [T31][t31]                                                                              |
| SC301IoT | 0x60 | ?:0xCC ?:0x40            |  30 | 2048x1536 |     x     |         |        |       |              |      | DSI-2                      |                                                                                         |
| SC3035-D |      |                          |  30 |     x     | 2304x1536 |  1/3.0" | 2.20μm |       |              |      | RAW DVP PLCC-48            |                                                                                         |
| SC3035-M |      |                          |  60 |     x     | 2304x1536 |  1/3.0" | 2.20μm |       |              |      | RAW MIPI PLCC-48           |                                                                                         |
| SC3235   | 0x60 | ?:0xCC ?:0x05            |  30 | 2400x1620 |     x     |         |        |       |              |      |                            |                                                                                         |
| SC3335   | 0x60 | ?:0xCC ?:0x1A            |  30 | 2500x1620 |     x     |         |        |       |              |      |                            |                                                                                         |
| SC3336   | 0x60 | ?:0xCC ?:0x41            |  30 | 2312x1304 |     x     |  1/2.8" | 2.45μm |       | 4.947V/lux.s |      | DSI-2                      |                                                                                         |
| SC3338   | 0x60 | ?:0xCC ?:0x41            | 100 | 2304x1296 |     x     |         |        |       |              |      |                            | [T31][t31]                                                                              |
| SC4210H  |      |                          |  60 | 2576x1452 | 2560x1440 |  1/1.8" | 3.00μm |       |              |      | BSI                        |                                                                                         |
| SC4236   | 0x60 | ?:0x32 ?:0x35            |  30 | 2500x1920 | 2304x1536 |  1/2.6" | 2.50μm |       |              |      | SmartPixel                 | [T30][t30], [T31][t31]                                                                  |
| SC4236H  | 0x60 | ?:0x32 ?:0x35            | 100 | 2000x1504 |     x     |         |        |       |              |      |                            |                                                                                         |
| SC4238   | 0x60 | ?:0x42 ?:0x35            |  60 | 2688x1520 | 2560x1440 |  1/3.0" | 2.00μm |       |              |      | SmartClarity               |                                                                                         |
| SC4335   | 0x60 | ?:0xCD ?:0x01            |  30 | 2572x1452 | 2560x1440 |  1/2.7" | 2.25μm |       |              |      | DSI                        | [T30][t30]                                                                              |
| SC4336   | 0x60 | ?:0xDC ?:0x42            |  30 | 2568x1448 | 2560x1440 | 1/3.06" | 2.00µm |       |              |      | DSI-2 SFCPixel             |                                                                                         |
| SC5235   | 0x30 | 0x3107:0x52 0x3108:0x35  |  20 | 2592x1944 | 2592x1944 |  1/2.7" | 1.99µm | 100dB |   2.8V/lux.s | 39dB | CSP-41 iLLUMi SmartClarity | [DS](docs/SmartSens_SC5235_DS_V1.7_20181101.CN.pdf), [T30][t30], [T31][t31], [T40][t40] |
| SC5238   | 0x30 | 0x3107:0x52 0x3108:0x35! |  30 | 2608x1960 | 2592x1944 |  1/2.7" | 1.99µm | 100dB |   2.8V/lux.s | 39dB | CSP-41 iLLUMi SmartClarity | [DS](docs/SmartSens_SC5238_DS_V1.2_20180104.CN.pdf)                                     |
| SC5300   |      |                          |     | 2592x1944 |     x     |  1/2.5" | 2.20μm |       |              |      | iLLUMi SmartClarity        |                                                                                         |
| SC8238   | 0x30 | ?:0x82 ?:0x35            |  30 | 3872x2180 | 3840x2160 |  1/2.7" | 1.50μm |       |  1.16V/lux.s | 36dB | iLLUMi SmartClarity        | [DS](docs/SmartSens_SC8238_DS_V0.7_20200421.CN.pdf)                                     |

## AI SERIES

| Sensor  | I2C  | register:value | fps |    WxH    | Act. WxH  |   Size |  Pixel | SNR |  Sensitivity | DR | Technology                 | References |
|---------|------|----------------|----:|:---------:|:---------:|-------:|-------:|----:|-------------:|---:|----------------------------|------------|
| SC200AI | 0x60 | ?:0xCB ?:0x1C  |  60 | 1928x1088 | 1920x1080 |        |        |     |              |    | SmartClarity               | [T31][t31] |
| SC230AI | 0x60 | ?:0xCB ?:0x34  |  60 | 1928x1088 | 1920x1080 | 1/2.8" | 2.90μm |     | 7.178V/lux.s |    | BSI SCP SmartClarity-2     |            |
| SC231AI |      |                |  60 |           | 1920x1080 | 1/2.9" | 2.80μm |     |              |    | SmartClarity-3             |            |
| SC400AI |      |                |     | 2568x1448 | 2560x1440 |        |        |     |              |    | SmartClarity-2             |            |
| SC401AI | 0x60 | ?:0xCD ?:0x2E  |  30 | 2568x1448 | 2560x1440 | 1/3.0" | 2.00μm |     |              |    | BSI SmartClarity-2 PixGain |            |
| SC430AI |      |                |  60 | 2696x1528 | 2560x1440 | 1/2.9" | 2.00μm |     | 2.614V/lux.s |    | BSI SCP SmartClarity-2     |            |
| SC431AI |      |                |  60 |           | 2560x1440 | 1/3.0" | 2.90μm |     |              |    | SmartClarity-3             |            |
| SC450AI | 0x60 | ?:0xBD ?:0x2F  |  60 | 2704x1536 | 2592x1520 | 1/1.8" | 2.90µm |     |              |    | SmartClarity               |            |
| SC500AI | 0x60 | ?:0xCE ?:0x1F  |  30 | 2592x1620 |           |        |        |     |              |    | SmartClarity               | [T40][t40] |
| SC501AI |      |                |     |           |           |        |        |     |              |    | SmartClarity               |            |
| SC530AI |      |                |  60 |           |           | 1/2.7" | 2.00μm |     | 2.614V/lux.s |    | BSI SCP SmartClarity-2     |            |
| SC830AI |      |                |  30 | 3840x2160 |           | 1/2.7" | 1.50μm |     | 1.250V/lux.s |    | BSI SmartClarity-2         |            |

## SL SERIES

| Sensor  | I2C | register:value | fps | WxH | Act. WxH  |   Size |  Pixel |  SNR |  Sensitivity | DR | Technology                                         | References |
|---------|-----|----------------|----:|:---:|:---------:|-------:|-------:|-----:|-------------:|---:|----------------------------------------------------|------------|
| SC850SL |     |                |  60 |     | 3856x2176 | 1/1.8" | 2.00μm | 39dB | 5.034V/lux.s |    | SmartClarity CSP StackBSI+RS PixGain Staggered HDR |            |

### GS SERIES

| Sensor   | I2C | register:value | fps |    WxH    |   WxHa    |   Size |  Pixel | SNR | Sensitivity | DR | Technology                            | References |
|----------|-----|----------------|----:|:---------:|:---------:|-------:|-------:|----:|------------:|---:|---------------------------------------|------------|
| SC031GS  |     |                | 240 |           |  640x480  |   1/6" | 3.75μm |     |             |    | MIPI DVP LVDS CSP/COB                 |            |
| SC130GS  |     |                | 240 |           | 1280x1024 | 1/2.4" | 4.00μm |     |             |    | MIPI DVP LVDS CLCC                    |            |
| SC132GS  |     |                | 120 |           | 1280x1024 |   1/4" | 2.70μm |     |             |    | MIPI LVDS COB/Fan-out                 |            |
| SC133GS  |     |                | 120 |           | 1280x1024 |   1/4" | 2.70μm |     |             |    | MIPI LVDS Fan-out                     |            |
| SC133HGS |     |                | 120 | 1288x968  | 1280x960  | 1/3.7" | 3.00μm |     |             |    | MIPI DVP LVDS CSP42                   |            |
| SC135HGS |     |                | 160 | 1296x1040 | 1280x1024 | 1/3.2" | 3.45μm |     |             |    | MIPI DVP LVDS CSP/CLGA SmartGS-2 Plus |            |
| SC233HGS |     |                | 120 | 1928x1208 | 1920x1200 | 1/2.6" | 3.00μm |     |             |    | MIPI DVP LVDS CSP48                   |            |
| SC235HGS |     |                | 130 | 1296x1040 | 1600x1200 | 1/2.6" | 3.45μm |     |             |    | MIPI DVP LVDS CSP/CLGA SmartGS-2 Plus |            |
| SC350HGS |     |                |  75 | 1768x1768 | 1760x1760 |   2/3" | 4.20μm |     |             |    | MIPI LVDS CLGA                        |            |
| SC410GS  |     |                |  50 | 1768x2352 | 1752x2336 | 1/1.3" | 4.20μm |     |             |    | MIPI LVDS CLGA                        |            |
| SC535HGS |     |                |  80 | 2448x2048 |           |   2/3" | 3.45μm |     |             |    | MIPI LVDS CLGA                        |            |
| SC650HGS |     |                |  65 | 2896x2176 |           |   1.0" | 4.00μm |     |             |    | MIPI LVDS CLGA                        |            |
| SC910GS  |     |                |  50 |           | 3856x2368 |   1.1" | 4.00μm |     |             |    | MIPI LVDS CLGA                        |            |
| SC950HGS |     |                |  65 |           | 3856x2368 |   1.1" | 4.00μm |     |             |    | MIPI LVDS CLGA                        |            |

### LA SERIES

| Sensor   | I2C | register:value |    fps | WxH | Act. WxH | Size | Pixel | SNR | Sensitivity | DR | Technology | References |
|----------|-----|----------------|-------:|:---:|:--------:|-----:|------:|----:|------------:|---:|------------|------------|
| SC430LA  |     |                | 200kHz |     |  4096x3  |      | 7.0μm |     |             |    | LVDS CLCC  |            |
| SC830LA  |     |                | 200kHz |     |  8192x4  |      | 7.0μm |     |             |    | LVDS PCBA  |            |
| SC1630LA |     |                | 100kHz |     | 16384x2  |      | 3.5μm |     |             |    | LVDS PCBA  |            |

### Series

- SmartGS - BSI + Global Shutter
- SL - StarLight
- AI - Advanced Imaging
- AP - Automotive Product (Sensor + ISP + TX)
- CS - Cellphone Sensor
- LA - Linear Scanner

#### Technologies

- BSI - Back Sensor Illumination
- DSI - Digitally Stabilized Image
- GS - Global Shutter

* Ingenic sensor drivers use unshifted I2C bus address. E.g. `0x6E >> 1 = 0x37`, `0x78 >> 1 = 0x3C`.
* Question mark after an address (`0x6F?`) means it is not corroborated by a data sheet.
* Exclamation mark after an address (`0x53!`) means the data is probably erroneous.

[t20]: https://github.com/themactep/openingenic/blob/master/kernel/sensors/t20/
[t30]: https://github.com/themactep/openingenic/blob/master/kernel/sensors/t30/
[t31]: https://github.com/themactep/openingenic/blob/master/kernel/sensors/t31/
[t40]: https://github.com/themactep/openingenic/blob/master/kernel/sensors/t40/

### Unsorted

from https://kitcam.ru/stati-tehnologii/originalnaya-tablica-sensory-izobrazheniya-smartsens-gs

| Product Series         | PN       | Resolution | Optical Format | PixelSize | Shutter Type | HDR | Pixel Array | Max FrameRate | CRA    | Interface     | Package     |
|------------------------|----------|-----------:|----------------|----------:|--------------|-----|-------------|---------------|--------|---------------|-------------|
| SmartGS                | SC031GS  |      0.3MP | 1/6"           |    3.75μm | Global       | Yes | 640x480     | 240fps        | 33°    | MIPI DVP LVDS | CSP/COB     |
| SmartClarity           | SC100AT  |      1.3MP | 1/3.6″         |     3.0μm | Rolling      | Yes | 1360x976    | 60fps         | 0°     | DVP MIPI      | IBGA/CSP    |
| SmartGS                | SC130GS  |      1.3MP | 1/2.7"         |     4.0μm | Global       | Yes | 1280x1024   | 240fps        | 0°     | MIPI DVP LVDS | CLCC        |
| SmartGS                | SC132GS  |      1.3MP | 1/4"           |     2.7μm | Global       | Yes | 1080x1280   | 120fps        | 25°    | MIPI LVDS     | COB/Fan-out |
| SmartGS                | SC133GS  |      1.3MP | 1/4″           |     2.7μm | Global       | Yes | 1080x1280   | 120fps        | 25°    | MIPI LVDS     | Fan-out     |
| SmartClarity           | SC200AI  |        2MP | 1/2.8"         |     2.9μm | Rolling      | Yes | 1928x1088   | 60fps         | 15°    | DVP MIPI      | CSP41       |
| SmartPixel             | SC200CS  |        2MP | 1/5.1"         |    1.75µm | Rolling      |     | 1608x1208   | 30fps         | 31.5°  | MIPI          | CSP/COB     |
| SmartPixel             | SC210IoT |        2MP | 1/3″           |     2.7μm | Rolling      |     | 1928x1088   | 30fps         | 15°    | DVP MIPI      | CSP34       |
| SmartGS                | SC410GS  |        4MP | 1/1.3″         |     4.2μm | Global       | Yes | 1752x2336   | 50fps         | 9°     | MIPI LVDS     | CLGA        |
| SmartClarity           | SC500AI  |        5MP | 1/2.7"         |     2.0μm | Rolling      | Yes | 2888x1628   | 60fps         | 15°    | MIPI          | CSP41       |
| SmartPixel             | SC500CS  |        5MP | 1/5"           |    1.12µm | Rolling      |     | 2600x1952   | 30fps         | 31.9°  | MIPI          | CSP/COB     |
| SmartPixel             | SC800CS  |        8MP | 1/4"           |    1.12µm | Rolling      |     | 3280x2464   | 30fps         | 32.55° | MIPI          | COB         |
| SmartGS                | SC910GS  |        9MP | 1.1"           |   3.996µm | Global       | Yes | 3856x2368   | 50fps         | 9°     | MIPI LVDS     | CLGA        |
| SmartPixel             | SC1300CS |       13MP | 1/3.06"        |    1.12µm | Rolling      |     | 4216x3128   | 30fps         | 33.2°  | MIPI          | COB         |
| SmartPixel             | SC1301CS |       13MP | 1/3.06"        |    1.12µm | Rolling      |     | 4216x3128   | 30fps         | 33.2°  | MIPI          | COB         |
| SmartPixel             | SC1235   |      1.3MP | 1/3"           |    3.75μm | Rolling      |     | 1288x968    | 60fps         | 12°    | DVP           | CSP41       |
| SmartPixel             | SC1245   |        1MP | 1/4"           |     3.0μm | Rolling      |     | 1288x728    | 60fps         | 15°    | DVP           | CSP29       |
| SmartPixel             | SC1330T  |     1.23MP | 1/2.8"         |     4.0μm | Rolling      | Yes | 1288x968    | 60fps         | 15°    | MIPI DVP LVDS | CSP41       |
| SmartPixel             | SC1335T  |        1MP | 1/3″           |    3.75μm | Rolling      |     | 1292x732    | 60fps         | 15°    | MIPI DVP LVDS | CSP34       |
| SmartClarity  H Series | SC2210H  |        2MP | 1/1.8″         |     4.0μm | Rolling      | Yes | 1920x1080   | 90fps         | 9°     | MIPI DVP LVDS | CSP70       |
| SmartPixel             | SC2232   |        2MP | 1/2.9"         |     2.8μm | Rolling      |     | 1936x1096   | 30fps         | 15°    | DVP MIPI      | CSP41       |
| SmartPixel             | SC2235   |        2MP | 1/2.7"         |     3.0μm | Rolling      |     | 1936x1096   | 50fps         | 15°    | DVP           | CSP41       |
| SmartPixel             | SC2238   |        2MP | 1/2.7"         |     3.0μm | Rolling      |     | 1936x1096   | 50fps         | 15°    | DVP           | CSP41       |
| SmartClarity           | SC2310   |        2MP | 1/2.7"         |     3.0μm | Rolling      | Yes | 1932x1092   | 60fps         | 12°    | DVP MIPI      | CSP41       |
| SmartClarity  H Series | SC2310H  |        2MP | 1/2.7"         |     3.0μm | Rolling      | Yes | 1932x1092   | 60fps         | 12°    | DVP MIPI      | CSP41       |
| SmartClarity           | SC2310T  |        2MP | 1/2.7"         |     3.0μm | Rolling      | Yes | 1932x1092   | 60fps         | 12°    | DVP MIPI      | CSP41       |
| SmartPixel-2           | SC2320   |        2MP | 1/2.7"         |     3.0μm | Rolling      | Yes | 1932x1098   | 90fps         | 15°    | DVP MIPI      | CSP41       |
| SmartPixel             | SC3235   |        3MP | 1/2.7"         |     2.5μm | Rolling      |     | 2316x1308   | 30fps         | 15°    | DVP MIPI      | CSP41       |
| SmartPixel-2           | SC3320   |        3MP | 1/2.5″         |    2.75μm | Rolling      | Yes | 2316x1308   | 60fps         | 12°    | DVP MIPI      | CSP47       |
| SmartPixel-2           | SC3320   |        3MP | 1/2.5″         |    2.75μm | Rolling      | Yes | 2316x1308   | 60fps         | 12°    | DVP MIPI      | CSP47       |
| SmartClarity           | SC4210   |        4MP | 1/1.8″         |     3.0μm | Rolling      | Yes | 2576x1452   | 60fps         | 9°     | MIPI DVP LVDS | CSP70       |
| SmartClarity  H Series | SC4210H  |        4MP | 1/1.8″         |     3.0μm | Rolling      | Yes | 2576x1452   | 60fps         | 9°     | MIPI DVP LVDS | CSP70       |
| SmartClarity           | SC4210T  |        4MP | 1/1.8″         |     3.0μm | Rolling      | Yes | 2576x1452   | 60fps         | 9°     | MIPI DVP LVDS | CSP70       |
| SmartPixel             | SC4236   |      3.6MP | 1/2.6"         |     2.5μm | Rolling      |     | 2304x1536   | 30fps         | 15°    | DVP MIPI      | CSP41       |
| SmartClarity           | SC4238   |        4MP | 1/3″           |     2.0μm | Rolling      | Yes | 2688x1520   | 60fps         | 15°    | DVP MIPI      | CSP41       |
| SmartClarity  H Series | SC4238H  |        4MP | 1/3″           |     2.0μm | Rolling      | Yes | 2688x1520   | 60fps         | 15°    | DVP MIPI      | CSP/PLCC    |
| SmartPixel-2           | SC4335   |        4MP | 1/2.7"         |    2.25μm | Rolling      |     | 2572x1452   | 30fps         | 15°    | DVP MIPI      | CSP41       |
| SmartClarity           | SC5235   |        5MP | 1/2.7"         |     2.0μm | Rolling      | Yes | 2592x1944   | 20fps         | 15°    | MIPI          | CSP41       |
| SmartClarity           | SC5238   |        5MP | 1/2.7"         |     2.0μm | Rolling      | Yes | 2608x1960   | 20fps         | 15°    | MIPI          | CSP41       |
| SmartClarity  H Series | SC5238H  |        5MP | 1/2.7"         |     2.0μm | Rolling      | Yes | 2608x1960   | 30fps         | 15°    | MIPI          | CSP41       |
| SmartPixel-2           | SC5335   |        5MP | 1/2.7"         |    2.05μm | Rolling      |     | 2604x1956   | 30fps         | 15°    | DVP MIPI      | CSP41       |
| SmartPixel-2           | SC8220   |        8MP | 1/1.8″         |    2.05μm | Rolling      | Yes | 3860x2180   | 60fps         | 11°    | MIPI LVDS     | CSP72       |
| SmartClarity           | SC8238   |        8MP | 1/2.7″         |     1.5μm | Rolling      | Yes | 3872x2180   | 30fps         | 15°    | MIPI LVDS     | CSP41       |
| SmartClarity  H Series | SC8238H  |        8MP | 1/2.7"         |     1.5μm | Rolling      | Yes | 3872x2180   | 30fps         | 15°    | MIPI LVDS     | CSP/PLCC    |
