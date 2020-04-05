#!/bin/bash

#
# Installs and configures trackpad using libinput
#
# @mindovermiles262
# 2020-04-04
#

printf "[*] Installing libinput trackpad... "

PWD="$(pwd)"
DIR="$(dirname $0)"

sudo apt-get -qq install -y xserver-xorg-input-libinput &> /dev/null

# Backup Synaptics config file
if [ -f /usr/share/X11/xorg.conf.d/70-synaptics.conf ]; then
  sudo mv /usr/share/X11/xorg.conf.d/70-synaptics.conf /usr/share/X11/xorg.conf.d/70-synaptics.conf.bak
fi

# Copy libinput config file
sudo cp "$PWD/$DIR/libinput.conf" /usr/share/X11/xorg.conf.d/40-libinput.conf

TOUCHPAD_NAME="ETPS/2 Elantech Touchpad"
# xinput set-prop "$TOUCHPAD_NAME" 'libinput Tapping Enabled' 1
# xinput set-prop "$TOUCHPAD_NAME" 'libinput Natural Scrolling Enabled' 1
# xinput set-prop "$TOUCHPAD_NAME" 'libinput Accel Speed' 0.25
echo "Done."
