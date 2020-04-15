#!/bin/bash

#
# Installs homebrew on Mac
#
# @mindovermiles262
# 2020-04-14
#

# Install homebrew
printf "[*] Installing homebrew... "
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Done."
