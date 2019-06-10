#!/bin/env sh

cd ~/code/orgstat;
stack exec orgstat -- --output thisWeekStats --output thisWeekTimeline --output-dir ~/;
convert -density 200 ~/thisWeekTimeline.svg ~/thisWeekTimeline.png;
rm ~/thisWeekTimeline.svg;
feh --bg-color "#0f0a0f" --bg-max ~/thisWeekTimeline.png;

