#!/bin/bash

#
# Installs Spotify via snap
#
# @mindovermiles262
# 2020-04-04

printf "[*] Installing Spotify... "
sudo snap install spotify &> /dev/null
echo "Done."
