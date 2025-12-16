#!/bin/bash

usage() {
  echo ""
  echo "Usage"
  echo "  $0 /path/to/mounted/music/directory"
  echo ""
}

if [[ $# -ne 1 ]]; then
  usage
  echo "[!] No Arguments Given"
  exit 1
fi

rsync -rv --size-only --delete "$HOME/Music/Library/* $1/Music"
rsync -rv --size-only --delete "$HOME/Music/Audiobooks/* $1/Audiobooks"
rsync -rv --size-only --delete "$HOME/Music/Podcasts/* $1/Podcasts"
