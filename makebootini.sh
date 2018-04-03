#!/bin/sh

if [ -e "/internal/boot.ini" ]; then
    echo "boot.ini exists"
else
    cp /system/etc/boot.ini.template /internal/boot.ini
fi
