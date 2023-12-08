SoC for IP CCTV System
----------------------

### Fullhan
https://www.fullhan.com/

##### AHD 

| Model       | Resolution | CIS         | V In     | HDR | Denoise | ISP Features/Decoding    | Mark |
|-------------|------------|-------------|----------|-----|---------|--------------------------|------|
| FH8535      | 1MP        | Bayer/RGBIR | DVP      | NO  | 2D      | Internal PMIC            |      | 
| FH8536HV200 | 2MP        | Bayer/RCCB  | MIPI/DVP | NO  | 2D/3D   | Support lower frame rate |      | 
| FH8537      | 2MP        | Bayer/RGBIR | DVP      | NO  | 2D      | Internal PMIC            |      |
| FH8538E     | 5MP        | Bayer       | MIPI     | NO  | 2D      | Audio uplink             |      | 
| FH8538M     | 5MP        | Bayer/RGBIR | MIPI     | NO  | 2D      | High Quality             |      | 
| FH8550M     | 2MP        | Bayer       | MIPI     | YES | 2D/3D   | High Quality             |      | 
| FH8556      | 8MP        | Bayer       | MIPI     | YES | 2D/3D   | High Quality             |      | 
| FH8562      | 2MP        | Bayer/RCCB  | MIPI     | NO  | 2D/3D   | Support lower frame rate |      | 

##### AHD Rx

| Model   | Resolution | Video Inputs | Video Outputs | Audio   | Two-way |
|---------|------------|--------------|---------------|---------|---------|
| FH6210  | 4K         | 4xCH         | DVP           | Support | Support |

##### IPC

| Model      | Core | Encoding  | Codec | AI   | RAM      | ISP Features/Decoding | Mark |
|------------|------|-----------|-------|------|----------|-----------------------|------|
| FH8626V100 |      | 2MP15fps  | H.264 | CPU  | 64MB     |                       |      | 
| FH8636     |      | 3MP25fps  | H.265 | 0.5T | 64MB     |                       |      | 
| FH8652     |      | 3MP20fps  | H.265 | 0.5T | 64MB     |                       |      | 
| FH8656     |      | 4MP25fps  | H.265 | 0.5T | 128MB    |                       |      | 
| FH8658     |      | 5MP20fps  | H.265 | 0.5T | External |                       |      | 
| FH8852V200 |      | 4MP20fps  | H.265 | CPU  | 64MB     |                       |      | 
| FH8852V201 |      | 3MP25fps  | H.265 | 0.5T | 64MB     |                       |      | 
| FH8852V210 |      | 4MP20fps  | H.265 | CPU  | 64MB     |                       |      | 
| FH8856V200 |      | 5MP25fps  | H.265 | CPU  | 128MB    |                       |      |
| FH8856V210 |      | 5MP25fps  | H.265 | CPU  | 128MB    |                       |      | 
| FH8858V200 |      | 8MP15fps  | H.265 | CPU  | External |                       |      | 
| FH8898     |      | 8MP@30fps | H.265 | 2.0T | External |                       |      | 
| FH8896     |      | 8MP@30fps | H.265 | 2.0T | External |                       |      | 
| EZH5330L   |      |           |       |      |          |                       |      |

###### DVR

| Model  | Core   | Encoding    | Decoding   | Display | AI   | RAM | ISP Features/Decoding | Mark |
|--------|--------|-------------|------------|---------|------|-----|-----------------------|------|
| MC6670 | 1.3GHz | 11xFHD30fps | 8xFHD30fps | 4K      | 4T   |     |                       |      |
| MC6630 | 1.3GHz | 2xFHD30fps  | 2xFHD30fps | 4K      | 0.5T |     |                       |      |
| MC6650 | 1.5GHz | 4xFHD30fps  | 4xFHD30fps | 4K      | 0.5T |     |                       |      |

##### NVR

| Model   | Core   | Encoding   | Decoding     | Display | AI   | RAM      | ISP Features/Decoding | Mark |
|---------|--------|------------|--------------|---------|------|----------|-----------------------|------|
| MC6880  | 1.3GHz | 4xFHD30fps | 24xFHD@30fps | 4K      | 4T   | External |                       |      | 
| MC6870  | 1.5GHz | 4xFHD30fps | 32xFHD@30fps | 8K      | CPU  | External |                       |      |
| MC6850  | 1.5GHz | 2xFHD30fps | 8xFHD@30fps  | 4K      | 0.5T | External |                       |      |
| MC6830  | 1.3GHz | 1xFHD30fps | 5xFHD30fps   | 4K      | 0.5T | External |                       |      |
| MC6810  | 1GHz   |            | 4xFHD30fps   | 4K      | CPU  | External |                       |      |
| MC6810E | 1GHz   |            | 4xFHD30fps   | 4K      | CPU  | 256MB    |                       |      |

###### Smart Display

| Model  | CPU  | Video Inputs | Encoder/Decoder | Display       | AI Power | DDR   |
|--------|------|--------------|-----------------|---------------|----------|-------|
| MC3312 | 1GHz | 2MP DVP      | FHD@120fps      | FHD@30fps     | CPU      | 128MB | 
| MC3310 | 1GHz | 2MP DVP      | FHD@120fps      | FHD@30fps     | CPU      | 64MB  |

##### Automotive Camera ISP

| Model   | Resolution       | Video Outputs      | HDR                   | Denoise | Certification |
|---------|------------------|--------------------|-----------------------|---------|---------------|
| FH8332  | 3MP@30fps        | MIPI/DVP/HD Analog | 3F WDR                | 3D      | AEC-Q100      |   
| FH8323  | 2MP@60fps        | MIPI/DVP/HD Analog | 4F WDR                | 2D      | NO            |   
| FH8322  | 2MP@30fps        | MIPI/DVP/HD Analog | 3F WDR                | 2D      | AEC-Q100      |   
| FH8320  | 960P@30fps       | MIPI/DVP/HD Analog | 4F WDR                | 2D      | AEC-Q100      |   
| FH8310  | 2MP, Bayer/RGBIR | DVP/HD Analog      | NO                    | 2D/3D   | AEC-Q100      |   
| FH8550M | 2MP              | HD Analog          | WDR, Lower Frame Rate | 2D/3D   | NO            |   
| FH8532E | 1MP              | HD Analog          | NO                    | 2D      | NO            |

##### Automotive AHD Rx

| Model  | Resolution | Input | Outputs | HDR     | Denoise | Certification |
|--------|------------|-------|---------|---------|---------|---------------|
| FH6210 | 4K         | 4xCH  | DVP     | Support | Support | NO            |

##### Automotive DVR SoC

| Model  | CPU    | Encoder    | Decoder    | Display | AI   |
|--------|--------|------------|------------|---------|------|
| MC6630 | 1.3GHz | 2xFHD30fps | 2xFHD30fps | 4K      | 0.5T |

### Hisilicon

##### IPC

| Model           | Core                               | Encoding                         | Codec       | ISP Features/Decoding | Mark       |
|-----------------|------------------------------------|----------------------------------|-------------|-----------------------|------------|
| Hi3518EV200/201 | ARM926@550MHz                      | 1280x960 30fps / 1920x1080 15fps | H.264       | DWDR, Tone Mapping    | Mainstream |
| Hi3516CV100/200 | ARM926@440/550MHz                  | 1080P 30fps+VGA 30fps            | H.264       | DWDR, Tone Mapping    | Mainstream |             
| Hi3516CV300     | ARM926@800MHz                      | 1080P 30fps+720p 30fps           | H.264/H.265 | WDR, Tone Mapping     | Mainstream |             
| Hi3516DV100     | Cortex A7@600MHz                   | 3MP 30fps / 4MP25fps / 5MP 15fps | H.264/H.265 | WDR, Tone Mapping     | Advanced   |             
| Hi3516AV100     | Cortex A7@600MHz                   | 5MP 30fps + VGA 30fps            | H.264/H.265 | WDR, Tone Mapping     | Mainstream |             
| Hi3519V101      | Cortex A17@1.2GHz+Cortex A7@800MHz | 4K 30fps + 1080P 30fps           | H.264/H.265 | 4-frame WDR           | Advanced   |             

##### HD DVR

| Model       | Core                             | Encoding                        | Codec           | ISP Features/Decoding | Mark            |
|-------------|----------------------------------|---------------------------------|-----------------|-----------------------|-----------------|
| Hi3520DV200 | Cortex A9@660MHz                 | 4CH 720P 25fps + 4CH CIF 25fps  | H.264           | 1CH 720P Decoding     | Entry-level     |
| Hi3520DV300 | Cortex A7@800MHz                 | 4CH 720P 25fps + 4CH CIF 25fps  | H.264           | 4CH 720P Decoding     | Mainstream      |             
| Hi3521AV100 | Cortex A7@1.1GHz                 | 4CH 1080P 30fps + 4CH CIF 30fps | H.264           | 1CH 1080P Decoding    | Mainstream      |             
| Hi3531AV100 | Dual-core ARM Cortex A9@1.0GHz   | 8Ch 1080P 30fps + 8CH CIF 30fps | H.264           | 4CH 1080P Decoding    | Mainstream      |             

##### NVR

| Model       | Core                                              | Encoding        | Codec       | ISP Features/Decoding | Mark            |
|-------------|---------------------------------------------------|-----------------|-------------|-----------------------|-----------------|
| Hi3535V100  | Dual-core ARM Cortex A9@1.1GHz                    | 1CH 1080P 30fps | H.264       | 5CH 1080P 30fps       | Mainstream      |
| Hi3536CV100 | Dual-core ARM Cortex A7 @1.3 GHz                  | 1CH 1080P 30fps | H.264/H.265 | 4CH 1080P 30fps       | Multifunctional |             
| Hi3536V100  | Quad-core ARM Cortex A17 @1.4 GHz + Mali-T720 GPU | 2CH 1080P 30fps | H.264/H.265 | 4CH 4K 30fps          | Multifunctional |             

### Ambarella

| Model | Core                | Encoding        | Codec       | ISP Features/Decoding  | Mark                            |
|-------|---------------------|-----------------|-------------|------------------------|---------------------------------|
| S2L   | Cortex-A9 CPU       | 5MP 30fps       | H.264       | WDR/Multi-exposure HDR | Offering S2Lm low-power version |
| S2E   | Cortex-A9 CPU @1GHz | 4K or 8MP 30fps | H.264       | WDR/Multi-exposure HDR | Mainstream                      |                                 
| S3L   | Cortex-A9 CPU @1GHz | 5MP 30fps       | H.264/H.265 | WDR/Multi-exposure HDR | S3Lm low-power version          |                                 
| S5L   | Cortex®-A53         | 4K 30fps        | H.264/H.265 | WDR/Multi-exposure HDR | Advanced                        |                                 

### Texas Instruments
| Application | Model                   | Core                 | Encoding    | Codec            | Video Acceleration | Mark    |
|-------------|-------------------------|----------------------|-------------|------------------|--------------------|---------|
| IP Camera   | DM369                   | ARM9 Max. 432MHz CPU | 1080P 30fps | H.264            | 1 MJCP, 1 HDVICP   | 100Mbps |
| DM368       | ARM9 Max. 432MHz CPU    | 1080P 30fps          | H.264       | 1 MJCP, 1 HDVICP | 100Mbps            |         |
| DM365       | ARM9 Max. 300MHz CPU    | 720P 30fps           | H.264       | 1 MJCP, 1 HDVICP | 100Mbps            |         |
| DM388       | Cortex-A8 Max. 1GHz CPU | 1080P 60fps          | H.264       | HDVICP2          | 1Gbps              |         |
| DM385       | Cortex-A8 Max. 1GHz CPU | 1080P 60fps          | H.264       | HDVICP2          | 1Gbps              |         |
