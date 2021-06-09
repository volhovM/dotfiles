#!/bin/env sh

orgstat=/home/volhovm/code/orgstat/.stack-work/install/x86_64-linux-nix/e493602a1e8010152fbd610b3b7a1c0b51962b11bfc276ea397741399a7f1b83/8.8.2/bin/orgstat
#$orgstat --output thisWeekStatsScript --output-dir ~/;
$orgstat --output thisWeekStatsScript --output thisWeekTimelineAll --output-dir ~/;
convert -density 200 ~/thisWeekTimelineAll.svg ~/thisWeekTimelineAll.png;
rm ~/thisWeekTimelineAll.svg;
feh --bg-color "#0f0a0f" --bg-max ~/thisWeekTimelineAll.png;

