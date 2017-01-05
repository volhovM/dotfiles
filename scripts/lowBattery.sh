battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
if [ $battery_level -le 8 ]
then
    notify-send -u critical "Battery low" "Battery level is critical: ${battery_level}%!"
elif [ $battery_level -le 15 ]
then
    notify-send "Battery low" "Battery level is ${battery_level}%!"
fi
