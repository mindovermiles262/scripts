#!/bin/bash

if [ "$1" = "HP" ]; then
  echo "Setting Up HP Monitor..." 
  xrandr --output DP-1 --mode 1920x1080 --primary
  xrandr --output eDP-1 --off
elif [ "$1" = "LG" ]; then
  echo "Setting Up LG Monitor"
  xrandr --output DP-1-1 --mode 2560x1440 --primary
  xrandr --output eDP-1 --off
else
  echo "Usage: ./display_clamshell [MONITOR BRAND]"
fi
