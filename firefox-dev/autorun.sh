#!/bin/bash

#
# Installs Firefox Developer edition and installs desktop shortcut.
#
# @mindovermiles262
# 2020-04-06
#

echo "[*] Installing Firefox Developer Edition... "

# TODO: Download and extract firefox-dev
echo "[!] TODO: Download and extract firefox-dev"

PWD="$(pwd)"
DIR="$(dirname $0)"

# Install desktop shortcuts
sudo cp "$PWD/$DIR/firefox-dev.png" /usr/share/icons
sudo cp "$PWD/$DIR/firefox-dev.desktop" /usr/share/applications
echo "Done."
