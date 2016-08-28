#!/bin/bash

day=$(date +%u) 
weeks="10#"$(date +%W)
day=$(((weeks % 2) * 7 + day))
hour=$(date +%H)

if [ "$hour" -gt "16" ]; then
  day=$(($day + 1))
fi

free="Let org lead you"
case $day in
        1) out="11:00 pe-__-funcan-pp-pp 18:40" ;;
        2) out="11:00 seg-seg-seg-phil 15:40" ;;
        3) out="09:00 military department stuff 17:00 " ;;
        4) out="11:00 dm-dm-dm 15:40" ;;
        5) out="11:00 stat-stat-mph-mph 17:10" ;;
        6) out="15:50 eng-eng 18:40" ;;
        7) out=$free ;;

        8) out="10:00 pe-__-funcan-pp-pp 18:40" ;;
        9) out="11:00 seg-seg-seg 15:40" ;;
        10) out="09:00 military department stuff 17:00 " ;;
        11) out="11:00 dm-dm-dm 15:40" ;;
        12) out="09:30 phil-stat-stat-mph-mph 17:10" ;;
        13) out="15:50 eng-eng 18:40" ;;
        14) out=$free ;;

        15) out="11:00 pe-__-funcan-pp-pp 18:40" ;;
        *) out="SHDL ERROR" ;;
esac

echo $out
