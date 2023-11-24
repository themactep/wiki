ON Semiconductor
----------------
https://www.onsemi.com/

| Sensor | I2C  | CHIP_ID | register:value |  fps |    WxH    | Act. WxH  |   Size | Pixel, µm | V/lux.s | SNR | DR | Technology | References                                                                                     |
|--------|------|---------|----------------|-----:|:---------:|:---------:|-------:|----------:|--------:|-----|----|------------|------------------------------------------------------------------------------------------------|
| AR0130 | 0x20 | 0x0051  | ?:0x24 ?:0x02  |   45 | 1650x1212 | 1280x960  | 1/3.0" |      3.75 |         |     |    | NIR        | [T20](https://github.com/themactep/openingenic/blob/master/kernel/sensors/t20/ar0130/ar0130.c) |
| AR0144 |      |         |                |   60 |           |           |   1/4" |      3.00 |         |     |    |            |                                                                                                |
| AR0230 | 0x20 |         | ?:0x00 ?:0x56  | 5~60 | 1944x1116 | 1928x1088 | 1/2.7" |      3.00 |         |     |    |            | [T20](https://github.com/themactep/openingenic/blob/master/kernel/sensors/t20/ar0230/ar0230.c) |
| AR0521 |      |         |                |   30 |           |           | 1/2.5" |      2.20 |         |     |    | HDR LSC    |                                                                                                |
| AR1337 | 0x6C |         | ?:0x02 ?:0x53  | 5~60 | 1920x1080 | 4208x3102 | 1/3.2" |      1.10 |         |     |    |            |                                                                                                |
