#!/bin/env sh

orgstat=~/code/orgstat/.stack-work/install/x86_64-linux-nix/036a5d1d432a46ea51bd0f15a7d513858abbbb54258460a410e930b13b1c7c95/8.8.2/bin/orgstat
$orgstat --output thisWeekStatsScript --output thisWeekTimeline --output-dir ~/;
convert -density 200 ~/thisWeekTimeline.svg ~/thisWeekTimeline.png;
rm ~/thisWeekTimeline.svg;
feh --bg-color "#0f0a0f" --bg-max ~/thisWeekTimeline.png;

