#!/bin/bash

#
# Installs and configures redshift
#
# @mindovermiles262
# 2020-04-04
#

printf "[*] Installing redshift... "
sudo apt-get -qq install -y redshift &>/dev/null

PWD="$(pwd)"
DIR="$(dirname $0)"

# Generate the .desktop startup file
cp "$PWD/$DIR/Redshift.template" "$PWD/$DIR/Redshift.desktop"
echo "Exec=/usr/bin/redshift -c $HOME/.config/redshift.conf" >> "$PWD/$DIR/Redshift.desktop"

ln -sf "$PWD/$DIR/redshift.conf" "$HOME/.config"
ln -sf "$PWD/$DIR/Redshift.desktop" "$HOME/.config/autostart"
echo "Done"
