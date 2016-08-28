#!/bin/bash

wifi=$(iwgetid -r)
if [ -z "$wifi" ]; then
  wifi="disconnected"
fi
echo $wifi
