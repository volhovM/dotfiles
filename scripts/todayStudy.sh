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
        1) out="08:20 pe-11:40-ml-ml-func-func 18:30" ;;
        2) out="10:00 cod-cod-db-db-db 18:30" ;;
        3) out="no university" ;;
        4) out="11:40 seg-seg 15:40" ;;
        5) out="no university" ;;
        6) out="10:00 po-po-net-net 16:50" ;;
        7) out=$free ;;

        8) out="08:20 pe-11:40-ml-ml-func-func 18:30" ;;
        9) out="10:00 cod-cod-db 15:00" ;;
        10) out="no university" ;;
        11) out="11:40 seg-seg 15:40" ;;
        12) out="no university" ;;
        13) out="10:00 po-po-net-net 16:50" ;;
        14) out=$free ;;

        15) out="08:20 pe-11:40-ml-ml-func-func 18:30" ;;
        *) out="SHDL ERROR" ;;
esac

echo $out
