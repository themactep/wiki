Determining sensor
------------------

### Kosher way

Most IPC boards have silk-printed marking denoting the SoC chip and image sensor used on that board.
In many cases, these markings correspond to the installed hardware. So google for a full datasheet
on your image sensor and find i2c address, registers and default values for sensor ID, then use 
`i2c` tool to confirm these values.

Here is a popular Wyze W3 camera with presumably a GC2053 image sensor.

### Validating sensor model with i2c

Let's check how many i2c buses we have on the camera.

```
root@openipc-t31:~# i2cdetect -l
i2c-0   i2c             i2c0                                    I2C adapter
```

Here, we have just one bus. Let's scan for devices on the bus.

```
root@openipc-t31:~# i2cdetect -yr 0
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- UU -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --
```

There is a device on the address `0x37`.
Since it is the only device here, we can assume it is the image sensor.

Let's read its `DEV_ID` registers:

```
root@openipc-t31:~# i2cget -yf 0 0x37 0xf0
0x20
root@openipc-t31:~# i2cget -yf 0 0x37 0xf1
0x53
```

These values match with the ones provided in the Galaxycore GC2053 image sensor data sheet.

```
# cat /sys/bus/i2c/devices/0-0037/name
gc2053
```

### Validating sensor model with ipctool

```
root@openipc-t31:~# ipctool i2cdetect
The ipctool installed as remote GitHub plugin
       0  1  2  3  4  5  6  7   8  9  a  b  c  d  e  f
    : xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  10: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  20: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  30: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  40: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  50: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  60: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx 6e 6f  |  
  70: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  80: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  90: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  a0: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  b0: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  c0: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  d0: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  e0: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  f0: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx 
```

Here, `0x6e` is the i2c write address while `0x6f` is an i2c read address.
Reading values of `DEV_ID` registers via `0x6e`, we can confirm our sensor model.

```
root@openipc-t31:~# ipctool i2cdump 0x6e 0xf0 0xf2
       0  1  2  3  4  5  6  7   8  9  A  B  C  D  E  F
  f0: 20 53 
```

### Validating sensor model with sinfo

```
root@openipc-t31:~# echo 1 > /proc/jz/sinfo/info
root@openipc-t31:~# cat /proc/jz/sinfo/info
sensor :gc2053
```

#### Real-life example

Here's the board. Note the markings highlighted with yellow.

![](../images/board-50hv10pvs-back.webp)

The board is made for a sensor coded as _0732_, and the module model is _50HV10PV-S_
as stated on the QR code label. Quick googling for that model brings us to
[this page](https://www.xiongmaitech.com/en/index.php/product/product-detail/3/97/218)
which says that these modules are equipped with OV9732 image sensors. Hence, the 732!

Google for _"OV9732 data sheet"_ and find the full version of it, not a brief one. 
Most likely, you will find it on a Chinese resource like [this one](https://download.csdn.net/download/damifeng/10179794) 
so ask your Chinese friends to help you to get one.

These are the sensor ID values from the OV9732 image sensor data sheet:

![](../images/sensor-datasheet-ov9732.webp)
