Night Mode
----------

`/usr/sbin/color.sh [on|off]`

The script takes `on` and `off` arguments to switch between color and monochrome
modes.

`/usr/sbin/ircut.sh [on|off]`

The script takes `on` and `off` arguments to engage and disengage IRCUT filter.

`/usr/sbin/irled.sh [on|off]`

The script takes `on` and `off` arguments to power on and power off IR LEDs.

`/usr/sbin/daynight.sh <day|night|toggle>`

The script takes `day` and `night` arguments to set camera to day and night
mode, accordingly, and `toggle` to switch the existing mode to an opposite one.

Running the script without any arguments will make the camera to analyze the
sensor values to determine the luminance of the scene, and select an appropriate
mode according to the threshold and tolerance values.

Day mode sets color mode to full color, switches IR LEDs off, and sets the IRCUT
filter between the lens and the image sensor.

Night mode sets color mode to monochrome, switches IR LEDs on, and removes the
IRCUT filter in front of the image sensor.
