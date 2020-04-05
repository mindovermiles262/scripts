#!/bin/bash

#
# Installs Bitwarden via snap
#
# @mindovermiles262
# 2020-04-04
#

printf "[*] Installing Bitwarden... "
sudo snap install bitwarden &> /dev/null
echo "Done."
