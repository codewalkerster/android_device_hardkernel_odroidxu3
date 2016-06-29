#!/bin/sh

if [ -e "/storage/sdcard0/boot.ini" ]
then
    break
else
    cp /system/etc/boot.ini.template /storage/sdcard0/boot.ini
fi
