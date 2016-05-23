#!/bin/sh

sleep 5

while true
do
    if [ -e "/storage/sdcard0/boot.ini" ]
    then
        break
    else
        cp /system/etc/boot.ini.template /storage/sdcard0/boot.ini
    fi
    sleep 1
done
