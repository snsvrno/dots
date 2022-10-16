#!/bin/sh
signal_level=$(nmcli -t -f active,signal dev wifi | grep -E '^yes' | cut -d: -f2)

signal=
if [ $signal_level -gt 95 ]; then
	signal="  "
elif [ $signal_level -gt 75 ]; then
	signal="  "
elif [ $signal_level -gt 50 ]; then
	signal="  "
elif [ $signal_level -gt 25 ]; then
	signal="  "
else
	signal="  "
fi

echo "$signal_level"
