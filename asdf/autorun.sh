#!/bin/bash

#
# Installs asdf via git to $HOME/.asdf
#
# @mindovermiles262
# 2020-04-04
#

printf "[*] Installing asdf... "
sudo apt-get -qq install -y \
  curl \
  git \
  gcc \
  make \
  libssl-dev \
  libreadline-dev \
  zlib1g-dev \
  libsqlite3-dev &> /dev/null

ASDF_DIR=$HOME/.asdf
if [[ -d "$ASDF_DIR" ]]; then
  rm -rf "$ASDF_DIR"
fi

git clone --quiet https://github.com/asdf-vm/asdf.git "$HOME/.asdf"

source ~/.bash_profile
asdf plugin-add ruby &> /dev/null
asdf plugin-add nodejs &> /dev/null
asdf plugin-add python &> /dev/null
echo "Done."
