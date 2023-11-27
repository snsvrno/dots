#!/bin/sh
# Shows the WIFI connection as well as the VPN connection (if present).
#
# There is an issue where it sometimes will not show the right interface so
# it will always say disconnected

wifi_state=$(iwctl station wlan0 show | grep -E "State" | sed 's/ *State *//g' | sed 's/ *//g')
wifi_status="Disconnected"

if [ "$wifi_state" = "connected" ]; then
	wifi_status=$(iwctl station wlan0 show | grep -E "Connected network" | sed 's/ *Connected network *//g' | sed 's/ *//g')
fi

echo "  $wifi_status"
echo "$wifi_status"
echo "$color"
exit 0
