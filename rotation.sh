#!/bin/sh

mount -o rw,remount /system
if [ "$1" == "portrait" ]; then # if portrait
    sed -i s/persist.demo.hdmirotation=landscape/persist.demo.hdmirotation=portrait/g /system/build.prop
    if [ "$2" == "90" ]; then # if degree == 90
        sed -i s/ro.sf.hwrotation=0/ro.sf.hwrotation=90/g /system/build.prop
        sed -i s/ro.sf.hwrotation=270/ro.sf.hwrotation=90/g /system/build.prop
    else # else degree == 270
        sed -i s/ro.sf.hwrotation=0/ro.sf.hwrotation=270/g /system/build.prop
        sed -i s/ro.sf.hwrotation=90/ro.sf.hwrotation=270/g /system/build.prop
    fi
elif [ "$1" == "landscape" ]; then # else landscape
    sed -i s/persist.demo.hdmirotation=portrait/persist.demo.hdmirotation=landscape/g /system/build.prop
    sed -i s/ro.sf.hwrotation=90/ro.sf.hwrotation=0/g /system/build.prop
    sed -i s/ro.sf.hwrotation=270/ro.sf.hwrotation=0/g /system/build.prop
fi
mount -o ro,remount /system
