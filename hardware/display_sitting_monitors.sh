#!/bin/sh

EDP="eDP1"
DP="DP1"

# Set XPS screen as primary:
xrandr --output $EDP --mode 1920x1080

# Set HP Screen:
xrandr --output $DP --mode 1920x1080 --above $EDP --primary

