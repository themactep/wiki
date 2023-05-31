Determining sensor
------------------

### Kosher way

Most IPC boards have silkprinted marking denoting the SoC chip and image sensor used on that board.
For many cases these markings correspond to the installed hardware. So google for a full datasheet
on your image sensor and find there addresses and values for sensor ID, then use `ipctool` to confirm
these values.

#### Real-life example

Here's the board. Note the markings highlighted with yellow.

![](../images/board-50hv10pvs-back.webp)

The board is made for a sensor coded as _0732_, and the module model is _50HV10PV-S_
as stated on the QR code label. Quick googling for that model brings us to
[this page](https://www.xiongmaitech.com/en/index.php/product/product-detail/3/97/218)
which says that these modules are equipped with OV9732 image sensors. Hence, the 732!

Google for _"OV9732 data sheet"_ and find the full version of it, not a brief one. 
Most likely you will find it on a Chinese resource like [this one](https://download.csdn.net/download/damifeng/10179794) 
so ask your Chinese friends to help you to get one.

These are the sensor ID values from the OV9732 image sensor data sheet:

![](../images/sensor-datasheet-ov9732.webp)

Checking these registers on the board we get the same values, so the sensor model is confirmed:
```
root@openipc-hi3518ev200:~# ipctool i2cdump 0x6c 0x300A 0x300C
       0  1  2  3  4  5  6  7   8  9  A  B  C  D  E  F
97 32

root@openipc-hi3518ev200:~# ipctool i2cdump 0x6c 0x302A 0x302B
       0  1  2  3  4  5  6  7   8  9  A  B  C  D  E  F
A0 
```

### Another way

```
# i2cdetect -l
i2c-0   i2c             i2c0                                    I2C adapter

# i2cdetect -y -r 0
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- UU -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --

# cat /sys/bus/i2c/devices/0-0037/name
gc2083
```

```
# ipctool i2cdetect
       0  1  2  3  4  5  6  7   8  9  a  b  c  d  e  f
    : xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  10: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  20: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  30: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  40: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  50: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
  60: xx xx xx xx xx xx xx xx  xx xx xx xx xx xx xx xx  |  
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

```
# i2cdetect -ry 0 3
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --
```

```
# echo open:jxf37 > /proc/jz/sinfo/info

# cat /proc/jz/sinfo/info
sensor :gc2083

# i2cdetect -ry 0 3
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- 37 -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --

# ipctool i2cdetect
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
