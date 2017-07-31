#!/bin/bash

vol=$(amixer get Master | awk -F'[]%[]' '/%/ {if ($5 == "off") { print "MM" } else { print int($2/10 + 0.5)}}' | head -n 1)

case $vol in
  0)    bar='[-----]' ;;
  1|2)  bar='[<fc=#666666>#</fc>----]' ;;
  3|4)  bar='[<fc=#666666>#</fc><fc=#888888>#</fc>---]' ;;
  5|6)  bar='[<fc=#666666>#</fc><fc=#888888>#</fc><fc=#AAAAAA>#</fc>--]' ;;
  7|8)  bar='[<fc=#666666>#</fc><fc=#888888>#</fc><fc=#AAAAAA>#</fc><fc=#CCCCCC>#</fc>-]' ;;
  9|10) bar='[<fc=#666666>#</fc><fc=#888888>#</fc><fc=#AAAAAA>#</fc><fc=#CCCCCC>#</fc><fc=#EEEEEE>#</fc>]' ;;
  *)    bar='[<fc=#FF0000>--M--</fc>]' ;;
esac

echo $bar


