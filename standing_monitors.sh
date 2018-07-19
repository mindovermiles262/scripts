#!/bin/sh

# Set XPS screen as primary:
xrandr --output eDP1 --mode 1920x1080 --primary

# Set LG Screen:
xrandr --output DP1-1 --mode 2560x1440 --left-of eDP1

