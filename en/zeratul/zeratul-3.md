Ingenic Zeratul Development
===========================

Upgrade and Rollback
--------------------

### Upgrade

There are two upgrade options: direct upgrade option and recovery upgrade.

The __direct upgrade__ is the same as for other embedded device upgrade methods,
which is to get the upgrade file from different places (OTA, USB disk, TF card,
etc.) and then burn the data to the specified flash partition address.

The __recovery upgrade__ is when the system boots up abnormally, or receives a
recovery command, the device enters into a recovery mode, which is a streamlined
system that generally only initializes peripherals related to the upgrade, and
generally only performs upgrade related operations.

### Direct upgrade

Several partition upgrade methods for the direct upgrade program are as follows:

__boot__: The boot partition is no longer accessible after the system boots, so
it can be directly erased and then written to.

_Note: If the bootloader is damaged, the device will not boot and can only be
repaired aftermarket (only TF card boot recovery or memory chip replacement)_
 
__tag__: tag partition is unmounted and can be written at any time, but note
that erasing and writing need to be mutually exclusive with the action of
modifying tag (e.g. updating system env parameter).

__uImage__: uImage is loaded during the bootloader phase, and the uImage storage
partition is not accessed after the uImage is up and running, so you can erase
and write the upgraded data at any time.

__rootfs__: Similar to uImage, rootfs can be erased and new data can be written
at any time.

__recovery__: The system does not mount the recovery partition during normal boot,
so the recovery partition can be erased and written to at any time.

__system__: Since the system partition holds the system's common resources, you
need to kill the program executing on the system, close the system's file handle,
and umount the system partition before burning it again.

__config__: The config partition is a read-write partition, so you can directly
modify the contents of the files or add or delete files.

### Recovery upgrade

The recovery system is a small, independent operating system that contains `uImage`
and `rootfs` in a single binary file. The recovery system can be accessed even if
the `rootfs` and `uImage` of a normal system are corrupted.

Executing the recovery command on the system will reboot and enter the recovery
system.

#### Upgrade procedure:

Download the upgraded firmware to an SD card, execute the recovery command,
the system will reboot and enter the recovery system for the upgrade.
After entering the recovery, a script will be executed to perform the upgrade
operation.

### Rollback

After the SPL of uboot starts, it will go to the tag partition to get the boot
parameters and boot files, and it will check whether the data of each partition
is normal or not. If the data is abnormal, then uboot SPL will boot the normal
boot of uboot, which is the second stage of boot, this stage is the boot compiled
by our user, and then he will boot the kernel and rootfs in recovery, so he will
enter the most simple recovery system.

If the user needs to customize the rollback upgrade, then directly update the
upgrade program placed in the file system can be done.

#### Description:

Because the SPL code of the first stage of Ingenic boot is not open, the rollback
of the device can only be done in this official way. If there is an SPL part of
the code, you can actually divide the flash into two zones, a normal boot zone
and a backup zone, and when one zone cannot boot normally, replace it with another
partition to boot from. The advantage of this is that it is safer, there is no
equipment will hang, the disadvantage is that the flash space will be doubled.

######################2022.08.28######################  
This blog will stop updating  
New article content and attachment project file  
Please go to liwen01 blog home page information query  
liwen01 updated on 2022.08.28  
######################2022.08.28######################
