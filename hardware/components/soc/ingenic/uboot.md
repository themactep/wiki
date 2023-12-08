```
sdupdate - auto upgrade file from mmc to flash

Usage:
sdupdate LOAD_ID ADDR_START ADDR_END
LOAD_ID: 0-->u-boot
         1-->kernel
         2-->rootfs
         3-->demo.bin
ex:
        sdupdate   (update all)
or 
        sdupdate 0 0x0 0x40000
```
