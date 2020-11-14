#!/bin/sh

# Generalise to other inputs later...
#externalConnected=$(xrandr | grep -E "^(DP1 connected|DP2 connected|HDMI1 connected|HDMI2 connected)")
#externalConnected=$(xrandr | grep -E "^DP1 connected")

dType=""
if xrandr | grep -E "^DP1 connected"; then dType="DP1"
elif xrandr | grep -E "^HDMI1 connected"; then dType="HDMI1"
elif xrandr | grep -E "^HDMI2 connected"; then dType="HDMI2"
fi

echo $dType

xrandr --auto

if [ -z "$dType" ]; then
  xrandr --output eDP1 --primary --dpi 130
else
  xrandr --output $dType --primary --above eDP1 --dpi 130
fi

feh --bg-fill ~/thisWeekTimeline.png
