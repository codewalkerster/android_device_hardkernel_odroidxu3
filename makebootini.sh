#!/bin/sh

if [ -e "/storage/internal/boot.ini" ]; then
    echo "boot.ini exists"
else
    cp /system/etc/boot.ini.template /storage/internal/boot.ini
fi
