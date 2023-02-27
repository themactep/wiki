Ingenic SoC
-----------

### T31 Family

|             | T31L      | T31N      | T31X      | T31ZL     | T31ZX     | T31A      |
|-------------|-----------|-----------|-----------|-----------|-----------|-----------|
| SoC Freq.   | 1.0GHz    | 1.5GHz    | 1.5GHz    | 1.5GHz    | 1.5GHz    | 1.5GHz    |
| RAM Size    | 512Mbit   | 512Mbit   | 1Gbit     | 512Mbit   | 1Gbit     | 1Gbit     |
| RAM Type    | DDR2      | DDR2      | DDR2      | DDR2      | DDR2      | DDR3L     |
| RAM Voltage | 1.8V      | 1.8V      | 1.8V      | 1.5V      | 1.5V      | 1.35V     |
| SIMD128     |           | +         | +         | +         | +         | +         |
| Quick start |           | +         | +         | +         | +         | +         |
| DNN         |           | +         | +         | +         | +         | +         |
| DVP/MIPI    | DVP/MIPI  | DVP/MIPI  | DVP/MIPI  | DVP/MIPI  | DVP/MIPI  | DVP/MIPI  |
| Resolution  | 2592x2048 | 2592x2048 | 2592x2048 | 2592x2048 | 2592x2048 | 2592x2048 |
| Battery pwr |           |           |           | +         | +         | +         |
| 4 Mic Array |           |           |           |           |           | +         |
| I2S         |           |           |           |           |           | +         |
| Package     | QFN88     | QFN88     | QFN88     | QFN88     | QFN88     | BGA       |

### T40 & T41 Families

|             | T40N       | T40XP      | T40A       | T41L       | T41        | T41N       | T41ZL      | T41ZN      | T41A       |
|-------------|------------|------------|------------|------------|------------|------------|------------|------------|------------|
| SoC Freq.   | 1.0GHz     | 1.2GHz     | 1.5GHz     | 1.2-1.4GHz | 1.2-1.4GHz | 1.2-1.4GHz | 1.2-1.4GHz | 1.2-1.4GHz | 1.2-1.4GHz |
| RAM Size    | 1Gbit      | 2Gbit      | external   | 512Mbit    | 1Gbit      | 2Gbit      | 512Mbit    | 1Gbit      | external   |
| RAM Type    | 32bit      | 32bit      | 32bit      |            |            |            |            |            |            |
| RAM Voltage | 1.8V       | 1.8V       | 1.8V       |            |            |            |            |            |            |
| Quick start | +          | +          | +          |            |            |            | +          | +          | +          |
| DNN         | 2TOPS      | 4TOPS      | 8TOPS      | 1.2T@int8  | 1.2T@int8  | 1.2T@int8  | 1.2T@int8  | 1.2T@int8  | 1.2T@int8  |
|             |            |            |            | 4.8T@int4  | 4.8T@int4  | 4.8T@int4  | 4.8T@int4  | 4.8T@int4  | 4.8T@int4  |
| Resolution  | 4K         | 4K         | 4K         | 4K         | 4K         | 4K         | 4K         | 4K         | 4K         |
| Max Sensors | 8          | 3          | 3          |            |            |            |            |            |            |
| Battery pwr | +          | +          | +          |            |            | +          |            | +          | +          |
| Magick ISP  | +          | +          | +          | 2.0        | 2.0        | 2.0        | 2.0        | 2.0        | 2.0        |
| RTC         | +          | +          | +          | +          | +          | +          | +          | +          | +          |
| MAC PHY     |            |            |            | built-in   | built-in   | built-in   | external   | external   | external   |
| 4 Mic Array | +          | +          | +          |            |            |            |            |            |            |
| Echo cancel.| +          | +          | +          |            |            |            |            |            |            |
| Fast stream | +          | +          | +          |            |            |            |            |            |            |
| Package     | BGA        | BGA        | BGA        | BGA        | BGA        | BGA        | BGA        | BGA        | BGA        |

### Data Sheets

- [T10](../docs/T10_Smart_Video_Processor_Data_Sheet_20160614.pdf)
- [T21](../docs/T21_Smart_Video_Application_Processor_Data_Sheet_20180807.pdf)
- [T30](../docs/T30_Smart_Video_Application_Processor_Data_Sheet_20180416.pdf)
- [T31N](../docs/T31N_Smart_Video_Application_Processor_Data_Sheet_v1_4.pdf)
- [T31X](../docs/T31X_Smart_Video_Application_Processor_Data_Sheet_v1_4.pdf)
- [T31ZL](../docs/T31ZL_Smart_Video_Application_Processor_Data_Sheet_v1_4.pdf)
- [T31ZX](../docs/T31ZX_Smart_Video_Application_Processor_Data_Sheet_v1_4.pdf)
- [T40A](../docs/T40A_Smart_Video_Application_Processor_Data_Sheet_v1_0.pdf)
- [T40N](../docs/T40N_Smart_Video_Application_Processor_Data_Sheet_v1_0.pdf)
- [T40XP](../docs/T40XP_Smart_Video_Application_Processor_Data_Sheet_v1_0.pdf)

### Software

- [Linux port of Ingenic USB boot tools](https://github.com/gcwnow/ingenic-boot)

### Troubleshooting

Some boards with low voltage Ingenic SoC hang on boot if connected to an UART adapter before booting.
Either unplug the adapter from USB port or disconnect TX line on the adapter before booting.

### Zeratul

#### 君正Zeratul开发 (Ingenic Zeratul Development)
- [序言及目录](https://caibiao-lee.blog.csdn.net/article/details/115302346) Preface and Table of Contents
- [分区启动分析](https://caibiao-lee.blog.csdn.net/article/details/114748921) Partition Startup Analysis
- [uboot启动分析](https://caibiao-lee.blog.csdn.net/article/details/115245258) UBoot Boot Analysis
- [升级回滚](https://caibiao-lee.blog.csdn.net/article/details/115303900) Upgrade Rollback
- [图像效果调试](https://caibiao-lee.blog.csdn.net/article/details/115308705) Image Effect Debugging
- [快速启动优化](https://caibiao-lee.blog.csdn.net/article/details/115327992) Quick Startup Optimization
- [为什么禁止使用system](https://caibiao-lee.blog.csdn.net/article/details/114757327) Why the system is prohibited
