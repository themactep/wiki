Milk-V
------

Milk-V Duo features a 16-pin FPC interface for 2-lane MIPI serial camera input
that operates I2C, CLK, and RST signals at a 1.8V voltage level.

### Milk-V Duo CSI-2 Camera Module

- https://milkv.io/docs/duo/camera/gc2083
- https://github.com/milkv-duo/accessories/tree/master/CAM-GC2083

FPC Interface Definition

| Pin | Definition  | Description               |
|-----|-------------|---------------------------|
| 1   | GND         | Ground                    |
| 2   | MIPI0_DN0   | MIPI Data Lane 0 Negative |
| 3   | MIPI0_DP0   | MIPI Data Lane 0 Positive |
| 4   | GND         | Ground                    |
| 5   | MIPI0_DN1   | MIPI Data Lane 1 Negative |
| 6   | MIPI0_DP1   | MIPI Data Lane 1 Positive |
| 7   | GND         | Ground                    |
| 8   | MIPI0_CKN   | MIPI Clock Lane Negative  |
| 9   | MIPI0_CKP   | MIPI Clock Lane Positive  |
| 10  | GND         | Ground                    |
| 11  | SENSOR_RSTN | Sensor Reset              |
| 12  | SENSOR_CLK  | Sensor Clock              |
| 13  | I2C_SCL     | I2C SCL                   |
| 14  | I2C_SDA     | I2C SDA                   |
| 15  | /           |                           |
| 16  | 3V3         | 3.3V Power Input          |
