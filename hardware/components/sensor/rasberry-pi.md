Raspberry Pi
------------

### Raspberry Pi Camera Modules

- https://www.waveshare.com/wiki/Main_Page#RPi-Cameras

### Raspberry Pi Camera Connector

The Raspberry Pi camera has three major connectors:

| Connector      | Manufacturer    | Location                 | Pins | Mount       | Pitch  |
|----------------|-----------------|--------------------------|------|-------------|--------|
| [1-1734248-5][3]    | TE Connectivity | Pi Board (A & B)         | 15   | Vertical    | 1.0 mm |
| [54548-2271][1]     | Molex           | Pi Board (Zero & CM)     | 22   | Right angle | 0.5 mm |
| [SFW15R-2STE1LF][2] | Amphenol FCI    | Camera Module (V1/V2/HQ) | 15   | Right angle | 1.0 mm |

### The 15-Pin Connector

This connector is used on the Pi camera and Raspberry Pi A & B series.
This connector has a pin pitch of 1mm, and it runs 2-lane MIPI only.
Pi-camera hardware uses three different 15-pin connectors.

| Pin | Definition | Description               |
|-----|------------|---------------------------|
| 1   | GND        | Ground                    |
| 2   | CAM_D0_N   | MIPI Data Lane 0 Negative |
| 3   | CAM_D0_P   | MIPI Data Lane 0 Positive |
| 4   | GND        | Ground                    |
| 5   | CAM_D1_N   | MIPI Data Lane 1 Negative |
| 6   | CAM_D1_P   | MIPI Data Lane 1 Positive |
| 7   | GND        | Ground                    |
| 8   | CAM_CK_N   | MIPI Clock Lane Negative  |
| 9   | CAM_CK_P   | MIPI Clock Lane Positive  |
| 10  | GND        | Ground                    |
| 11  | CAM_IO0    | Power Enable              |
| 12  | CAM_IO1    | LED Indicator             |
| 13  | CAM_SCL    | I2C SCL                   |
| 14  | CAM_SDA    | I2C SDA                   |
| 15  | CAM_3V3    | 3.3V Power Input          |

### The 22-Pin Connector

This connector is used on the Compute Module IO Board and Raspberry Pi Zero-W.
It has a pitch of 0.5mm and provides two additional MIPI data lanes.

| Pin | Definition | Description               |
|-----|------------|---------------------------|
| 1   | GND        | Ground                    |
| 2   | CAM_D0_N   | MIPI Data Lane 0 Negative |
| 3   | CAM_D0_P   | MIPI Data Lane 0 Positive |
| 4   | GND        | Ground                    |
| 5   | CAM_D1_N   | MIPI Data Lane 1 Negative |
| 6   | CAM_D1_P   | MIPI Data Lane 1 Positive |
| 7   | GND        | Ground                    |
| 8   | CAM_D2_N   | MIPI Data Lane 2 Negative |
| 9   | CAM_D2_P   | MIPI Data Lane 2 Positive |
| 10  | GND        | Ground                    |
| 11  | CAM_D3_N   | MIPI Data Lane 3 Negative |
| 12  | CAM_D3_P   | MIPI Data Lane 3 Positive |
| 13  | GND        | Ground                    |
| 14  | CAM_CK_N   | MIPI Clock Lane Negative  |
| 15  | CAM_CK_P   | MIPI Clock Lane Positive  |
| 16  | GND        | Ground                    |
| 17  | CAM_IO0    | Power Enable              |
| 18  | CAM_IO1    | LED Indicator             |
| 19  | GND        | Ground                    |
| 20  | CAM_SCL    | 12C SCL                   |
| 21  | CAM_SDA    | 12C SDA                   |
| 22  | CAM_3V3    | 3.3V Power Input          |

[1]: https://www.digikey.ca/en/products/detail/molex/0545482271/3196988

[2]: https://www.digikey.ca/en/products/detail/amphenol-cs-fci/SFW15R-2STE1LF/1002221

[3]: https://www.digikey.ca/en/products/detail/te-connectivity-amp-connectors/1-1734248-5/2272380 
