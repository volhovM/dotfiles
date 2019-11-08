#!/bin/env sh

orgstat=~/code/orgstat/.stack-work/install/x86_64-linux-nix/530a599931be8afc02ed6d63054a14313b0aca8f8804cc071f005cbd251c33f2/8.4.4/bin/orgstat
$orgstat --output thisWeekStatsScript --output thisWeekTimeline --output-dir ~/;
convert -density 200 ~/thisWeekTimeline.svg ~/thisWeekTimeline.png;
rm ~/thisWeekTimeline.svg;
feh --bg-color "#0f0a0f" --bg-max ~/thisWeekTimeline.png;

