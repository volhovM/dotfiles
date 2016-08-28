#!/bin/sh

success="<fc=#00FF00>p</fc>"
failure="<fc=#FF0000>p</fc>"

ping -c 1 google.ru -w 1 > /dev/null 2> /dev/null

case $? in
  0) echo -ne $success ;;
  *) echo -ne $failure ;;
esac
