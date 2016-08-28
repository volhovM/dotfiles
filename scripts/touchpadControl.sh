#!/bin/bash

isDisabled=$(synclient | grep TouchpadOff | tail -c 2)
case $isDisabled in
    1) $(synclient TouchpadOff=0) ;;
    *) $(synclient TouchpadOff=1) ;;
esac
