#!/bin/sh

# Set XPS screen as primary:
xrandr --output eDP-1 --mode 1920x1080

# Set LG Screen:
xrandr --output DP-1-1 --mode 2560x1440 --left-of eDP-1 --primary

