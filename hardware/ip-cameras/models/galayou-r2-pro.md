Galayou R2 Pro
--------------
https://www.galayou-store.com/r2

- SoC: Ingenic T31ZC
- Flash: GD25Q128
- SDK: Zeratul
- WiFi: AltoBeam ATBM6041
- Toolchain: gcc version 4.7.2 (Ingenic r2.3.3 2016.12)
- Kernel: Linux-3.10.14-Archon

- FW Update: http://fw.ajcloud.net/$version/latest.bin

#### mtd parts

- 0x0000000-0x0040000: "boot"
- 0x0040000-0x0098000: "tag"
- 0x0098000-0x0398000: "kernel"
- 0x0398000-0x0898000: "rootfs"
- 0x0898000-0x0b18000: "recovery"
- 0x0b18000-0x0b98000: "common"
- 0x0b98000-0x0f80000: "system"
- 0x0f80000-0x1000000: "config"

#### /etc/shadow

```
root:$1$hivLaF3A$60nwpoKzh.RxXlMirMWC9.:10933:0:99999:7:::
```

### GPIO

- 50 - Red LED
