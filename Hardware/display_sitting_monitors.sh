#!/bin/sh

# Set XPS screen as primary:
xrandr --output eDP1 --mode 1920x1080 

# Set HP Screen:
xrandr --output DP1 --mode 1920x1080 --above eDP1 --primary

