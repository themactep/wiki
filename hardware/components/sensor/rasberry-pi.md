Raspberry Pi Camera Interface
-----------------------------

### Raspberry Pi Camera Connector

The Raspberry Pi camera has three major connectors: 54548-2271, SFW15R-2STE1LF, and 1-1734248-5.
The table below further describes the connector’s location, pitch, location, and mounting angle.

| Connector       | Manufacturer    | Location                  | Pins | Mount        | Pitch   |
|-----------------|-----------------|---------------------------|------|--------------|---------|
| 1-7342485-5     | TE Connectivity | Pi Board (A & B)          | 15   | Vertical     | 1.0 mm  |
| 54548-2271      | Molex           | Pi Board (Zero & CM)      | 22   | Right angle  | 0.5 mm  |
| SFW15R-2STE1LF  | Amphenol FCI    | Camera Module (V1/V2/HQ)  | 15   | Right angle  | 1.0 mm  |

### The 15-Pin Connector

This connector is used on the Pi camera and Raspberry Pi A & B series.
This connector has a pin pitch of 1mm, and it runs 2-lane MIPI only.
Pi-camera hardware uses three different 15-pin connectors.

| Pin | Name     | Description               |
|-----|----------|---------------------------|
| 1   | GND      | Ground                    |
| 2   | CAM_D0_N | MIPI Data Lane 0 Negative |
| 3   | CAM_D0_P | MIPI Data Lane 0 Positive |
| 4   | GND      | Ground                    |
| 5   | CAM_D1_N | MIPI Data Lane 1 Negative |
| 6   | CAM_D1_P | MIPI Data Lane 1 Positive |
| 7   | GND      | Ground                    |
| 8   | CAM_CK_N | MIPI Clock Lane Negative  |
| 9   | CAM_CK_P | MIPI Clock Lane Positive  |
| 10  | GND      | Ground                    |
| 11  | CAM_IO0  | Power Enable              |
| 12  | CAM_IO1  | LED Indicator             |
| 13  | CAM_SCL  | 12C SCL                   |
| 14  | CAM_SDA  | 12C SDA                   |
| 15  | CAM_3V3  | 3.3V Power Input          |

### The 22-Pin Connector

This connector is used on the Compute Module IO Board and Raspberry Pi Zero-W.
It has a pitch of 0.5mm and provides two additional MIPI data lanes.

| Pin | Name     | Description               |
|-----|----------|---------------------------|
| 1   | GND      | Ground                    |
| 2   | CAM_D0_N | MIPI Data Lane 0 Negative |
| 3   | CAM_D0_P | MIPI Data Lane 0 Positive |
| 4   | GND      | Ground                    |
| 5   | CAM_D1_N | MIPI Data Lane 1 Negative |
| 6   | CAM_D1_P | MIPI Data Lane 1 Positive |
| 7   | GND      | Ground                    |
| 8   | CAM_D2_N | MIPI Data Lane 2 Negative |
| 9   | CAM_D2_P | MIPI Data Lane 2 Positive |
| 10  | GND      | Ground                    |
| 11  | CAM_D3_N | MIPI Data Lane 3 Negative |
| 12  | CAM_D3_P | MIPI Data Lane 3 Positive |
| 13  | GND      | Ground                    |
| 14  | CAM_CK_N | MIPI Clock Lane Negative  |
| 15  | CAM_CK_P | MIPI Clock Lane Positive  |
| 16  | GND      | Ground                    |
| 17  | CAM_IO0  | Power Enable              |
| 18  | CAM_IO1  | LED Indicator             |
| 19  | GND      | Ground                    |
| 20  | CAM_SCL  | 12C SCL                   |
| 21  | CAM_SDA  | 12C SDA                   |
| 22  | CAM_3V3  | 3.3V Power Input          |
