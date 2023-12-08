Xiaomi MJSXJ03HL
----------------

#### GPIO

- 38 - Orange LED
- 39 - SkyBlue LED
- 49 - IRcut 1
- 50 - IRcut 2
- 60 - IR LED
- 64 - MMC detect?

##### ipctool
```
---
chip:
vendor: Ingenic
model: T31N
board:
vendor: OpenIPC
version: 2.3.10.12
rom:
- type: nor
  block: 32K
  partitions:
    - name: boot
      size: 0x40000
      sha1: c16e0c5b
    - name: env
      size: 0x10000
      sha1: b9d42ea0
      contains:
        - name: uboot-env
          offset: 0x0
    - name: kernel
      size: 0x200000
      sha1: 6507fadb
    - name: rootfs
      size: 0x500000
      path: /,squashfs
      sha1: dc49c2c9
    - name: rootfs_data
      size: 0x8b0000
      path: /overlay,jffs2,rw
      size: 16M
      ram:
      total: 64M
      media: 24M
      firmware:
      kernel: "3.10.14__isvp_swan_1.0__ (PREEMPT Thu Oct 12 11:07:46 UTC 2023)"
      toolchain: buildroot-gcc-12.2.0
      sensors:
- vendor: Silicon Optronics
  model: JXQ03P
  control:
  bus: 0
  type: i2c
  addr: 0x80
```

##### init_app.sh
```
#!/bin/sh

mkdir -p /tmp/modules/3.10.14__isvp_swan_1.0__

#insmod /system/driver/tx-isp-t31.ko isp_clk=150000000
insmod /system/driver/exfat.ko
insmod /system/driver/audio.ko spk_gpio=-1
insmod /system/driver/sinfo.ko
insmod /system/driver/speaker_ctl.ko
insmod /system/driver/sample_pwm_core.ko
insmod /system/driver/sample_pwm_hal.ko

MOTOR_FLAG=/system/driver/motor_flag

if [ -f "$MOTOR_FLAG" ];then
        insmod /system/driver/atbm603x_wifi_sdio_24M.ko
        insmod /system/driver/sample_motor.ko
else
        insmod /system/driver/rtl8189ftv.ko
fi

#insmod /system/driver/avpu.ko  avpu_clk=600000000
insmod /system/driver/avpu.ko  avpu_clk=500000000
insmod /system/driver/tx-isp-t31.ko   isp_ch0_pre_dequeue_time=14 isp_ch0_pre_dequeue_interrupt_process=0 isp_ch0_pre_dequeue_valid_lines=540 isp_memopt=1
#insmod /system/driver/tx-isp-t31.ko isp_memopt=1 isp_clk=150000000
#enable zram swap
echo 16777216 > /sys/block/zram0/disksize
mkswap /dev/zram0
swapon /dev/zram0
echo 100 > /proc/sys/vm/swappiness

#clear drive capability setting for PB04 (minimum drive capability)
#devmem 0x10011138 32 0x300
#Set drive capability for PB04 (4mA)
devmem 0x10011138 32 0xfff
devmem 0x10011134 32 0x100

#Set the 2mA drive capability of PA15.
devmem 0x10010138 32 0xc0000000
devmem 0x10010134 32 0x00000000

#4mA
#devmem 0x10010138 32 0xc0000000
#devmem 0x10010134 32 0x40000000

PB10 in #wifi mmc1 is in pull-down state by default, need to set it to high resistance state
devmem 0x10011128 32 0x400
#wifi mmc1 clk driver capacity changed to 8mA.
devmem 0x10011134 32 0x20000

touch /tmp/resolv.conf

################## Up wifi lo port at first ##################
#echo "ifconfig lo up"
ifconfig lo up > /dev/null

##################### Run app process (1) ####################
#telnetd
/system/bin/ver-comp > /dev/null

############## Select user mode or factroy mode ##############
FACTORY_TEST='/configs/.factory_flag'
DEBUG_STATUS='/configs/.debug_flag'

MOTOR_STATUS='/configs/.motor_flag'

#小米安全芯片
echo 10 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio10/direction


#EN LANGUAGE
#touch /configs/.EN

if [ ! -f $DEBUG_STATUS ]; then
        if [ ! -f $FACTORY_TEST ]; then
                #echo "#######################"
                #echo "#   IS USER PROCESS   #"
                #echo "#######################"
                #/usr/app/bin/assis > /dev/null &
                /system/init/factory.sh &
                /system/bin/factorycheck

        if [ -f /tmp/factory ]; then
                exit
        fi
        /system/bin/assis &
        #ulimit -c unlimited
        #mount /dev/mmcblk0p1 /mnt
        #echo "/mnt/core-%e-%p-%t" > /proc/sys/kernel/core_pattern
        #/mnt/iCamera_app &
        /system/bin/iCamera_app &
        #telnetd
        else
                echo "#######################"
                echo "#   IS TEST PROCESS   #"
                echo "#######################"
                /backk/singleBoadTest
                /backk/factoryTest &
        fi
else
        echo "#######################"
        echo "#   IS DEBUG STATUS   #"
        echo "#######################"
fi

#touch /configs/.motor_flag
#if [ -f $MOTOR_STATUS ]; then
        #/system/bin/motortest &
#fi

#rm /mnt/logcat.log
#rm /mnt/dmeg.log
#mount /dev/mmcblk0p1 /mnt
#logcat > /mnt/logcat.log &
#dmesg  > /mnt/dmeg.log &

#sync
```

## OpenIPC

```
root@openipc-t31:~# mount -t debugfs none /sys/kernel/debug
root@openipc-t31:~# cat /sys/kernel/debug/gpio
GPIOs 0-31, GPIO A:
 gpio-18  (jxq03p_reset        ) out hi

GPIOs 32-63, GPIO B:
 gpio-38  (sysfs               ) out hi
 gpio-39  (sysfs               ) out lo
 gpio-49  (?                   ) out lo
 gpio-50  (?                   ) out lo
 gpio-59  (mmc_detect          ) in  lo
 gpio-60  (?                   ) out lo
 gpio-62  (sdio_wifi_power_on  ) out hi
 gpio-63  (gpio_spk_en         ) in  lo

GPIOs 64-95, GPIO C:

root@openipc-t31:~# gpio clear 54
Setting GPIO-54 to LOW

root@openipc-t31:~# cat /sys/kernel/debug/gpio
GPIOs 0-31, GPIO A:
 gpio-18  (jxq03p_reset        ) out hi

GPIOs 32-63, GPIO B:
 gpio-38  (sysfs               ) out hi
 gpio-39  (sysfs               ) out lo
 gpio-49  (?                   ) out lo
 gpio-50  (?                   ) out lo
 gpio-54  (sysfs               ) out lo
 gpio-59  (mmc_detect          ) in  lo
 gpio-60  (?                   ) out lo
 gpio-62  (sdio_wifi_power_on  ) out hi
 gpio-63  (gpio_spk_en         ) in  lo

GPIOs 64-95, GPIO C:
```
