#!/bin/bash

#
# Installs and configures vim
#
# @mindovermiles262
# 2020-04-04
#

echo "[*] Installing vim for $TARGETENV... "

PWD="$(pwd)"
DIR="$(dirname $0)"

if [ "$TARGETENV" = "macos" ]; then
  brew list | grep vim &>/dev/null
  VIMINSTALLED=$?

  if [ "$VIMINSTALLED" -eq 0 ]; then
    echo "[*] Vim is installed... Updating... "
    brew upgrade macvim
  else
    echo "[*] Vim not installed... Installing now... "
    brew install macvim
  fi
elif [ "$TARGETENV" = "fedora" ]; then
  sudo dnf install neovim
elif [ "$TARGETENV" = "ubuntu" ] || [ "$TARGETENV" = "xubuntu" ]; then
  sudo apt-get -qq install -y vim curl &> /dev/null
fi

# Create symlink if .vim is not a symlink and directory
if ! [[ -L "$HOME/.vim" && -d "$HOME/.vim" ]]; then
  ln -s "$PWD/$DIR" "$HOME/.vim"
fi

echo "Done."
