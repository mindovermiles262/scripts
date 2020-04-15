#!/bin/bash

#
# EasyInstallation on MacOS
#
# @mindovermiles262
# 2020-04-14
#

PWD="$(pwd)"
DIR="$(dirname $0)"

export TARGETENV="macos"

# Bash
"$DIR/bash/autorun.sh"

# Homebrew
"$DIR/homebrew/autorun.sh"

# Vim
"$DIR/vim/autorun.sh"

# Tmux
"$DIR/tmux/autorun.sh"

# Terminal Themes

# Spotify

# VSCode

