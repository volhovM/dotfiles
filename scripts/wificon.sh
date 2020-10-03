#!/bin/bash

bt=$(rfkill list bluetooth | grep yes)
if [ -z "$bt" ]; then
  bface="<fc=red>b</fc>"
else
  bface="<fc=green>b</fc>"
fi

wifi=$(iwgetid -r)
if [ -z "$wifi" ]; then
  wifi="nothing"
fi

interfaceOn=$(ifconfig | grep wlp3s0)
if [ -z "$interfaceOn" ]; then
  iface="<fc=red>i</fc>"
else
  iface="<fc=green>i</fc>"
fi

echo "$bface $iface $wifi"
