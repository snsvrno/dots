#!/bin/sh
#
# used only to show the expressVPN status, will show nothing if not connected.

vpn_status=$(expressvpn status | grep -E "Connected to" | cut -d"-" -f2 | cut -d' ' -f2,3,4,5,6)

color="$COLOR_red"

if [ "$vpn_status " = " " ]; then
	vpn_status=""
else
	wifi_status=" $vpn_status"
fi

echo "$wifi_status"
echo "$wifi_status"
echo "$color"
exit 0
