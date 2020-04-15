#!/bin/bash

DIR="$(dirname $0)"

# Update apt
"$DIR/apt/autorun.sh"

# Bash Profile
"$DIR/bash/autorun.sh"

# Git
"$DIR/git/autorun.sh"

# asdf
"$DIR/asdf/autorun.sh"

# VIM
"$DIR/vim/autorun.sh"

# tmux
"$DIR/tmux/autorun.sh"

# redshift
"$DIR/redshift/autorun.sh"

# libinput
"$DIR/libinput/autorun.sh"

# Bitwarden
"$DIR/bitwarden/autorun.sh"

# Spotify
"$DIR/spotify/autorun.sh"

# Mouse customizations
"$DIR/mouse/autorun.sh"

# Firefox Developer Edition
"$DIR/firefox-dev/autorun.sh"

# Install and Configure Compton
"$DIR/compton/autorun.sh"

# Customize Keyboard
"$DIR/keyboard/autorun.sh"
