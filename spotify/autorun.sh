#!/bin/bash

#
# Installs Spotify via snap
#
# @mindovermiles262
# 2020-04-04

printf "[*] Installing Spotify... "
sudo apt-get -qq install -y snapd
sudo snap install spotify &> /dev/null
echo "Done."
