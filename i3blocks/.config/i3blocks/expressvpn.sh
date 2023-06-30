#!/bin/sh


wifi_state=$(iwctl station wlan0 show | grep -E "State" | sed 's/ *State *//g' | sed 's/ *//g')
wifi_status="Disconnected"

if [ "$wifi_state" = "connected" ]; then
	wifi_status=$(iwctl station wlan0 show | grep -E "Connected network" | sed 's/ *Connected network *//g' | sed 's/ *//g')
fi

# vpn status

vpn_status=$(expressvpn status | grep -E "Connected to" | cut -d"-" -f2 | cut -d' ' -f2,3,4,5,6)

color="#50fa7b"

if [ "$vpn_status " = " " ]; then
	vpn_status="Not Connected"
	color="#bd93f9"
else
	wifi_status="$wifi_status ($vpn_status)"
fi

echo " $wifi_status"
echo "$wifi_status"
echo "$color"
exit 0
