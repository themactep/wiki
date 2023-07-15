# OpenIPC Wiki
[Table of Content](../README.md)

GPIO Debugging
--------------

### Legacy GPIO

Legacy GPIO utilizes `/sys/kernel/debug/gpio` interface.

```
mount -t debugfs debugfs /sys/kernel/debug
cat /sys/kernel/debug/gpio
```

### Modern GPIO (Kernel 4.18 and up)

In a modern Kernel use `gpioinfo` tool of `libgpio-tools`.
These tools use the newer character device interface for handling gpios.

Add this to Buildroot config:
```
BR2_PACKAGE_LIBGPIOD=y
BR2_PACKAGE_LIBGPIOD_TOOLS=y
```
then use `gpiodetect` for get information about GPIO pins.
