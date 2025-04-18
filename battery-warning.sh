#!/bin/bash
# Battery warning script for i3wm

while true; do
    # Get battery status and level
    battery_info=$(acpi -b 2>/dev/null)
    if [ $? -ne 0 ]; then
        sleep 60
        continue
    fi

    battery_level=$(echo "$battery_info" | grep -Po "\d+(?=%)")
    battery_status=$(echo "$battery_info" | grep -Po "Discharging|Charging")

    # Check if battery is discharging and below 20%
    if [ "$battery_status" = "Discharging" ] && [ "$battery_level" -le 20 ]; then
        notify-send -u critical "  Battery Low!" "Battery at ${battery_level}% - Connect charger!"
        # Uncomment to play a sound (ensure sound is enabled)
        # paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
    fi

    # Check every 2 minutes
    sleep 120
done