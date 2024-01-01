#!/bin/sh
userresources=$HOME/.Xresources

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
# xrandr --output eDP-2 --mode 3840x2160 --rate 60 --scale 2
# export GDK_SCALE=2
exec i3
