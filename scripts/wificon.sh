#!/bin/bash

wifi=$(iwgetid -r)
if [ -z "$wifi" ]; then
  wifi="nothing"
fi

interfaceOn=$(ifconfig | grep wlp3s0)
if [ -z $interfaceOn ]; then
  iface="<fc=red>i</fc>"
else
  iface="<fc=green>i</fc>"
fi

echo "$iface $wifi"
