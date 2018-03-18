#!/bin/bash
BRIGHTNESS="$(xbacklight -get)"
BR="${BRIGHTNESS%%.*}"

bar=$(seq -s " " $(($BR / 8)) | sed 's/[0-9]//g')

notify-send.sh -u low -r 27 "$bar" -i ~/.config/dunst/Icons/sun.png
