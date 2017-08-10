#!/bin/sh

format=true

data=`blkid /dev/block/mmcblk0p1`
for x in $data;
    do
    case $x in
        TYPE=\"vfat\") format=false;
        break
    esac
done

if [ $format == true ]; then
    echo format userdata
    mkfs.vfat -F 32 /dev/block/mmcblk0p1;
    reboot;
fi

if [ -e "/storage/internal/boot.ini" ]
then
    break
else
    cp /system/etc/boot.ini.template /storage/internal/boot.ini;
    reboot;
fi
