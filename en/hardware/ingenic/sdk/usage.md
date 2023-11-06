Ingenic SDK Usage
-----------------

### Install prerequisites

```
sudo apt-get install mtd-utils p7zip u-boot-tools
```

### Install Ingenic SDK

Download the SDK bundle, extract it to a directory on your computer.

Patch scripts to call `mkfs.jffs2` via `sudo`
```
sed -i 's/mkfs/sudo mkfs/' ./t31_image_mk.sh 
```

Run compilation
```
source ./t31_env_setup.sh`
```

### Troubleshooting

```
.../Ingenic-SDK-T31-1.1.5-20220514/opensource/uboot/lib/sha1.c:64:19: error: unknown type name ‘sha1_context’
64 | void sha1_starts (sha1_context * ctx)
|                   ^~~~~~~~~~~~
```
If your compilation fails with the error message about `sha1_context`, you need to make sure there
isn't another version of `sha1.h` in `/usr/include/sha1.h`. If there is, then first determine what
package it belongs to
```
$ dpkg -S /usr/include/sha1.h
libmd-dev:amd64: /usr/include/sha1.h
```
after that, uninstall that package
```
sudo apt remove libmd-dev
[sudo] password for user: 
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages will be REMOVED:
  libbsd-dev libmd-dev
0 upgraded, 0 newly installed, 2 to remove and 0 not upgraded.
After this operation, 974 kB disk space will be freed.
Do you want to continue? [Y/n] 
(Reading database ... 370699 files and directories currently installed.)
Removing libbsd-dev:amd64 (0.11.7-4) ...
Removing libmd-dev:amd64 (1.1.0-1) ...
Processing triggers for man-db (2.11.2-2) ...
```
and restart the script
```
./t31_env_setup.sh
```

- [Issue](https://github.com/openwrt/openwrt/pull/4541#issuecomment-917620262)
- [Patch](https://github.com/openwrt/openwrt/pull/4626)
