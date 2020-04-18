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

ln -sf "$PWD/$DIR/Xmodmap" "$HOME/.Xmodmap"
ln -sf "$PWD/$DIR/start_xmodmap_on_login.sh" "$HOME/.start_xmodmap_on_login"

if ! grep -q ".start_xmodmap_on_login" "$HOME/.profile";
then
  cat << EOF >> "$HOME/.profile"
if [ -f "$HOME/.Xmodmap" ]; then
  "$HOME/.start_xmodmap_on_login" &
fi
EOF
fi

echo "Done."
