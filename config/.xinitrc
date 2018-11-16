if [[ "$(whoami)" == "volhovm" ]]; then
  [[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
  xmodmap ~/.xmodmap
  #(sleep 2 && feh --bg-fill ~/wallpaper.jpg)&
  xset r rate 200 40
  xset m 3 3
  # evdev
  xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.4
  # libinput
  # xinput set-prop 12 "libinput Accel Speed" -0.5
  autocutsel -selection CLIPBOARD -fork
  autocutsel -selection PRIMARY -fork
  powertop --auto-tune

  thunderbird&
  telegram-desktop&
  dunst&
  # arbtt-capture&
  xautolock -locker "if ! pgrep slimlock; then slimlock; fi" -time 1 -notify 10 -notifier "notify-send 'locking screen in 10s'" -detectsleep -resetsaver &

  # TODO that's for telegram, but this solution is far from optimal.
  ssh -D9001 -C -f -N metajoin.de

  (while true; do 
      cd ~/code/orgstat; 
      stack exec orgstat -- --output thisWeekStats --output thisWeekTimeline --output-dir ~/; 
      convert -density 200 ~/thisWeekTimeline.svg ~/thisWeekTimeline.png;
      rm ~/thisWeekTimeline.svg;
      feh --bg-color "#0f0a0f" --bg-max ~/thisWeekTimeline.png;
      sleep 300; 
   done)&
  (while true; do notify-send -u low "  Concentrate  "; sleep $((60*75)); done)&
  (while true; do sh ~/dotfiles/scripts/lowBattery.sh; sleep 90; done)&
 
  # Dropbox is terrible so it sometimes just dies. I have no idea TBH.
  (while true; do dropbox start; sleep 120; done)&
fi
