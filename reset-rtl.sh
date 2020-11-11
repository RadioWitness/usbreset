#!/bin/bash

device_count=`lsusb -d 0x0bda:2838 | wc -l`

if [ "$device_count" -eq "0" ]; then
   echo "no RTL devices found."
   exit 1
fi

device_ids=`lsusb -d 0x0bda:2838 | cut -c5-8,16-18`

while read -r device_id; do
    parts=($device_id)
    device="/dev/bus/usb/${parts[0]}/${parts[1]}"
    docker run \
       --device $device:$device \
       --rm usbreset $device
done <<< "$device_ids"
