#!/bin/bash

codec=$1
url=$2

show_usage_and_exit() {
    echo "Usage: $0 <codec> <rtsp url>"
    echo "  e.g. $0 h265 rtsp://root:12345@192.168.1.10:554/stream=0"
    exit 1
}

[ -z "$codec" ] && show_usage_and_exit
[ -z "$url" ] && show_usage_and_exit

gst-launch-1.0 -ev rtspsrc location=$url \
    ! application/x-rtp, media=video, encoding-name=${codec^^} ! queue \
    ! rtp${codec}depay ! ${codec}parse ! matroskamux \
    ! filesink location=rtsp_${codec}_$(date +%s).mkv

exit 0

