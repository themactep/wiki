Shopper+ Smart Camera PTZ 360°
------------------------------

- Manufacturer:
- Vendor: Shopper+
- Model: [Cab-PC-08361](https://www.primecables.ca/p-397950-cab-pc-08361-smart-security-camera-ptz-360-2-way-audio-night-vision-motion-detection-cloud-storage-sd-card)
- SoC: Ingenic T21N
- Board: MTV7632_T21_F37 v1.2 2021-6-23
- Sensor: Smartsens SC307p (SC2300)
- Flash: [KH25L6433F](../docs/Macronix-KH25L6433F.pdf) [c2 20 17]
- WiFi: RTL8188FTV USB
- FCCID: 

```
root@openipc-t21:~# ./ipctool
---
chip:
vendor: Ingenic
model: T21N
board:
vendor: OpenIPC
version: 2.3.09.29
ethernet:
mac: "30:7b:c9:31:f1:a9"
rom:
- type: nor
  block: 32K
  partitions:
    - name: boot
      size: 0x40000
      sha1: 30ebd389
    - name: env
      size: 0x10000
      sha1: 8786fbb6
      contains:
        - name: uboot-env
          offset: 0x0
    - name: kernel
      size: 0x200000
      sha1: c0be244e
    - name: rootfs
      size: 0x500000
      path: /,squashfs
      sha1: 564004b0
    - name: rootfs_data
      size: 0xb0000
      path: /overlay,jffs2,rw
      size: 8M
      ram:
      total: 64M
      media: 24M
      firmware:
      kernel: "3.10.14__isvp_turkey_1.0__ (PREEMPT Fri Sep 29 19:23:48 EDT 2023)"
      toolchain: buildroot-gcc-13.2.0
      sensors:
- vendor: SmartSens
  model: SC307P
  control:
  bus: 0
  type: i2c
  addr: 0x60
```

#### /etc/hostname
```
Ingenic-uc1_1
```

#### /etc/shadow
```
root:$1$soidjfoi$9klIbmCLq2JjYwKfEA5rH1:10933:0:99999:7:::
```
