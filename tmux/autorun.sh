#!/bin/bash

#
# Installs and configures tmux
#
# @mindovermiles262
# 2020-04-04
#

echo "[*] Installing tmux... "

if [ "$TARGETENV" = "macos" ]; then
  brew list | grep tmux &> /dev/null
  TMUXINSTALLED=$?
  if [ "$TMUXINSTALLED" -eq 0 ]; then
    echo "[*] Tmux is installed... Updating... "
    brew upgrade tmux reattach-to-user-namespace
  else
    echo "[*] Tmux not installed... Installing now... "
    brew install tmux reattach-to-user-namespace
  fi
elif [ "$TARGETENV" = "fedora" ]; then
  sudo dnf install -y tmux
else
  # System is Linux
  sudo apt-get -qq install -y tmux xclip &> /dev/null
fi

PWD="$(pwd)"
DIR="$(dirname $0)"

ln -sf "$PWD/$DIR/tmux.linux" "$HOME/.tmux.linux"
ln -sf "$PWD/$DIR/tmux.macos" "$HOME/.tmux.macos"
ln -sf "$PWD/$DIR/tmux.conf" "$HOME/.tmux.conf"
echo "Done."
