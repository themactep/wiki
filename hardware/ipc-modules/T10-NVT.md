T10 NVT
-------

- Manufacturer:
- Board:
- SoC: Ingenic T10L
- Sensor: Silicon Optronics JXH42
- Wireless: MT7601u

#### GPIO

```
root@openipc-t10:~# mount -t debugfs debugfs /sys/kernel/debug
root@openipc-t10:~# cat /sys/kernel/debug/gpio
GPIOs 0-31, GPIO A:
gpio-12  (sda                 ) in  hi
gpio-13  (scl                 ) in  hi
gpio-18  (jxh42_reset         ) out hi
gpio-25  (sysfs               ) out lo
gpio-26  (sysfs               ) out lo

GPIOs 32-63, GPIO B:
gpio-57  (sda                 ) in  hi
gpio-58  (scl                 ) in  hi
gpio-59  (mmc_detect          ) in  hi
gpio-63  (gpio_spk_en         ) in  lo

GPIOs 64-95, GPIO C:
gpio-64  (home key            ) in  hi
gpio-80  (sysfs               ) out hi
gpio-81  (sysfs               ) in  lo

GPIOs 96-127, GPIO D:

GPIOs 128-159, GPIO E:

GPIOs 160-191, GPIO F:
```
