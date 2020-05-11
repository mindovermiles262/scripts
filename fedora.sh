#!/bin/bash

export TARGETENV="fedora"
DIR="$(dirname $0)"

if [[ ! "$DIR" == "." ]]; then
  echo "[!] ERROR: Must be run from project root directory"
  exit 1
fi

"$DIR/git/autorun.sh"
"$DIR/bash/autorun.sh"
"$DIR/vim/autorun.sh"
"$DIR/tmux/autorun.sh"
