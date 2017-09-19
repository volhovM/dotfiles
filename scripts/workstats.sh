#!/bin/sh

workstatsFile=~/.workstats
yttokenFile=~/.yttoken

cd ~/code/serokell/yt-utilities
ytToken=$(cat $yttokenFile)
lastMon=$(date -dlast-monday +%Y-%m-%d)
cat $workstatsFile | head -n 1
# Lazily write to file and read the old version instead. 
# Xmobar doesn't like long actions and lags as hell.
(./Export.hs --org ~/org/work.org --token "$ytToken" --user volhovm --mode Local --since $lastMon | tail -n 1 > $workstatsFile; echo "last updated on $(date)" >> $workstatsFile)&
