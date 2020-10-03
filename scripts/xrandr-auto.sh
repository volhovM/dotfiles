#!/bin/sh

# Generalise to other inputs later...
#externalConnected=$(xrandr | grep -E "^(DP1 connected|DP2 connected|HDMI1 connected|HDMI2 connected)")
externalConnected=$(xrandr | grep -E "^DP1 connected")

xrandr --auto

if [ -z "$externalConnected" ]; then
  xrandr --output eDP1 --primary
else
  xrandr --output DP1 --primary --above eDP1
fi

feh --bg-fill ~/thisWeekTimeline.png
