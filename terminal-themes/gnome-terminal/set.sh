#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
TS=$(date +"%s")

if [ "$#" -ne 1 ]; then
  echo "USAGE: $0 [PROFILE].dconf"
  exit 1
fi

dconf dump /org/gnome/terminal/legacy/profiles:/ > "$SCRIPT_DIR/.dconf-$TS"

dconf load /org/gnome/terminal/legacy/profiles:/ < $1
