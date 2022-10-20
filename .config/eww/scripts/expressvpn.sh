#!/bin/sh

vpn_status=$(expressvpn status | grep -E "Connected to" | cut -d"-" -f2 | cut -d' ' -f2,3,4,5,6)

if [ $vpn_status == ""]; then 
	vpn_status="Not Connected" 
fi

echo "$vpn_status"
