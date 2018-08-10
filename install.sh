#!/bin/bash

printf "Installing Dots (0.0.0)\n"
HOME=`readlink -f ~`

while read LINE; do
  COMMANDS=($LINE)
  NEW_PATH=${COMMANDS[1]}
  COMMAND_1=`echo "${NEW_PATH/"~"/$HOME}"`

  if [[ ! -e $COMMAND_1 ]]; then
    printf "  Installing %s\n" ${COMMANDS[0]}
    ln ${COMMANDS[0]} $COMMAND_1 
  fi
done < list
