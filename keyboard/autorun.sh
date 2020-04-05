#!/bin/bash

#
# Remaps Capslock key as Ctrl
#
# @mindovermiles262
# 2020-04-05
#

printf "[*] Installing keyboard customizations... "
PWD="$(pwd)"
DIR="$(dirname $0)"

AUTOSTART_DIR="$HOME/.config/autostart"
if [[ ! -d "$AUTOSTART_DIR" ]]; then
  mkdir -p "$AUTOSTART_DIR"
fi

ln -sf "$PWD/$DIR/Keyboard.desktop" "$AUTOSTART_DIR"
echo "Done."
