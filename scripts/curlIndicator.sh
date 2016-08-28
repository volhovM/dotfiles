#!/bin/sh

success="<fc=#00FF00>c</fc>"
failure="<fc=#FF0000>c</fc>"

curl -m 1 google.com > /dev/null 2> /dev/null

case $? in
  0) echo -ne $success ;;
  *) echo -ne $failure ;;
esac
