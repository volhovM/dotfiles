battery_level=$((`acpi -b | grep -P -o '[0-9]+(?=%)'` + 1))
discharging=`acpi -b | grep Discharging`
if [ ! -z "$discharging" ]; then
  if [ $battery_level -le 3 ]
  then
      notify-send -u critical "SUSPENDING PC IN 40s (battery low)" "Battery level is SUPER LOW: ${battery_level}%!"
      sleep 40
      systemctl suspend
  elif [ $battery_level -le 7 ]
  then
      notify-send -u critical "Battery low" "Battery level is critical: ${battery_level}%!"
  elif [ $battery_level -le 12 ]
  then
      notify-send "Battery low" "Battery level is ${battery_level}%!"
  fi
fi
