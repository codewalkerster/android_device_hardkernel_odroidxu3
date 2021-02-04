#!/bin/sh

if [ ! -f "/internal/boot.ini" ]; then
    cp /system/etc/boot.ini.template /internal/boot.ini
fi

if [ ! -f "/internal/usb_modeswitch.conf" ]; then
    cp /system/etc/usb_modeswitch.conf.template /internal/usb_modeswitch.conf
fi

#Automatically change prop bt.vendor.name in build.prop
devs=$(lsusb | awk '{print $6}')
BROADMCOM=0
REALTEK=0
changeToBroadcom=0
changeToRealtek=0

bt_name=$(getprop bt.vendor.name)
echo $bt_name

for dev in $devs;
do
    if [ "$dev" = "0a12:0001" ]; then
        echo "found CSR B/T"
        BROADMCOM=1
    fi
    if [ "$dev" = "0bda:c820" ]; then
        echo "found Realtek Combo B/T"
        REALTEK=1
    fi
done

if [ "$bt_name" = "broadcom" ]; then
    if [ $BROADMCOM -eq 0 ] && [ $REALTEK -eq 1 ]; then
        echo "change to Realtek"
        changeToRealtek=1
    fi
fi

if [ "$bt_name" = "realtek" ]; then
    if [ $BROADMCOM -eq 1 ] && [ $REALTEK -eq 0 ]; then
        echo "change to Broadcom"
        changeToBroadcom=1
    fi
    if [ $BROADMCOM -eq 1 ] && [ $REALTEK -eq 1 ]; then
        echo "change to Broadcom"
        changeToBroadcom=1
    fi
fi

if [ $changeToRealtek -eq 1 ]; then
    mount -o rw,remount /system
    sed -i 's/bt.vendor.name=.*/bt.vendor.name=realtek/' /system/build.prop
    setprop bt.vendor.name realtek
fi

if [ $changeToBroadcom -eq 1 ]; then
    mount -o rw,remount /system
    sed -i 's/bt.vendor.name=.*/bt.vendor.name=broadcom/' /system/build.prop
    setprop bt.vendor.name broadcom
fi

if [ $changeToBroadcom -eq 1 ] || [ $changeToRealtek -eq 1 ]; then
    airplane=$(settings get global airplane_mode_on)
    #svc power reboot
    if [ $airplane -eq 0 ]; then
        settings put global airplane_mode_on 1
        am broadcast -a android.intent.action.AIRPLANE_MODE
        settings put global airplane_mode_on 0
        am broadcast -a android.intent.action.AIRPLANE_MODE
    fi
fi
