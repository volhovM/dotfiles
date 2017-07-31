#!/bin/bash

if [ ! -f ~/programs ]; then mkdir ~/programs; fi

dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
for i in $(ls | grep sh); do
    ln -s "$dir/$i" ~/programs/$i
done
