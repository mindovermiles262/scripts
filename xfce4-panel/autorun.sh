#!/bin/bash

#
# Copes xml file for custom top bar in Xubuntu
#
# @mindovermiles262
# 2020-04-04
#

printf "[*] Installing XFCE4 Panels..."
PWD="$(pwd)"
DIR="$(dirname $0)"

XFCE4_PANEL_PATH="$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/"
XFCE4_PANEL_FILE="xfce4-panel.xml"
PANEL_FULL_PATH="$XFCE4_PANEL_PATH$XFCE4_PANEL_FILE"

ln -sf "$PWD/$DIR/xfce4-panel.xml" "$PANEL_FULL_PATH"
echo "Done."
