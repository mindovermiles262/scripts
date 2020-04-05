#!/bin/sh

EDP="eDP1"
DP="DP1-1"

# Set XPS screen as primary:
xrandr --output $EDP --mode 1920x1080

# Set LG Screen:
xrandr --output $DP --mode 2560x1440 --right-of $EDP --primary

