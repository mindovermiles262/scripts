#!/bin/bash

#
# Installs asdf via git to $HOME/.asdf
#
# @mindovermiles262
# 2020-04-04
#

printf "[*] Installing asdf... "
sudo apt-get -qq install -y \
  build-essential \
  curl \
  gcc \
  git \
  make \
  libbz2-dev \
  libffi-dev \
  liblzma-dev \
  libncurses5-dev \
  libncursesw5-dev \
  libreadline-dev \
  libssl-dev \
  libsqlite3-dev \
  llvm \
  python-openssl \
  tk-dev \
  xz-utils \
  zlib1g-dev \
  wget &> /dev/null


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
