#!/bin/bash

# 
# Installs and configures compton for sceen-tear free Xubuntu
#
# @mindovermiles262
# 2020-04-04
#
# Compton Config taken from
# https://www.reddit.com/r/xubuntu/comments/91zmmp/compton_on_xubuntu_1804/
# https://github.com/dastorm/Compton-xfce-config/blob/master/compton.conf
#

printf "[*] Installing Compton... "
PWD="$(pwd)"
DIR="$(dirname $0)"

sudo apt-get -qq install -y compton &> /dev/null

# Generate Compton.Desktop file
cp "$PWD/$DIR/Compton.template" "$PWD/$DIR/Compton.desktop"
echo "Exec=compton --config $HOME/.config/compton/compton.conf" >> "$PWD/$DIR/Compton.desktop"

# Copy compton.conf to ~/.config/compton/compton.conf
COMPTON_DIR="$HOME/.config/compton"
if [[ ! -d "$COMPTON_DIR" ]]; then
  mkdir -p "$COMPTON_DIR"
fi
ln -sf "$PWD/$DIR/compton.conf" "$COMPTON_DIR"

# Autostart Compton on login
AUTOSTART_DIR="$HOME/.config/autostart"
if [[ ! -d "$AUTOSTART_DIR" ]]; then
  mkdir -p "$AUTOSTART_DIR"
fi
ln -sf "$PWD/$DIR/Compton.desktop" "$AUTOSTART_DIR"
echo "Done."
