#!/bin/bash

#
# Installs and configures vim
#
# @mindovermiles262
# 2020-04-04
#

echo "[*] Installing vim... "

if [[ "$TARGETENV" -eq "macos" ]]; then
  brew list | grep vim &>/dev/null
  VIMINSTALLED=$?

  if [ "$VIMINSTALLED" -eq 0 ]; then
    echo "[*] Vim is installed... Updating... "
    brew upgrade vim
  else
    echo "[*] Vim not installed... Installing now... "
    brew install vim
  fi
else
  sudo apt-get -qq install -y vim curl &> /dev/null
fi

PWD="$(pwd)"
DIR="$(dirname $0)"

if [[ ! -d "$HOME/.vim" ]]; then
  mkdir "$HOME/.vim"
fi

ln -sf "$PWD/$DIR/vimrc" "$HOME/.vimrc"

# Install vim-plug
curl -sfLo "$HOME/.vim/autoload/plug.vim" \
  --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Silent PlugInstall: https://github.com/junegunn/vim-plug/issues/730
vim +'PlugInstall --sync' +qall &> /dev/null
echo "Done."
