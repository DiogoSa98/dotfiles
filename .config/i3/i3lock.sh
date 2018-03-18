#!/usr/bin/env bash

# Enable compton's fade-in effect so that the lockscreen gets a nice fade-in
# effect.
##dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
  ##  com.github.chjj.compton.opts_set string:no_fading_openclose boolean:false

# If disable unredir_if_possible is enabled in compton's config, we may need to
# disable that to avoid flickering. YMMV. To try that, uncomment the following
# two lines and the last two lines in this script.
# dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
#     com.github.chjj.compton.opts_set string:unredir_if_possible boolean:false

# Suspend dunst and lock, then resume dunst when unlocked.
pkill -u "$USER" -USR1 dunst

# Lock

letterEnteredColor=49b5b5ff
letterRemovedColor=c41a63ff
passwordCorrect=00000000
passwordIncorrect=c41a6388
background=00000000
foreground=ffffffff

TMPBG=/tmp/screen.png
LOCK=$HOME/Desktop/newRice/anonymous-vector/anonymous-vector.png
RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')
 
ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=5:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet

exec i3lock \
	-t -n -i $TMPBG \
	--timepos="x-0:h-2" --timesize=31 \
	--datepos="tx+24:ty+40" \
	--clock --datestr "Locked" --datesize=20 \
	--insidecolor=$background --ringcolor=$foreground --line-uses-inside \
	--keyhlcolor=$letterEnteredColor --bshlcolor=$letterRemovedColor --separatorcolor=$background \
	--insidevercolor=$passwordCorrect --insidewrongcolor=$passwordIncorrect \
	--ringvercolor=$foreground --ringwrongcolor=$foreground --indpos="x+679:h-382" \
	--radius=127 --ring-width=4 --veriftext="" --wrongtext="" \
	--textcolor="$foreground" --timecolor="$foreground" --datecolor="$foreground" \
	--force-clock --indicator 

#exec playerctl play-pause
rm $TMPBG

pkill -u "$USER" -USR2 dunst
