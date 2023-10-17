# OpenIPC Wiki
[Table of Content](../README.md)

Hardware: Flash Memory Chip IDs
-------------------------------

### IC Marking

A typical flash memory chip marking includes code of its manufacture, type of
flash, capacity, operating voltage, working temperature range and other
information. Below is the list of the most common codes. 

Elnec has a convenient [searchable database](https://www.elnec.com/en/search/) 
on their website. But as always it is better to consult with a corresponding
data sheet from the manufacturer.

##### Manufacturer [ID]
 
- AT - [Atmel](https://www.microchip.com/) [1Fh]
- BY - [Boya](https://www.boyamicro.com/) [68h]
- DQ - [Douqi](http://www.douqitech.com/) [54h]
- EN - [Eon](https://www.esmt.com.tw/) [1Ch]
- F - [ESMT](https://www.esmt.com.tw/) [8Ch]
- F - [Fudan](https://www.fm-chips.com/) [A1h]
- FM - [Fidelix](https://www.fidelix.co.kr/) [F8h]
- FM - [Dosilicon](http://www.dosilicon.com/) [F8h]
- GD - [GigaDevice](https://www.gigadevice.com/) [C8h]
- IS - [ISSI](https://www.issi.com/) [9Dh]
- KH - [KHIC](https://www.macronix.com.hk/) [C2h]
- LE - [OnSemi](https://www.onsemi.com/) [62h]
- MD - [GigaDevice](https://www.gigadevice.com/) [C8h]
- MT - [Micron](https://www.micron.com/) [20h]
- MX - [Macronix](https://www.macronix.com) [C2h]
- N - [Numonyx](https://www.micron.com/) [20h]
- NM - [NOR-MEM](http://www.normem.com/)[52h]
- S - [Cypress](https://www.infineon.com/)
- S - [Spansion](https://www.infineon.com/) [01h]
- SST - [Microchip](https://www.microchip.com/) [00h]
- W - [Winbond](https://www.winbond.com/) [EFh]
- ZB - [Zbit](http://zbitsemi.com/) [5Eh]
- ZD - [Zetta](http://www.zettadevice.com/) [BAh]

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
