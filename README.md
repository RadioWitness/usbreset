# usbreset
Simple utility for forcing the soft-reset of a USB device, sourced from [here](https://marc.info/?l=linux-usb&m=121459435621262&w=2).

## Build
```
$ docker build -t usbreset .
```

## General Usage
```
$ lsusb | grep "Realtek.*RTL"
Bus 002 Device 008: ID 0bda:2838 Realtek Semiconductor Corp. RTL2838 DVB-T
$ docker run \
    --device /dev/bus/usb/002/008:/dev/bus/usb/002/008 \
    --rm usbreset /dev/bus/usb/002/008
```

## TODO
This docker image inherits from `ubuntu` because I can't figure out how to get `linux/usbdevice_fs.h` into an Alpine Linux container.

## License
Copyright 2008 Alan Stern.
