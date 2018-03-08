#!/bin/sh

mount -o rw,remount /system
if [ "$1" == "90" ] 
then
    sed -i s/persist.demo.hdmirotation=landscape/persist.demo.hdmirotation=portrait/g /system/build.prop
    sed -i s/ro.sf.hwrotation=0/ro.sf.hwrotation=90/g /system/build.prop
    sed -i s/ro.sf.hwrotation=180/ro.sf.hwrotation=90/g /system/build.prop
    sed -i s/ro.sf.hwrotation=270/ro.sf.hwrotation=90/g /system/build.prop
elif [ "$1" == "270" ]
then
    sed -i s/persist.demo.hdmirotation=landscape/persist.demo.hdmirotation=portrait/g /system/build.prop
    sed -i s/ro.sf.hwrotation=0/ro.sf.hwrotation=270/g /system/build.prop
    sed -i s/ro.sf.hwrotation=90/ro.sf.hwrotation=270/g /system/build.prop
    sed -i s/ro.sf.hwrotation=180/ro.sf.hwrotation=270/g /system/build.prop
elif [ "$1" == "0" ]
then
    sed -i s/persist.demo.hdmirotation=portrait/persist.demo.hdmirotation=landscape/g /system/build.prop
    sed -i s/ro.sf.hwrotation=90/ro.sf.hwrotation=0/g /system/build.prop
    sed -i s/ro.sf.hwrotation=180/ro.sf.hwrotation=0/g /system/build.prop
    sed -i s/ro.sf.hwrotation=270/ro.sf.hwrotation=0/g /system/build.prop
elif [ "$1" == "180" ]
then
    sed -i s/persist.demo.hdmirotation=portrait/persist.demo.hdmirotation=landscape/g /system/build.prop
    sed -i s/ro.sf.hwrotation=0/ro.sf.hwrotation=180/g /system/build.prop
    sed -i s/ro.sf.hwrotation=90/ro.sf.hwrotation=180/g /system/build.prop
    sed -i s/ro.sf.hwrotation=270/ro.sf.hwrotation=270/g /system/build.prop
fi
mount -o ro,remount /system
