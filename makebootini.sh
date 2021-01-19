#!/bin/sh

if [ -e "/internal/boot.ini" ]; then
    echo "boot.ini exists"
else
    cp /system/etc/boot.ini.template /internal/boot.ini
fi

if [ -f "/internal/usb_modeswitch.con" ]
then
    break
else
    cp /system/etc/usb_modeswitch.conf.template /internal/usb_modeswitch.conf
fi
