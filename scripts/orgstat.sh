#!/bin/env sh

orgstat=~/code/orgstat/.stack-work/install/x86_64-linux-nix/lts-12.18/8.4.4/bin/orgstat
$orgstat --output thisWeekStatsScript --output thisWeekTimeline --output-dir ~/;
convert -density 200 ~/thisWeekTimeline.svg ~/thisWeekTimeline.png;
rm ~/thisWeekTimeline.svg;
feh --bg-color "#0f0a0f" --bg-max ~/thisWeekTimeline.png;

