#!/bin/bash

if [ $# -eq 0 ]; then BRANCH="origin"; else BRANCH="$1"; fi
REMOTE=$(git config --get remote.$BRANCH.url)
if [[ "$REMOTE" =~ "git@" ]]; then
  URL=$(echo "$REMOTE" | awk -F "@" '{print $2}' | awk -F " " '{print $1}' | sed 's/:/\//g' | sed 's/.git//g' | awk '{print "https://"$1}')
else
  URL=$REMOTE
fi
echo "[*] $URL"

if [[ "$OSTYPE" == 'linux'* ]]; then
  xdg-open "$URL"
elif [[ "$OSTYPE" =~ "darwin" ]]; then
  open "$URL"
fi


