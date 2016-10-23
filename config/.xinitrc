#setxkbmap -layout pl,ru -variant dvorak,ruu -option "grp:caps_toggle"
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xmodmap ~/.xmodmap
feh --bg-fill ~/wallpaper.jpg
#trayer --edge top --align right --SetDockType true --SetPartialStrut true --transparent true --alpha 0 --tint 0x222C30 --height 16 --widthtype percent --width 7 &
#aticonfig --initial --set-dispattrib=lvds,brightness:-35
#aticonfig --initial --set-dispattrib=lvds,saturation:130
#aticonfig --initial --set-dispattrib=lvds,contrast:125
#aticonfig --initial --set-dispattrib=lvds,hue:2
thunderbird&
#skype&
telegram-desktop&
#qtox&
#dropbox start&
#quiterss&
#deadbeef&
dunst&
sh ~/programs/thoughtflare.sh
xset r rate 200 40
autocutsel -selection CLIPBOARD -fork
autocutsel -selection PRIMARY -fork
xautolock -locker slimlock -time 1 -notify 10 -notifier "notify-send 'locking screen in 10s'" -detectsleep -resetsaver &
#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session xmonad
powertop --auto-tune
(while true; do notify-send -u low "  Concentrate  "; sleep $((60*75)); done)&
