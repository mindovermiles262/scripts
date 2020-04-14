#!/bin/bash

#
# Installs mGBA and adds Desktop Icon
#
# @mindovermiles262
# 2020-04-13
#

echo "[*] Installing mGBA... "

# TODO: Download and extract mGBA
echo "[!] TODO: Download and extract mGBA"

PWD="$(pwd)"
DIR="$(dirname $0)"

# Install desktop shortcuts
sudo cp "$PWD/$DIR/mgba.png" /usr/share/icons
sudo cp "$PWD/$DIR/mGBA.desktop" /usr/share/applications
echo "Done."
