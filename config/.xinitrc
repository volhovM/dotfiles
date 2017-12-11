if [[ "$(whoami)" == "volhovm" ]]; then
  [[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
  xmodmap ~/.xmodmap
  (sleep 5 && feh --bg-fill ~/wallpaper.jpg)&
  xset r rate 200 40
  xset m 3 3
  xinput --set-prop "TPPS/2 IBM TrackPoint" "Device Accel Profile" 
  xinput --set-prop "TPPS/2 IBM TrackPoint" "Device Accel Velocity Scaling" 
  autocutsel -selection CLIPBOARD -fork
  autocutsel -selection PRIMARY -fork
  powertop --auto-tune

  thunderbird&
  telegram-desktop&
  dunst&
  xautolock -locker "dm-tool --lock" -time 1 -notify 10 -notifier "notify-send 'locking screen in 10s'" -detectsleep -resetsaver &

  (while true; do cd ~/code/orgstat; stack exec orgstat -- --select-output curWeekStats --output-dir ~/; sleep 120; done)&
  (while true; do notify-send -u low "  Concentrate  "; sleep $((60*75)); done)&
  (while true; do sh ~/dotfiles/scripts/lowBattery.sh; sleep 90; done)&
fi
