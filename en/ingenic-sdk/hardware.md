Ingenic T31: Hardware 
---------------------

### How to get information about the processor?
https://blog.csdn.net/code2481632/article/details/129338110

It can be obtained by calling the following API interface: `IMP_System_Init()`

```
---- FPGA board is ready ----
Board UID : 30AB6E51
Board HW ID : 72000460
Board rev.  : 5DE5A975
Board date  : 20190326
-----------------------------
```

Using this information, for example, if there is a problem, you can further
search based on this information... etc.

---

### How to identify the image sensor
https://blog.csdn.net/code2481632/article/details/129344612

When carrying out the secondary development of the SDK package, the image
sensor must first be used normally. What are the correct procedures?

analyze:
- The hardware must be normal
- The kernel layer driver must be correct
- The user layer finds the corresponding driver through the kernel interface
  and initializes it.

Key data structures:
- IMPSensorInfo sensor;

Guess what properties this structure must have?

- What type of bus interface is this sensor?
- What is its address
- What is its name

---
