#!/bin/sh
# https://gist.github.com/johnallen3d/61e2a165a5e13218c7621f6ba31a11fd
# modified to include album name

STATUS="$(mpc status -f '%artist% - %title% - %album%')"

if [ $(echo "$STATUS" | wc -l | tr -d ' ') == "1" ]; then
  status="[empty]"
else
  artist=$(echo "$STATUS"      | awk -F" - " 'NR==1{print $1}')
  song=$(echo "$STATUS"        | awk -F" - " 'NR==1{print $2}')
  album=$(echo "$STATUS"        | awk -F" - " 'NR==1{print $3}')
  status=$(echo "$STATUS"      | awk         'NR==2{print $1}')

  track_data=$(echo "$STATUS" | awk         'NR==2{print $2}')
  current_track_number=$(echo "$track_data" | awk -F"/" '{print $1}')
  total_track_count=$(echo "$track_data"    | awk -F"/" '{print $2}')

  elapsed=$(echo "$STATUS" | awk 'NR==2{print $3}')
  current_time=$(echo "${elapsed}" | awk -F"/" '{print $1}')
  track_length=$(echo "${elapsed}" | awk -F"/" '{print $2}')

  volume=$(
    echo "$STATUS" \
      | awk -F":" 'NR==3{print $2}' \
      | awk '{print $1}'
  )
fi

echo "{
  \"artist\":             \"${artist}\",
  \"song\":               \"${song}\",
  \"album\":              \"${album}\",
  \"elapsed\":            \"${elapsed}\",
  \"currentTime\":        \"${current_time}\",
  \"trackLength\":        \"${track_length}\",
  \"currentTrackNumber\": \"${current_track_number/\#/}\",
  \"totalTrackCount\":    \"${total_track_count}\",
  \"status\":             \"${status}\",
  \"volume\":             \"${volume}\"
}"
