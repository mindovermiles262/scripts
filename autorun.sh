#!/bin/bash

DIR="$(dirname $0)"

if [ ! "$DIR" == "." ]; then
  echo "[!] ERROR: Must be run from current directory"
  exit 1
fi

if [[ "$OSTYPE" =~ "darwin" ]]; then
  echo "[*] MacOS Detected. Running `macos.sh`"
  "$DIR/macos.sh"
elif [[ "$OSTYPE" == 'Linux'* ]]; then
  echo "[*] Linux Detected. Running `xubuntu.sh`"
  "$DIR/xubuntu.sh"
else
  echo "[!] OS Not Detected. Exiting..."
  exit 1
fi
