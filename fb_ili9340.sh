#!/bin/sh

insmod /system/lib/modules/spidev.ko
insmod /system/lib/modules/spi-s3c64xx.ko force32b=1
insmod /system/lib/modules/fbtft_device.ko name=hktft9340 busnum=1 rotate=270
insmod /system/lib/modules/fb_ili9340.ko
