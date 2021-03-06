#!/bin/bash

DIR="$(dirname $0)"

if [ ! "$DIR" == "." ]; then
  echo "[!] ERROR: Must be run from current directory"
  exit 1
fi

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

# Mouse
"$DIR/mouse/autorun.sh"

# Bitwarden
"$DIR/bitwarden/autorun.sh"

# Spotify
"$DIR/spotify/autorun.sh"

# Firefox Developer Edition
"$DIR/firefox-dev/autorun.sh"
