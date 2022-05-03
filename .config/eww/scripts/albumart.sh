#!/bin/sh

eval MUSIC_PATH=$(cat $HOME/.config/mpd/mpd.conf | grep ^music_directory | awk -F" " 'NR==1{print $2}' | tr -d "\"")
CURRENT_SONG=$(mpc current -f "%file%")
FULL_PATH=$MUSIC_PATH/$CURRENT_SONG
echo $FULL_PATH

IMG_PATH=$HOME/.config/mpd/album.jpg

ffmpeg -i "$FULL_PATH" -an -c:v copy $IMG_PATH

