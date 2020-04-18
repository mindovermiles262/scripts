#!/bin/bash

sleep 8
/usr/bin/xmodmap "$HOME/.Xmodmap"
echo "$(date) Start_Xmodmap" >> "$HOME/Desktop/xmodmap.txt"
