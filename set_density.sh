#!/bin/sh

sleep 3
SIZE="Error type 2"

while true
do
	case $SIZE in
		Error*)
			echo "wm not ready"
			SIZE=`wm size`
			if [ "$SIZE" == "" ]; then
				SIZE="Error type 2"
			fi
			sleep 1
		;;
		Physical*)
			if [ "$SIZE" == "Physical size: 800x480" ]; then
				wm density 120
			else
				wm density 160
			fi
			break
	esac
done
