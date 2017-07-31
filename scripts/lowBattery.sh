battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
discharging=`acpi -b | grep Discharging`
if [ ! -z "$discharging" ]; then 
  if [ $battery_level -le 4 ]
  then
      notify-send -u critical "TURNING OFF PC IN 5s (battery low)" "Battery level is SUPER LOW: ${battery_level}%!"
      sleep 5
      systemctl poweroff
  elif [ $battery_level -le 8 ]
  then
      notify-send -u critical "Battery low" "Battery level is critical: ${battery_level}%!"
  elif [ $battery_level -le 15 ]
  then
      notify-send "Battery low" "Battery level is ${battery_level}%!"
  fi
fi
