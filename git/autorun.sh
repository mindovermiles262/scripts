#!/bin/bash

#
# Installs and configures git
#
# @mindovermiles262
# 2020-04-04
#

printf "[*] Installing git... "
sudo apt-get -qq install -y git &> /dev/null

git config --global user.name "Andy D"
git config --global user.email "mindovermiles262@gmail"
echo "Done."
