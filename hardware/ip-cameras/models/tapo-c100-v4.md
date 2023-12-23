TP-Link Tapo C100 V4
--------------------

- SoC: Ingenic T31
- Sensor: SC2336 (1080p)
- Flash: 25Q64
- WiFi: Realtek RTL8188FTV
- IR LED: 850 nm
- Audio: 2-way

### U-Boot
```
bootargs=console=ttyS1,115200n8 mem=45M@0x0 rmem=19M@0x2d00000 root=/dev/mtdblock6 rootfstype=squashfs spdev=/dev/mtdblock7 noinitrd init=/etc/preinit
bootcmd=sf probe;sf read 0x80700000 0x80200 0x175000; bootm 0x80700000
bootdelay=1
baudrate=115200
loads_echo=1
ethaddr=00:d0:d0:00:95:27
ipaddr=193.169.4.81
serverip=193.169.4.2
gatewayip=193.169.4.1
netmask=255.255.255.0
```

### GPIO
```
[gpio_cfg]
CONFIG_RESET_GPIO=62
CONFIG_LED_GREEN_GPIO=42
CONFIG_LED_RED_GPIO=43
CONFIG_LED_GREEN_GPIO_ACTIVE_LOW=0
CONFIG_LED_RED_GPIO_ACTIVE_LOW=0
CONFIG_AUDIO_SPEAKER_ENABLE_GPIO=63
CONFIG_WIFI_ENABLE_GPIO=51
CONFIG_WIFI_ENABLE_GPIO_ACTIVE_LEVEL=1
```

### Sensor
- reset_gpio=16
- isp_clk=125000000

### Audio
- spk_gpio=-1
