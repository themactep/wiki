Web UI
========

- Information
  - Overview
  - Cron Configuration
  - Diagnostic Messages
  - HTTPd Environment
  - Loaded Modules
  - Information from /proc/umap
  - Output of ipctool
  - Network Statistics
  - Top Processes
  - Output of logread
  - Overlay Partition
  - IMP Control
- Updates
  - Firmware
  - Web Interface
- Settings
  - Time
  - Illumination
  - SOCKS5 Proxy
  - Web Interface
  - Admin Profile
  - Users
  - Debugging
- Majestic
  - System
  - ISP
  - Image
  - OSD
  - Night Mode
  - Recording
  - Video0
  - Video1
  - JPEG
  - Audio
  - RTSP
  - HLS
  - Outgoing
  - Youtube
  - Alarm
  - IPEYE
  - NETIP
  - ONVIF
  - Watchdog
  - Cloud
  - Majestic Config
  - Majestic Endpoints
  - Majestic Maintenance
- Tools
  - Ping & Traceroute</a></li>
  - Web Console
  - File Manager
  - SSH Key
  - SD Card
- Services
  - 
- Preview
- Help
  - About OpenIPC
  - OpenIPC Wiki


## Time

### Time zone

__Zone name__

Select one of the standard time zones by its name.
Start typing the name of the nearest large city in the box until you see it 
among available variants, then pick it from the list. Alternatively, you can
pick up the actual time zone from your browser.

__Zone string__

This field is not editable by user. It shows the machine-readable representation
of the selected time zone.

### Time Synchronization

__NTP Server 1__, __NTP Server 2__, __NTP Server 3__, __NTP Server 4__

Internet addresses of NTP servers you want to synchronize your time with.
We provide our own NTP servers, but you can change these records to your liking.


## Illumination

__850 nm IR LED GPIO pin__

GPIO pin for switching an 850 nm IR LED array.
These diodes are visible by most people, so it is easy to say when they are on. 

__940 nm IR LED GPIO pin__

GPIO pin for switching a 940 nm IR LED array.
These diodes emit light in almost invisible spectrum.
You might need to use a phone camera to see them glowing.

You can have just one set of infrared diodes or both.

__White Light LED GPIO pin__

GPIO pin for switching a White Light LED array. (optional)

__Day/Night Trigger Level__

Where you draw a line for day and night modes. 
When in night mode, the camera disengages IR-cut filter allowing more rays in, 
at the same time it switches to black-and-white mode to avoid pink hue from 
infrared waves. In day mode, the camera switches to full color mode and covers
the image sensor with IR-cut filter.

__Day/Night Tolerance__

Threshold value to keep the camera in its recent mode if luminosity of the scene 
slightly changes. 

```
                        day/night trigger level
                  * <-------------^------------------ day mode ---
                  |<- tolerance -> <- tolerance ->|
 --- night mode --------------------------------> *
                  <--------- hysteresis ---------->
```

__IR CUT filter GPIO pin 1__

GPIO pin 1 to operate IR-cut filter opening/closing.

__IR CUT filter GPIO pin 2__

GPIO pin 2 to control IR-cut filter opening/closing driver (optional). 
Some modern cameras use only one pin to operate IR-cut filter opening/closing.


## SOCKS5 Proxy

__SOCKS5 Host__

IP address of your SOCKS5 proxy server.

__SOCKS5 Port 1080__

Port, on which your SOCKS5 proxy server operates.

__SOCKS5 Username__

Username for accessing your SOCKS5 proxy server.

__SOCKS5 Password__

Password for authentication on your SOCKS5 proxy server.


## Web Interface Settings

### Access

__Username__

Username for accessing to the camera Web IU.
Defaults to `root` and cannot be changed by user.

__Password__

Password for authentication in the Web UI. 
This is tied to the system account, so changing the password here will also
update the user's password on the system.

### Interface Details

__Level__

Selection between a simple user-friendly Web UI for everyday users and more busy
interface for advanced administrative tasks and development.

__Theme__

Selection between light and dark Web UI themes.


## Admin profile

__Administrator's full name__

This name will be used for sending emails from the camera.

__Administrator's email address__

This email address will be used for sending emails from the camera.

__Administrator's nick on Telegram__

Reserved to future use. Can be used with Telegram bot etc.

## Users

This page allows you to create a custom user accounts with access to provided
services but without access to the system. 

__Username__

Select an existing user or create a new username.

__Password__

User password for authentication at the services.

__Full name__

Full user's name or description of the account for your records.

__Home directory__

This type of user does not have a home.
Read-only field pre-set to `/dev/null`. 

__Shell__

This type of user does not have any shell.
Read-only field pre-set to `/dev/false`.

__Group__

Read-only field preset to `users`.


## Majestic debugging

> Please disable the watchdog or change its timeout value to 60 seconds or more.
> Shorter timeout may affect coredump saving.

### Core dump saving

__Enable core dump saving__

Switch saving core dump on and off. 

__Upload core dump to developers__

Upon saving a core dump, it is automatically uploaded to developers' web server.

### Save on camera

__Enable saving on camera__

Switch saving a local copy of the core dump.

> Not recommended unless you save to an SD card!

__Save to local directory__

Path to the directory for saving core dump files.

### Upload to TFTP server

__Enable uploading to TFTP server__

Switch saving a copy of the core dump to your local TFTP server.

__TFTP server host FQDN or IP address__

IP address of the TFTP server.

### Upload to FTP server

__Enable uploading to FTP server__

Switch saving a copy of the core dump to an FTP server.

__FTP server host FQDN or IP address__

IP address or domain name of the FTP server.

__Save to FTP directory relative to FTP root directory__

Path to the directory for saving core dump files.

__Username__

Username for accessing the FTP server.

__Password__

Password for authentication on the FTP server.
