#!/bin/bash

#
# Installs and configures tmux
#
# @mindovermiles262
# 2020-04-04
#

printf "[*] Installing tmux... "
sudo apt-get -qq install -y tmux xclip &> /dev/null

PWD="$(pwd)"
DIR="$(dirname $0)"

ln -sf "$PWD/$DIR/tmux.linux" "$HOME/.tmux.linux"
ln -sf "$PWD/$DIR/tmux.conf" "$HOME/.tmux.conf"
echo "Done."
