#!/bin/sh

function perform () {
    success="<fc=#00FF00>p</fc>"
    failure="<fc=#FF0000>p</fc>"
    
    timeout 1 ping -c 1 google.ru > /dev/null 2> /dev/null
    
    case $? in
      0) echo -ne $success ;;
      *) echo -ne $failure ;;
    esac
}

perform
