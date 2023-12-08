#!/bin/sh

switch_debug() {
  if [ "$1" = "on" ]; then
    action='+'
    report='enabled'
  else
    action='-'
    report='disabled'
  fi

  mount | grep -q 'debugfs' || mount -t debugfs none /sys/kernel/debug
  echo "${action}p" > /sys/kernel/debug/dynamic_debug/control
  echo "Dynamic debug for all files has been ${report}."
}
