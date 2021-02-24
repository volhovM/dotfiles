#!/bin/env sh

#orgstat=~/code/orgstat/.stack-work/install/x86_64-linux-nix/036a5d1d432a46ea51bd0f15a7d513858abbbb54258460a410e930b13b1c7c95/8.8.2/bin/orgstat
orgstat=/home/volhovm/code/orgstat/.stack-work/install/x86_64-linux-nix/bf488da87814a4dd6beed611a5ed2f475fcd0bdd31850eb829a8134667d641fa/8.8.2/bin/orgstat
$orgstat --output thisWeekStatsScript --output thisWeekTimelineAll --output-dir ~/;
convert -density 200 ~/thisWeekTimelineAll.svg ~/thisWeekTimelineAll.png;
rm ~/thisWeekTimelineAll.svg;
feh --bg-color "#0f0a0f" --bg-max ~/thisWeekTimelineAll.png;

