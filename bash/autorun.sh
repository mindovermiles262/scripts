#!/bin/bash

#
# Symlinks bash_profile to $HOME/.bash_profile
#
# @mindovermiles262
# 2020-04-04
#

printf "[*] Installing bash_profile... "
PWD="$(pwd)"
DIR="$(dirname $0)"

ln -sf "$PWD/$DIR/bash_profile" "$HOME/.bash_profile"
echo "Done."
