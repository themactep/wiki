Ingenic Zeratul Development
===========================

Preface and Table of Contents
-----------------------------

### Foreword

The 2020 epidemic coupled with the shortage of Heath supply has led many 
solutions to start looking for a corresponding alternative. For Heath's 
low-power video solution, Ingenic T31 Zeratul is a more ideal alternative.
Ingenic low-power solution, because the forward use is not large, so the whole
program is not very mature. Development documents and information compared to 
the Hysis or some gaps in the use of the process, there are still many problems
need to continue to optimize. I use Ingenic T31 Zeratul in their own problems
and some knowledge points to organize into an article, so that they can check
later, but also for your reference.

### Difference between Zeratul and ISVP

Zeratul is a battery IPC development platform based on Ingenic's T series chips,
which enables developers to quickly develop battery-based products.

Zeratul is based on ISVP (Ingenic Smart Video Platform), and encapsulates the
special functions of battery IPC, such as WIFI connection, power management,
power off and wake up, etc.

Relationship between ISVP and Zeratul: ISVP contains toolchain, basic operation
documentation (e.g. TF boot card creation tutorial), and libimp API (audio/video
service for IPC products) and docs, and other basic resources. Zeratul SDK 
extends the functions and applications required by battery IPC, such as switch
control, WIFI operation and so on.

### Product Architecture

Battery-based IPC products are generally divided into two forms:

![](image1.png)

Set: The product consists of a Station + several Cameras

![](image2.png)

Single product: Product is a Camera, directly linked to the router

### Ingenic T31

From the official information we can see that

Block diagram of the chip.

![](image3.png)

Chip specifications.

| Module                 | Description                                                        |
|------------------------|--------------------------------------------------------------------|
| CPU                    | Ultra-high main frequency up to 1.5GHz .                           |
|                        | 1.5GHz SIMD128 AI acceleration engine.                             |
|                        | 64KB + 128KB L1 / L2 Cache                                         |
|                        | Risc V Independent Small Core                                      |
| Video Encoder          | H.264/H.265/MJPEG Encoder                                          |
|                        | Video Encoder with resolution up to 2592*1920@30fps                |                                               
|                        | The international first-class encoding engine                      |                                                     
| Starlight-grade ISP    | Specially optimized for low-light video surveillance scenarios     |
|                        | New generation 2D/3D noise reduction                               |
|                        | Sharpening Enhancement, ROI-AE                                     |
|                        | Advanced WDR, DRC                                                  |
|                        | Distortion Correction                                              |
| Memory                 | Internal DDR:512Mb/1Gb                                             |
| Security               | AES/RSA/SHA/TRNG/OTP                                               |
|                        | Support Secure Boot                                                |
| Fast AI implementation | Support deep learning algorithm with high accuracy and flexibility |
|                        | Support human shape detection, face detection and face recognition |
|                        | Support cry detection, vehicle detection and pet detection         |
| Package                | 22nm process                                                       |
|                        | Package: QFN88/BGA192                                              |
| Quick Start            | Quick Start Support                                                |
|                        | Dual Start                                                         |
|                        | Quick Auto Exposure / Auto White Balance                           |
|                        | Stabilized image output for approx. 200ms                          |
| Expansion Circuitry    | Supports 4-channel digital MIC array                               |
|                        | Support IoT-WIFI / BT / 4                                          |
|                        | Support SLCD display                                               |
|                        | Support UVC/UAC                                                    |
| Audio                  | Internal integrated audio codec                                    |
|                        | Support multiple sample rates: 8K/12K/16K/24K/32K/44.1K/48K/96K    |
|                        | I2S support                                                        |                                                                    
|                        | Echo cancellation support                                          |                                                                    
| Peripheral Circuitry   | Support WDT, ADC, UART, I2C, SPI, GPIO, SDIO, PWM, USB, GMAC       |

#### Description.

Those parameters above are officially given, should be the official data tested
in their development boards, in the actual product use process will find that 
many parameters are more difficult to achieve very good results, perhaps this
official will be released later in the SK slowly optimize the good.

### Series of articles table of contents

- Ingenic Zeratul Development (0) - Preface and Table of Contents
- Ingenic Zeratul Development (1) - Partition Boot Analysis
- Ingenic Zeratul Development (2) - uboot boot analysis
- Ingenic Zeratul Development (3) - Upgrade Rollback
- Ingenic Zeratul development (4) - image effect debugging
- Ingenic Zeratul development (5) - fast boot optimization
- Ingenic Zeratul development (6) - why disable the use of system


######################2022.08.28######################
This blog will stop being updated
New article content and attached project files
Please go to liwen01 blog home page for information
Updated by liwen01 on 2022.08.28
######################2022.08.28######################
————————————————
Copyright: This is an original article by CSDN blogger "li_wen01", following
the CC 4.0 BY-SA copyright agreement, please include a link to the original
source and this statement.

Link to original article: https://blog.csdn.net/li_wen01/article/details/115302346
