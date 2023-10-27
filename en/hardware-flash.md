# OpenIPC Wiki
[Table of Content](../README.md)

Hardware: Flash Memory Chip IDs
-------------------------------

### IC Marking

A typical flash memory chip marking includes code of its manufacture, type of
flash, capacity, operating voltage, working temperature range and other
information. Below is the list of the most common codes. 

Elnec has a convenient [searchable database](https://www.elnec.com/en/search/) 
on their website. But as always, it is better to consult with a corresponding
data sheet from the manufacturer.

##### Manufacturer [ID]

| Prefix | ID | Manufacturer                                                                  |
|--------|----|-------------------------------------------------------------------------------|
| T      | 1F | [Atmel](https://www.microchip.com/)                                           |
| BY     | 68 | [Boya](https://www.boyamicro.com/)                                            |
| DQ     | 54 | [Douqi](http://www.douqitech.com/)                                            |
| EN     | 1C | [Eon](https://www.esmt.com.tw/)                                               |
| F      | 8C | [ESMT](https://www.esmt.com.tw/)                                              |
| F      | A1 | [Fudan](https://www.fm-chips.com/)                                            |
| FM     | F8 | [Fidelix](https://www.fidelix.co.kr/), [Dosilicon](http://www.dosilicon.com/) |
| GD, MD | C8 | [GigaDevice](https://www.gigadevice.com/)                                     |
| GM     | 1C | [GallopMem](https://www.chuangfeixin.com/)                                                             |
| IS     | 9D | [ISSI](https://www.issi.com/)                                                 |
| KH     | C2 | [KHIC](https://www.macronix.com.hk/)                                          |
| LE     | 62 | [OnSemi](https://www.onsemi.com/)                                             |
| MT     | 20 | [Micron](https://www.micron.com/)                                             |
| MX     | C2 | [Macronix](https://www.macronix.com)                                          |
| N      | 20 | [Numonyx](https://www.micron.com/)                                            |
| NM     | 52 | [NOR-MEM](http://www.normem.com/)                                             |
| S      | 01 | [Cypress](https://www.infineon.com/), [Spansion](https://www.infineon.com/)   |
| SST    | 00 | [Microchip](https://www.microchip.com/)                                       |
| W      | EF | [Winbond](https://www.winbond.com/)                                           |
| ZB, HM | 5E | [Zbit Semi](http://zbitsemi.com/), [H&M Semi](https://www.hmsemi.com/)        |                                           
| ZD     | BA | [Zetta](http://www.zettadevice.com/)                                          |

##### Product Family

- 25 - Serial Flash

##### Series (Voltage/Mode)

- Voltage
  - Blank or L = 3.0V
  - V = 2.5V
  - U = 1.8V
- Mode
  - D = 4KB uniform sector, Dual mode
  - Q = 4KB uniform sector, Quad mode

##### Device Density & Version
- 512x = 512kbit
- 10xxx = 1Mbit
- 20xxx = 2Mbit
- 40xxx = 4Mbit
- 80xxx = 8Mbit
- 16xxx = 16Mbit
  - 1655x = 16Mbit with advanced security
- 32xxx = 32Mbit
  - 3255x = 32Mbit with advanced security
- 64xxx = 64Mbit
  - 6455x = 64Mbit with advanced security
- 128xxx = 128Mbit
  - 12855x = 128Mbit with advanced security
- 256xxx = 256Mbit
  - 25655 = 256Mbit Quad I/O standard type
- 512xxx = 512Mbit
- 1Gxx = 1Gbit

##### Temperature Range

- C = Commercial (0°C to 70°C)
- E = Extended (-20°C to +85°C)
- I = Industrial (-40°C to +85°C)

##### Green Code

- Blank = Normal
- P = Green Package (Lead-free)
- G = Green Package (Lead-free, RoHS Compliant, Halogen-free (TBBA), Antimony-Oxide-free Sb2O3)
- F = Green Package with Fast Sector Erase time (tSE)
- Q = Green Package with QE=1 in Status Register-2

Hence `W25Q64FVIG` means that it's a Quad mode `[Q]` 3V `[V]` 64Mbit `[64F]`
industrial grade `[I]` SPI NOR flash `[25]` chip manufactured by Winbond `[W]`
and containing no lead nor halogens `[G]`.
