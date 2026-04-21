#!/bin/bash

set -e

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

# Copy Music
rsync --dry-run -rv --size-only "$HOME/Music/Library/"* "$1/Music"
read -n 1 -p "Look good? [y/n]: " MUSIC_CONFIRM
echo ""

if [ "$MUSIC_CONFIRM" = "Y" ] || [ "$MUSIC_CONFIRM" = "y" ]; then
  rsync -rv --size-only "$HOME/Music/Library/"* "$1/Music"
else
  echo "Confirmation was not 'y' ... skipping Music sync"
  sleep 2
fi

# Copy Podcasts
rsync --dry-run -rv --size-only "$HOME/Music/Podcasts/"* "$1/Podcasts"
read -n 1 -p "Look good? [y/n]: " POD_CONFIRM
echo ""

if [ "$POD_CONFIRM" = "Y" ] || [ "$POD_CONFIRM" = "y" ]; then
  rsync -rv --size-only "$HOME/Music/Podcasts/"* "$1/Podcasts"
else
  echo "Confirmation was not 'y' ... skipping Podcast sync"
  sleep 2
fi

# TODO: Copy Audiobooks
# rsync -rv --size-only --delete "$HOME/Music/Audiobooks/* $1/Audiobooks"
# rsync -rv --size-only --delete "$HOME/Music/Podcasts/* $1/Podcasts"
