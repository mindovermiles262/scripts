#!/bin/bash

#
# Installs asdf via git to $HOME/.asdf
#
# @mindovermiles262
# 2020-04-04
#

printf "[*] Installing asdf "
if [ "$TARGETENV" = "linux" ]; then
  printf "for LINUX... "
  sudo apt-get install -y \
    build-essential \
    curl \
    gcc \
    git \
    gpg \
    dirmngr \
    make \
    libbz2-dev \
    libffi-dev \
    liblzma-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libpq-dev \
    libreadline-dev \
    libssl-dev \
    libsqlite3-dev \
    llvm \
    python-openssl \
    tk-dev \
    xz-utils \
    zlib1g-dev \
    wget
    # &> /dev/null
elif [ "$TARGETENV" = "macos" ]; then
  printf "for MACOS... "
  brew install gnupg coreutils
fi

ASDF_DIR=$HOME/.asdf
if [[ -d "$ASDF_DIR" ]]; then
  git pull --quiet origin master
else
  git clone --quiet https://github.com/asdf-vm/asdf.git "$HOME/.asdf"
fi

source ~/.bash_profile

for plug in ruby nodejs python
do
  PLUG_DIR="$HOME/.asdf/plugins/$plug"
  if [[ ! -d "$PLUG_DIR" ]]; then
    asdf plugin-add "$plug"
  fi
  
done

# Import NodeJS Keyring:
"$HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring" &> /dev/null
echo "Done."
