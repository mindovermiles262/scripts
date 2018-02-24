#!/bin/bash

# Moves all .vtt files into a 'subs' directory, then moves remaining 
# files except for .mp4 extensions into an 'extras' directory.

mkdir subs
mkdir extras

mv *.vtt subs/
find !(*.mp4) -type f -maxdepth 0 | xargs -I '{}' mv '{}' ./extras/
