Ingenic A1 Smart NVR v1.1
-------------------------
https://www.aliexpress.com/item/1005005445434790.html

> Real-time Effect of Different Chip Solution through the test serial Number:
> s/n: b51f6d3fb2d0c556spf9, username: user, password: li123456.

- SoC: Ingenic A1
  - 1.4GHz dual-core CPU
  - 4K@90fps
  - 1.4T@int8, 5.6T@int4
- OS: Embedded Linux
- Video
  - Input: 16 x 4K video channels
  - Compression: H.264, H.264+, Smart-H.265
  - Display quality: Max. 4K
  - Playback quality: 4K, 5M, 4M, 3M, 1080p
  - Decode: 1 x 4K, 1 x 5M, 1 x 4M, 2 x 3M, 2 x 1080p
  - Output: 1 x VGA, 1 x HDMI HD
  - Playback: 4ch x 1080p, 1ch x 4K
- Audio
  - Compression: G.771A
  - Output: 3.5 mm jack
- Interfaces:
  - 1 x RJ45 10/100M Adaptive Ethernet
  - 2 x USB2.0 with 1 port extension
  - 1 x SATA HDD port, up to 16TB
  - Power jack 12V 2A DC
- Dimensions: 118 mm x 46 mm
- Firmware: http://antsvision.com/
- Mobile App: [SeeEasy](https://play.google.com/store/apps/details?id=com.antsvision.seeeasyf)
- Desktop App: IMS 4.0 Intelligent video management platform ([download](https://www.antsvision.com:9090/api/v1/downloadims))

![](a1-smart-nvr-1.jpg)

### Firmware

##### nmap -p 1-65535
```
PORT     STATE SERVICE
80/tcp   open  http
554/tcp  open  rtsp
1935/tcp open  rtmp
7681/tcp open  unknown
7682/tcp open  unknown
8081/tcp open  blackice-icecap
8082/tcp open  blackice-alerts
```

##### /etc/passwd
```
root:CYjoTKVIDJ0bg:0:0::/root:/bin/sh
```
##### /etc/passwd-
```
root:Sk.MffUl2mnm2:0:0::/root:/bin/sh
```
