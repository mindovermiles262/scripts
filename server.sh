#!/bin/bash

export TARGETENV="ubuntu"
DIR="$(dirname $0)"

if [[ ! "$DIR" == "." ]]; then
  echo "[!] ERROR: Must be run from project root directory"
  exit 1
fi

"$DIR/bash/autorun.sh"
"$DIR/vim/autorun.sh"
"$DIR/tmux/autorun.sh"
