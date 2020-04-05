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

# Symlink config file
if [[ ! -d "$HOME/.config" ]]; then
  mkdir -p "$HOME/.config"
fi
ln -sf "$PWD/$DIR/redshift.conf" "$HOME/.config"

# Autostart Redshift on login
AUTOSTART_DIR="$HOME/.config/autostart"
if [[ ! -d "$AUTOSTART_DIR" ]]; then
  mkdir -p "$AUTOSTART_DIR"
fi
ln -sf "$PWD/$DIR/Redshift.desktop" "$HOME/.config/autostart"
echo "Done"
