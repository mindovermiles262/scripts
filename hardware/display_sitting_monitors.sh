#!/bin/sh

# Set XPS screen as primary:
xrandr --output eDP-1 --mode 1920x1080 --primary

# Set HP Screen:
xrandr --output DP-1 --mode 1920x1080 --above eDP-1 

