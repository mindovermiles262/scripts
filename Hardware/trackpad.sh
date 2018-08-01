#!/bin/bash

# Script automates settings for Trackpad sensitivity using
# xinput. Works with Dell XPS 13 9730 using libinput.
# Place script file in /bin/init.d/ folder to run on system startup

xinput set-prop 'DLL082A:01 06CB:76AF Touchpad' 'libinput Natural Scrolling Enabled' 1
xinput set-prop 'DLL082A:01 06CB:76AF Touchpad' 'libinput Accel Speed' 0.25
