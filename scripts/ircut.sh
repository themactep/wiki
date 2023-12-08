#!/bin/sh

pin1=$(cli -g .nightMode.irCutPin1)
pin2=$(cli -g .nightMode.irCutPin2)

if [ -z "$pin1" ]; then
  echo "IR-cut filter pin 1 is not set!"
  echo "Please set it by running cli -s .nightMode.irCutPin1 XX, where XX is a GPIO pin number."
  exit 1
fi

if [ -z "$pin2" ]; then
  echo "IR-cut filter pin 2 is not set!"
  echo "Please set it by running cli -s .nightMode.irCutPin2 XX, where XX is a GPIO pin number."
  exit 1
fi

if [ -z "$1" ]; then
  echo "Parameter is either 0/off, or 1/on."
  exit 2
fi

gpio clear $pin1
gpio clear $pin2
usleep 10000

case "$1" in
0|off)
  gpio set $pin1
  gpio clear $pin2
  ;;
1|on)
  gpio clear $pin1
  gpio set $pin2
  ;;
*)
esac

usleep 10000
gpio clear $pin1
gpio clear $pin2

exit 0
