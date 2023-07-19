#!/bin/sh


wifi_state=$(iwctl station wlan0 show | grep -E "State" | sed 's/ *State *//g' | sed 's/ *//g')
wifi_status="Disconnected"

if [ "$wifi_state" = "connected" ]; then
	wifi_status=$(iwctl station wlan0 show | grep -E "Connected network" | sed 's/ *Connected network *//g' | sed 's/ *//g')
fi

# vpn status

vpn_status=$(expressvpn status | grep -E "Connected to" | cut -d"-" -f2 | cut -d' ' -f2,3,4,5,6)

color="$COLOR_blue"

if [ "$vpn_status " = " " ]; then
	vpn_status="Not Connected"
	color="$COLOR_red"
else
	wifi_status="$wifi_status ($vpn_status)"
	color="$COLOR_green"
fi

echo "  $wifi_status"
echo "$wifi_status"
echo "$color"
exit 0
