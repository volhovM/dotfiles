if [[ "$(whoami)" == "volhovm" ]]; then
  [[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
  #xmodmap ~/.xmodmap

  # Laptop trackpoint
  #xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.4
  # Keyboard trackpoint
  #xinput set-prop 14 "Device Accel Constant Deceleration" 0.5

  autocutsel -selection CLIPBOARD -fork
  autocutsel -selection PRIMARY -fork
  powertop --auto-tune

  thunderbird&
  telegram-desktop&
  nextcloud&
  dunst&
#  xautolock -locker "if ! pgrep slimlock; then slimlock; fi" -time 1 -notify 10 -notifier "notify-send 'locking screen in 10s'" -detectsleep -resetsaver &
  xautolock -locker xsecurelock -time 1 -notify 10 -notifier "notify-send 'locking screen in 10s'" -detectsleep -resetsaver &

  (while true; do
      ~/dotfiles/scripts/orgstat.sh;
      sleep 300;
   done)&
  (while true; do notify-send -u low "  Relax your shoulders  "; sleep $(( 60 * (20 + $RANDOM % 40) )); done)&
fi
