#!/bin/bash

#
# Installs and configures git
#
# @mindovermiles262
# 2020-04-04
#

printf "[*] Installing git... "

if [ "$TARGETENV" = "fedora" ]; then
  sudo dnf install -y git
else
  sudo apt-get -qq install -y git &> /dev/null
fi

git config --global user.name "Andy D"
git config --global user.email "mindovermiles262@gmail"
echo "Done."
