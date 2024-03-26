CH341A Programmer
-----------------

### Fixing higher than needed dataline voltage bug

Early versions, prior to version 1.7, of the cheap and popular CH341A mini
programmer have a nasty bug where the voltage levels on the data lines remain
at 5V even though the programmer is jumpered to 3.3V.

[@ddemos1963](https://github.com/ddemos1963) came up with an interesting hack 
to solve the problem in an efficient and artistic way.

![CH341A top view](../assets/images/hardware-ch341a-hack-1.webp)
![CH341A bottom view](../assets/images/hardware-ch341a-hack-2.webp)

Here's what you need to do.

![CH341A schematics](../assets/images/hardware-ch341a-hack-6.png)

Sever the connection between the 5V power line and the CH341A chip. Use a sharp
utility knife to cut the trace on the backside of the programmer board.

![CH341A severed trace](../assets/images/hardware-ch341a-hack-3.webp)

Connect the 3.3V output leg of the voltage regulator to pin 9 of the CH341A IC
by bridging it to a corresponding trace at the capacitor located nearby.

![CH341A bridged connection](../assets/images/hardware-ch341a-hack-4.webp)

Restore power to the chip by re-routing the 3.3V voltage from the 3v3 pin to 
pin 28 of the CH341A IC through the 5V pin connector on the header.

![CH341A voltage jumper](../assets/images/hardware-ch341a-hack-5.webp)

### Troubleshooting

To make the CH341A work on a Raspberry PI, you must add these to `/boot/cmdline.txt`:
```
dwc_otg.fiq_enable=0 dwc_otg.fiq_fsm_enable=0
```
