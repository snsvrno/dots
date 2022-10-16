#!/bin/sh

battery_level=$(cat /sys/class/power_supply/BAT0/capacity)

battery=
if [ $battery_level -gt 95 ]; then
	battery="  "
elif [ $battery_level -gt 75 ]; then
	battery="  "
elif [ $battery_level -gt 50 ]; then
	battery="  "
elif [ $battery_level -gt 25 ]; then
	battery="  "
else
	battery="  "
fi

echo "$batter_level $battery"
