themactep wiki
==============

## Hardware

### SoC

[Anyka](hardware/components/soc/anyka.md),
[Faraday](hardware/components/soc/faraday.md),
[Goke](hardware/components/soc/goke/goke/soc.md),
[GrainMedia](hardware/components/soc/grainmedia.md),
[Ingenic](hardware/components/soc/ingenic/soc.md),
[Realtek](hardware/components/soc/realtek.md),
[Sigmastar/MStar](hardware/components/soc/sigmastar.md),
[Other manufacturers](hardware/components/soc/manufacturers.md)

### Sensors
[Brigates](hardware/components/sensor/brigates.md),
[BYD](hardware/components/sensor/byd.md),
[Galaxycore](hardware/components/sensor/galaxycore.md),
[OmniVision](hardware/components/sensor/omnivision.md),
[onsemi.md](hardware/components/sensor/onsemi.md),
[Pixart](hardware/components/sensor/pixart.md),
[SmartSens](hardware/components/sensor/smartsens.md),
[SOI](hardware/components/sensor/soi.md),
[Sony](hardware/components/sensor/sony.md)

[Identifying a sensor](hardware/components/sensor/detection.md)

## Hacking
- [Equipment for flashing](hacking/equipment-flashing.md)
- [CH341A programmer](hacking/programmer-ch341a-voltage-fix.md)

## OpenIPC

### Installation
- [About the project](openipc/menu-index.md)
- [Detailed installation guide](openipc/installation.md)
- [Old installation guides](openipc/old-installation.md)
- [Very old full manual](openipc/old-manual.md)

### Settings
- [Network settings](openipc/network-settings.md)
- [Wireless settings](openipc/wireless-settings.md)
- [Network perversions](openipc/network-perversions.md)
- [System features](openipc/system-features.md)
- [Majestic streamer](openipc/majestic-streamer.md)
- [Microbe web interface](openipc/microbe-web.md)
- [Upgrade firmware](openipc/sysupgrade.md)
- [Image quality tuning](openipc/image-quality-tuning.md)
- [Memory tuning](openipc/memory-tuning.md)
- [Using ipctool](openipc/example-ipctool.md)
- [Board specific GPIO settings list](openipc/gpio-settings.md)
- [ACMEv2](openipc/acme-v2.md)
- [Live Streaming to YouTube](openipc/youtube-streaming.md)
- [Live Streaming to Telegram](openipc/howto-streaming-telegram.md)
- [WiFi XM530](openipc/wifi-xm530.md)

### Troubleshooting
- [Bug reports](https://github.com/OpenIPC/firmware/issues)
- [Network does not work](openipc/trouble-network.md)
- [Majestic does not work, camera reboots](openipc/trouble-majestic.md)
- [Sigmastar unbrick instructions](openipc/sigmastar-unbrick.md)

### Development
- [Boot device with NFS](openipc/dev-nfs-boot.md)
- [FFMPEG usage](openipc/dev-ffmpeg-usage.md)
- [Kernel configuration for adding new platforms](openipc/integration-kernel.md)
- [List of supported sensors](openipc/firmware-sensors.md)
- [List of OpenIPC Buildroot packages](openipc/dev-buildroot-packages.md)
- [Source code](openipc/source-code.md)
- [Buildroot User Manual](https://buildroot.org/docs.html)
- [U-Boot Documentation](https://u-boot.readthedocs.io/)

### Help, Tips, and Tricks
- [U-Boot Tips](help-uboot.md)
- [Web UI Help](en/help-webui.md)
- [Interesting tricks](en/dev-tricks.md)
- [Questions and answers](faq.md)
- [Glossary](glossary.md)

### Hardware
- [SoC manufacturers](en/hardware-soc-manufacturers.md)
- [Image sensors manufacturers](en/hardware-sensor-manufacturers.md)
- [IPC boards manufacturers](en/hardware-board-manufacturers.md)

### Cameras
- [Chacon IPCAM-RI01](en/device-chacon-ipcam-ri01.md)
- [Smartwares CIP-37210](en/device-smartwares-cip-37210.md)
- [Xiaomi Mi Camera 2K (MJSXJ03HL)](https://github.com/OpenIPC/device-mjsxj03hl/)
- [Wyze V3](en/device-wyze-integration.md)
- [Digitus DN-16048 Optizoom](en/device-digitus-dn16048.md)

### Software
- [List of Software for Recording Video](software-video-recording.md)

### Subprojects
- [coupler](https://openipc.org/coupler)
- [firmware](https://openipc.org/firmware)
- [ipctool](https://openipc.org/ipctool)
- [telemetry](https://openipc.org/telemetry)
- [Firmware Partitions Calculation](https://themactep.com/tools/firmware-partitions-calculation)

### Our resources
- [OpenIPC](https://openipc.org/)
- [Releases in GitHub](https://github.com/OpenIPC/firmware/releases/tag/latest)
- [Releases in Telegram](https://t.me/s/openipc_dev)
- [OpenCollective](https://opencollective.com/openipc)
- [Twitter](https://twitter.com/OpenIPC)
- [Telegram](https://t.me/openipc)

### Reference Book
- [Company names](en/company-names.md)
- [Dahua Naming Rule](https://dahuawiki.com/Name_Rule)
- [Hikvision IP Camera Model Naming Convention](https://www.vueville.com/home-security/cctv/ip-cameras/hikvision-network-camera-guide/#model-naming-convention)

### Resources for recycling and integration
- <https://github.com/OpenIPC/camerasrnd>
- <https://openwrt.org/docs/techref/hardware/soc/soc.hisilicon.hi35xx>


#### In Russian

- [О проекте](openipc/ru/about.md)
- [Установка](openipc/ru/installation.md)
- [Настройка](openipc/ru/configuration.md)
- [Веб-интерфейс](openipc/ru/help-webui.md)
- [Настройка отправки в Telegram](openipc/ru/telegram_help_ru.md)
- [Модернизация адаптера USB2TT_004 для управления питанием](openipc/ru/usb2ttl.md)
- [Программный переход с openipc-1.0 (OpenWrt) на openipc-2.x (Buildroot)](openipc/ru/upgrade-from-1.md)
- [Вопросы и ответы](openipc/ru/faq.md)
- [Хочу помочь!](openipc/ru/contribute.md)
- [OpenIPC для FPV](openipc/ru/fpv.md)
- [Разработка платы расширения 38x38 для FPV систем](openipc/ru/fpv-extension.md)
- [Экшн-камера на базе OpenIPC](openipc/ru/action-camera.md)
- [Камера Switcam HS-303](openipc/ru/hardware-hs303.md)
- [Камера Hikvision DS-2CD2345F-IS](openipc/ru/hikvision-ds-2cd2345f-is.md)
- [Камера Ростелеком IPC-HFW1230SP/IPC-HDW1230SP](openipc/ru/rostelecom-ipc-hfw1230sp.md)
- [Камера Ростелеком с NAND](openipc/ru/hardware-rtk-nand.md)
- [Полезные ссылки](openipc/ru/resources.md)
- [Обзоры камер разных производителей](openipc/ru/reviews.md)

#### This is an open project, so you can help, too.

We try to collect, organize and share as much information regarding different
aspects of the project as we can. But sometimes we overlook things that seem
obvious to us, developers, but are not so obvious to end-users, people who are
less familiar with nuts and bolts behind the scene. That is why we set up this
wiki and let anyone having a GitHub account to make additions and improvements
to the knowledgebase. Read [How to contribute.](contribute.md)

[logo]: assets/images/logo_openipc.png
