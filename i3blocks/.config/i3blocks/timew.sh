#!/bin/sh

tm_status_line=$(timew)

if [ "$tm_status_line" = "There is no active time tracking." ]; then
	tm_status="-";
	color="$COLOR_yellow"
else
	tm_time=$(echo "$tm_status_line" | tail -1 | awk '{print $2}')
	tm_tags=$(echo "$tm_status_line" | head -1 | cut -d" " -f2-9)
	tm_status="$tm_tags ($tm_time)"
	color="$COLOR_red"
fi

echo "TM: $tm_status"
echo "$tm_status"
echo "$color"
exit 0
