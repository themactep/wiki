Wyze Cam V3
-----------

- SoC: T31A
- Sensor: GC2053
- WiFi: ATBM6031 SDIO


#### ipctool
```
---
chip:
  vendor: Ingenic
  model: T31AL
board:
  vendor: OpenIPC
  version: 2.3.05.13
rom:
  - type: nor
    block: 32K
    partitions:
      - name: boot
        size: 0x40000
        sha1: 84e4f014
      - name: env
        size: 0x10000
        sha1: aba279b1
        contains:
          - name: uboot-env
            offset: 0x0
      - name: kernel
        size: 0x200000
        sha1: b86292fe
      - name: rootfs
        size: 0x500000
        path: /,squashfs
        sha1: 68d6bf78
      - name: rootfs_data
        size: 0x8b0000
        path: /overlay,jffs2,rw
    size: 16M
ram:
  total: 64M
  media: 64M
firmware:
  kernel: "3.10.14__isvp_swan_1.0__ (PREEMPT Sat May 13 20:03:40 UTC 2023)"
  toolchain: gcc version 8.4.0 (Buildroot -gff5aa3b6-dirty)
  main-app: /usr/bin/majestic
sensors:
- vendor: GalaxyCore
  model: GC2053
  control:
    bus: 0
    type: i2c
    addr: 0x6e
```

#### GPIO

- pin 38 - Red LED indicator
- pin 39 - Blue LED indicator
