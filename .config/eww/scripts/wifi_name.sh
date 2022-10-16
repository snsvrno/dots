#!/bin/sh
network_name=$(nmcli -t -f active,ssid dev wifi | grep -E '^yes' | cut -d: -f2)

echo "$network_name"

