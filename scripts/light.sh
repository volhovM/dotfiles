#!/bin/sh

#function runpy {
#  echo "print ($1)" | python
#}
#
#cur=$(xbacklight)
#minval="0.12"
#maxval="100"
#delta=$(runpy "$cur * 0.8 if $cur < 20 else $cur * 0.2")
#
#if [ "$1" == "inc" ]; then
#  newval=$(runpy "$cur + $delta")
#elif [ "$1" == "dec" ]; then
#  newval=$(runpy "$cur - $delta")
#else
#  echo "Input error: expected 'inc' or 'dec'"
#  exit
#fi
#
#echo $cur
#echo $delta
#echo $newval
#
#newval=$(runpy "$minval if $newval < $minval else $newval")
#echo $newval
#newval=$(runpy "$maxval if $newval > $maxval else $newval")
#echo $newval
#
#xbacklight -set $newval

if [ "$1" == "inc" ]; then
  brightnessctl -e s +5%
elif [ "$1" == "dec" ]; then
  brightnessctl -e s 5%-
else
  echo "Input error: expected 'inc' or 'dec'"
  exit
fi


