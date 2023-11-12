Realtek SoC
-----------

|              | RTS3901     | RTS3901L    | RTS3902     | RTS3902L    | RTS3903     | RTS3904     | RTS390X   |
|--------------|-------------|-------------|-------------|-------------|-------------|-------------|-----------|
| Architecture | MIPS        | MIPS        | MIPS        | MIPS        | MIPS        | MIPS        | ARM       |
| System CPU   | 600MHz      | 600MHz      | 600MHz      | 600MHz      | 600MHz      | 600MHz      |           |
| RAM Type     | DDR2-800    | DDR2-800    | DDR2/DDR3   | DDR3        | DDR2        | DDR3        |           |
| RAM Size     | 512MBit     | 512Mbit     | external    | 1Gbit       | 512Mbit     | 1Gbit       |           |
| ISP          |             |             |             |             | RGB+IR      | RGB+IR      | RGB+IR    |
| Max Video    | 720p@30fps  | 720p@30fps  | 1080p@30fps | 1080p@30fps | 720p@30fps  | 1080p@30fps |           |
| Video Format | H264, MJPEG | H264, MJPEG | H264, MJPEG | H264, MJPEG | H264, MJPEG | H264, MJPEG | H265/HEVC |
| Package      | BGA151      | LQFP128     | BGA234      | LQFP128     |             |             |           |

- Security Engine
  - AES, DES, 3DES
- Networking
  - Embedded 10/100 Mac and Physical Layer
  - Support USB2.0 or SDIO Wi-Fi module
- Video Features
  - 4-lane MIPI, parallel sensor interface
- ImageSignalProcessor
  - 3A(AE/AWB/AF)
  - 3D-denoise
  - De-haze
  - LDC, LSC, WDR
  - Rotate 90/270 degree(H.264)
  - Mirror and flip
- Encoder
  - H.264 encoder supports Baseline/Main Profile/High Profile level 4.1
- Audio Features
  - Build-in one 24-bit audio codec
  - ADC/DAC, DMIC input, Line in
  - I2S PLL for MCLK 24MHz/512FS/256FS and BCLK
  - Sample rate: 48kHz/44.1kHz/32kHz/16kHz/8kHz
  - G.711/G.726/AAC encoding
  - Software Acoustic echo cancellation

### Resources

- https://github.com/cjj25/RTS3903N-Tools


## Realtek Ameba Pro
- https://www.amebaiot.com/

#### RTL8715AD/RTL8715AH/RTL8715AQ
– Arm v8M @300MHz(Max.)
– Integrated with 802.11ac/n Wi-Fi
– Support Trustzone & Secure boot
– ISP Integrated
– H.264 encoder integrated up to 1080P@30fps
– Up to 64MB RAM(Max.)
– Ultra Low Power design

#### RTL8735B
– Arm v8M @500MHz(Max.)
– Integrated with 802.11 a/b/g/n Wi-Fi
– Bluetooth Low Energy (BLE) 5.1
– Support Secure boot & Crypto Engine
– ISP Integrated
– H.264/H.265 encoder up to 5MP or 1080p@45fps
– Integrated Intelligent Engine @0.4 TOPS
– Up to 128MB RAM(Max.)
– Low Power design

### Resources

- https://github.com/ambiot/ambpro2_arduino
