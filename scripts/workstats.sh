#!/bin/sh

cd ~/code/serokell/yt-utilities
ytToken=$(cat ~/.yttoken)
lastMon=$(date -dlast-monday +%Y-%m-%d)
echo $lastMon
./Export.hs --org ~/org/work.org --token "$ytToken" --user volhovm --mode Local --since $lastMon | tail -n 1
