#!/bin/bash

#
# Keyboard.desktop remaps Capslock key as CTRL
# Copies and starts Xmodmap via .xinitrc
#
# @mindovermiles262
# 2020-04-05
#

printf "[*] Installing keyboard customizations... "
PWD="$(pwd)"
DIR="$(dirname $0)"

# Set Caps to CTRL
AUTOSTART_DIR="$HOME/.config/autostart"
if [[ ! -d "$AUTOSTART_DIR" ]]; then
  mkdir -p "$AUTOSTART_DIR"
fi
ln -sf "$PWD/$DIR/Keyboard.desktop" "$AUTOSTART_DIR"

# Install xmodmap to remap CTRL and ALT keys
# Sleep command needed so changes not overwritten by setxkbmap
# https://askubuntu.com/questions/54157/how-do-i-set-xmodmap-on-login
ln -sf "$PWD/$DIR/Xmodmap" "$HOME/.Xmodmap"
cp "$PWD/$DIR/xmodmap.template" "$PWD/$DIR/xmodmap.desktop"
echo "Exec=/bin/bash -c \"sleep 5; /usr/bin/xmodmap $HOME/.Xmodmap\"" >> "$PWD/$DIR/xmodmap.desktop"
ln -sf "$PWD/$DIR/xmodmap.desktop" "$AUTOSTART_DIR"

echo "Done."
