#!/bin/sh

start fb_ili9340

sleep 3

mplayer -vo fbdev2:/dev/graphics/fb1 -loop 0 -x 320 -y 240 -fs -zoom /sdcard/N64_logo.gif
