#!/bin/sh

format=true

data=`blkid /dev/block/mmcblk0p3`
for x in $data
    do
    case $x in
        TYPE=\"ext4\") format=false;;
    esac
done

if [ -f /cache/firstboot ]; then
        echo "format userdata partition"
        mk_e2fs -F -t ext4 /dev/block/mmcblk0p3
        rm -rf /cache/firstboot
        sync
        reboot
fi

if [ $format == true ]; then
    start=`fdisk -l /dev/block/mmcblk0 | grep mmcblk0p3 | awk '{print $2}'`
    finish=`fdisk -l /dev/block/mmcblk0 | grep sectors | awk '{print $5}'`
    fdisk /dev/block/mmcblk0 <<EOF
d
3
n
p
$start
$(($finish-1))
w
EOF
    touch /cache/firstboot
    sync
    reboot
fi
