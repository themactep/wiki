CH341A Programmer
-----------------

### Hardware

There are several versions of the popular, inexpensive, and versatile 24/25 series EEPROM programmer.

![](/assets/images/hardware-ch341a-v1.4-black.webp)
![](/assets/images/hardware-ch341a-v1.5.webp)
![](/assets/images/hardware-ch341a-v1.6.webp)
![](/assets/images/hardware-ch341a-v1.7.webp)

Older model, the black one with the gold edge (rarely green with a silver edge), is the cheapest.
But it has a nasty hardware quirk which [must be fixed](ch341a-voltage-fix.md) before you can use
the programmer with any 3.3V flash chip.

![](/assets/images/hardware-ch341a-v1.4-black.webp)
![](/assets/images/hardware-ch341a-v1.4-green.webp)


### Software

I prefer [this fork of SNANDer](https://github.com/Droid-MAX/SNANDer), but there is also

- Original [SNANDer](https://github.com/McMCCRU/SNANDer)
- [microsnander](https://github.com/OpenIPC/microsnander) from OpenIPC
- [ch341prog](https://github.com/setarcos/ch341prog/)
- [flashrom](https://www.flashrom.org/Flashrom)

### Working with a clip

The programming clip allows you to read and write the contents of the flash memory chip without having to desolder
the chip.

Connect the clip to the CH341A programmer using a DIP8 adapter and gently pinch the chip with the clip jaws.
In your computer, run `snander -i` and confirm the chip is detected.

#### Reading the firmware
Use `snander -r <filename>` to save a copy of the flash chip content to a file.

Repeat the procedure of reading twice back to back using different filenames. Then compare checksums of these files.
```
md5sum <filename1> <filename2>
```
If the checksums match, the firmware is saved correctly. If they don't, check your setup and repeat the process 
until you get two identical files.

#### Writing the firmware
Use `snander -e && snander -w <filename> -v` to erase the flash chip clean and write a new firmware to it with
verification of the result.

### Troubleshooting

To make the CH341A work on a Raspberry PI, you must add these to `/boot/cmdline.txt`:
```
dwc_otg.fiq_enable=0 dwc_otg.fiq_fsm_enable=0
```

### Resources

- [DIY BCQ CH341A forum](http://www.diybcq.com/thread-144131-1-1.html) (Chinese, use Chrome automatic translation)
- [CH341A Programmer](https://4pda.to/forum/index.php?showtopic=884713) (Russian, use Chrome automatic translation)
