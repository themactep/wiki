Ingenic SoC CPU ID
------------------

| SoC   | 0x1300002C | 0x10000034 | 0x13540231 | 0x13540238 | 0x13540250 | Checked |
|-------|------------|------------|------------|------------|------------|---------|
| T10L  | 0x0005     | 0x0010     |            |            |            |         |
| T10L  | 0x0005     | 0x0001     | 0x0000     | 0x0000     | 0x0000     | X       |
| T20L  | 0x2000     | 0x0010     |            |            |            |         |
| T20N  | 0x2000     | 0x0001     |            |            |            |         |
| T20X  | 0x2000     | 0x0001     | 0x0000     | 0x2222     | 0x0000     | X       |
| T21L  | 0x0021     | 0x0001     |            | 0x3333     |            |         |
| T21L  | 0x0021     | 0x0010     |            |            |            |         |
| T21N  | 0x0021     | 0x0001     | 0x0000     | 0x1111     | 0x0000     | XX      |
| T21X  | 0x0021     | 0x0001     |            | *          |            |         |
| T21Z  | 0x0021     | 0x0001     |            | 0x5555     |            |         |
| T23 ? | 0x0023     |            |            |            |            |         |
| T30A  | 0x0030     | 0x0001     |            | 0x4444     |            |         |
| T30L  | 0x0030     | 0x0010     |            |            |            |         |
| T30AL?| 0x0030     | 0x0010     | 0x0000     | 0x3333     | 0x0000     | XX      |
| T30N  | 0x0030     | 0x0001     |            | 0x1111     |            |         |
| T30N  | 0x0030     | 0x0001     |            | 0x3333     |            |         |
| T30X  | 0x0030     | 0x0001     |            | *          |            |         |
| T30X  | 0x0030     | 0x0001     |            | 0x2222     |            |         |
| T30Z  | 0x0030     | 0x0001     |            | 0x5555     |            |         |
| T31A  | 0x0031     | 0x0001     |            | 0x4444     |            |         |
| T31AL | 0x0031     | 0x0001     | 0x0001     | 0xCCCC     | 0x0000     | X       |
| T31L  | 0x0031     | 0x0001     |            | 0x1111     |            |         | 
| T31L  | 0x0031     | 0x0001     |            | 0x2222     |            |         |
| T31L  | 0x0031     | 0x0001     |            | 0x3333     |            |         |
| T31L  | 0x0031     | 0x0001     | 0x0003     |            |            |         |
| T31L  | 0x0031     | 0x0001     | 0x0007     |            |            |         |
| T31L  | 0x0031     | 0x0010     | 0x0000     | 0x3333     | 0x0000     | X       |
| T31LC | 0x0031     | 0x0001     |            | 0xEEEE     |            |         |
| T31N  | 0x0031     | 0x0001     | 0x000F     |            |            |         |
| T31N  | 0x0031     | 0x0001     | 0x0000     | 0x1111     | 0x0000     | X       |
| T31ZC | 0x0031     | 0x0001     |            | 0xDDDD     |            |         |
| T31ZL | 0x0031     | 0x0001     |            | 0x5555     |            |         |
| T31X  | 0x0031     | 0x0001     | 0x0000     | 0x2222     | 0x0000     | X       |
| T31ZX | 0x0031     | 0x0000     | 0x0000     | 0x6666     | 0x0000     | XX      |
| T40A  | 0x0040     |            |            |            | 0x4444     |         |
| T40L  | 0x0040     |            |            |            | 0x1111     |         |
| T40NN | 0x0040     | 0x00ED     | 0x0000     | 0x0000     | 0x8888     | X        |
| T40XP | 0x0040     | 0x00f9     | 0x0000     | 0x0000     | 0x7777     | X       |
| T41L  | 0x0041     |            |            |            | 0x3333     |         |
| T41LC | 0x0041     |            |            |            | 0x8888     |         |
| T41LQ | 0x0041     |            |            |            | 0x9999     |         |
| T41N  | 0x0041     |            |            |            | 0x1111     |         |
| T41NQ | 0x0041     |            |            |            | 0xAAAA     |         |
| T41X  | 0x0041     |            |            |            | 0x6666     |         |
| T41ZL | 0x0041     |            |            |            | 0x5555     |         |
| T41ZN | 0x0041     |            |            |            | 0x7777     |         |

__columns:__
- soc
- cpu_id = (value >> 12) & 0xFFFF
- cppsr = value & 0xFF 
- subremark = (value >> 8) & 0xFF
- subsoctype1 = (value >> 16) & 0xFFFF
- subsoctype2 = (value >> 16) & 0xFFFF


Please use this script to check your SoC and confirm/correct information in the table above.  

``` bash
#!/bin/sh

cpuid=$(devmem 0x1300002C)
cppsr=$(devmem 0x10000034)
subrm=$(devmem 0x13540231)
type1=$(devmem 0x13540238)
type2=$(devmem 0x13540250)

echo "Raw values"
printf "0x%08x\t0x%08x\t0x%08x\t0x%08x\t0x%08x\n" "$cpuid" "$cppsr" "$subrm" "$type1" "$type2"
echo

cpuid=$(( (cpuid >> 12) & 0xFFFF ))
cppsr=$(( cppsr & 0xFF ))
subrm=$(( (subrm >> 8) & 0xFF ))
type1=$(( (type1 >> 16) & 0xFFFF ))
type2=$(( (type2 >> 16) & 0xFFFF ))

echo "Converted values"
printf "0x%04x\t0x%04x\t0x%04x\t0x%04x\t0x%04x\n" "$cpuid" "$cppsr" "$subrm" "$type1" "$type2"
```
