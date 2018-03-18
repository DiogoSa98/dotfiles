#!/bin/bash

function get_volume {
	awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master) | cut -d '%' -f 1
}

function is_mute {
	awk '/muted/ {print $2}' <(pacmd list-sinks)
}

mute="`is_mute`"
volume=`get_volume`
bar=$(seq -s " " $(($volume / 8)) | sed 's/[0-9]//g')

if [ "$mute" == "yes" ]; then
	notify-send.sh -r 27 " " -i ~/.config/dunst/Icons/speakerMute.png
else
	if (( volume < 25 )); then
		notify-send.sh -u low -r 27 "$bar" -i ~/.config/dunst/Icons/speaker0.png
	elif (( volume >= 25 )) && (( volume < 50 )); then
		notify-send.sh -u low -r 27 "$bar" -i ~/.config/dunst/Icons/speaker1.png
	elif (( volume >= 50 )) && (( volume < 75 )); then
		notify-send.sh -u low -r 27 "$bar" -i ~/.config/dunst/Icons/speaker2.png
	else
		notify-send.sh -u low -r 27 "$bar" -i ~/.config/dunst/Icons/speaker3.png
	fi
fi

paplay ~/.config/dunst/beep.wav
