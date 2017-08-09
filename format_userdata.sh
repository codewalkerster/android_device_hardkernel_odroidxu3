#!/bin/sh

format=true

data=`blkid /dev/block/mmcblk0p3`
for x in $data;
    do
    case $x in
        TYPE=\"ext4\") format=false;
        break
    esac
done

if [ $format == true ]; then
    echo format userdata
    mk_e2fs -F -t ext4 /dev/block/mmcblk0p3;
    reboot;
fi
