SoC for IP CCTV System
----------------------

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
