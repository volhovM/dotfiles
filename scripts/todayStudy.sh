#!/bin/bash

day=$(($(date +%u) - 1))
weeks=$(date +%W)
day=$(expr $weeks % 2 \* 7 + $day % 14)
hour=$(date +%H)

if [ "$hour" -gt "16" ]; then
  day=$(($day + 1))
fi

free="org/work"
case $day in
        # Even week
        0) out="11:40 ml-ml-net-net 18:30" ;;
        2) out="10:00 pe 11:30" ;;
        3) out="10:00 game-game-opt-opt 16:50" ;;
        4) out="08:20 pe 9:50" ;;
        5) out="10:00 po-po 13:10" ;;

        # Odd week
        7) out="11:40-ml-ml-net-net 18:30" ;;
        9) out="10:00 pe-13:30-eng-eng 16:50" ;;
        10) out="10:00 game-game-opt-opt 16:50" ;;
        11) out="08:20 pe 9:50" ;;
        12) out="10:00 po-po 13:10" ;;

        *) out=$free ;;
esac

echo $out
