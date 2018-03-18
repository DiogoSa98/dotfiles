#!/bin/bash

if [[ $(pgrep spotify) ]]
then
	status="$(playerctl status)"
	if [[ "$status" = *Playing* ]]
	then
		echo -e "%{F#dd49b5b5}"
	elif [[ "$status" = *Paused* ]]
	then
		echo -e "%{F#dd49b5b5}"
	fi
else
	echo -e "%{F#dd49b5b5}"
fi
