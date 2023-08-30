PTZ (Pan-Tilt-Zoom)
-------------------

### PTZ Protocols
There is a multitude of PTZ controlling protocols: 
- AD ASCII, AD Sensormatic, AD Sensornet, AD Manchester, AD RS422/485
- Bosch LTC / Bosch G1, G2, G3, VEZ, VG4 / Bosch OSRD
- Axsys / Axsys DCU
- Canon VC-C50i / Canon VC-C4
- Ernitec ERNA
- Honeywell Diamond
- JVC JCBP
- Kalatel ASCII
- LG-MULTIX
- MERIT LILIN 2
- Panasonic V1 / Panasonic V2 / Panasonic KXC
- Pelco D / Pelco P
- Samsung
- Sony VISCA
- TEB Ligne
- Vicon / Vicon Extended
- Videotec Legacy / Videotec Macro
- YOKO Speed Dome

Although, most of the IP cameras can work with Pelco protocol, to some degree.
Some cameras only work with basic functions like Pan, Tilt and Zoom (UP, DOWN, LEFT, RIGHT, NEAR, FAR).

### Controlling PTZ from console  
```
stty -F /dev/ttyAMA1 2400

%STOP action
printf '\xFF\x01\x00\x00\x00\x00\x01\' > /dev/ttyAMA1

%Zoom in, STOP (1 tick)
printf '\xFF\x01\x00\x20\x00\x00\x21\xFF\x01\x00\x00\x00\x00\x01\' > /dev/ttyAMA1

%Zoom out, STOP (1 tick)
printf '\xFF\x01\x00\x40\x00\x00\x41\xFF\x01\x00\x00\x00\x00\x01\' > /dev/ttyAMA1

%Focus far, STOP (1 tick)
printf '\xFF\x01\x00\x80\x00\x00\x81\xFF\x01\x00\x00\x00\x00\x01\' > /dev/ttyAMA1

%Focus near, STOP (1 tick)
printf '\xFF\x01\x01\x00\x00\x00\x02\xFF\x01\x00\x00\x00\x00\x01\' > /dev/ttyAMA1
```
