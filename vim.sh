#!/bin/bash

export TARGETENV="macos"
DIR="$(dirname $0)"

if [[ ! "$DIR" == "." ]]; then
  echo "[!] ERROR: Must be run from project root directory"
  exit 1
fi

"$DIR/vim/autorun.sh"
