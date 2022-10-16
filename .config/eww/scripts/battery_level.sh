#!/bin/sh
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
echo "$battery_level"
