#!/bin/sh
signal_level=$(nmcli -t -f active,signal dev wifi | grep -E '^yes' | cut -d: -f2)

echo "$signal_level"
