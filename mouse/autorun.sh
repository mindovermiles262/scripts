#!/bin/bash

#
# Installs mouse customizations via xbind
#
# @mindovermiles262
# 2020-04-06
#

printf "[*] Installing mouse customizations... "
sudo apt-get -qq install -y xbindkeys xdotool &> /dev/null

PWD="$(pwd)"
DIR="$(dirname $0)"

# Copy xbindkeysrc to $HOME
XBRC="$HOME/.xbindkeysrc"
if [[ -f "$XBRC" ]]; then
  cp "$XBRC" "$XBRC.bak"
fi

ln -sf "$PWD/$DIR/xbindkeysrc" "$XBRC"

# Autostart xbindkeys
AUTOSTART_DIR="$HOME/.config/autostart"
if [[ ! -d "$AUTOSTART_DIR" ]]; then
  mkdir -p "$AUTOSTART_DIR"
fi

ln -sf "$PWD/$DIR/Xbindkeys.desktop" "$AUTOSTART_DIR"

echo "Done."
