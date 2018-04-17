#!/bin/bash

ORIGINAL="$1 ";
INPUT="$ORIGINAL";

while :; do
  tput clear;
  tput cup 1 0;
  (bash -c "$INPUT" | head -n `expr $(tput lines) - 2` | cut -c 1-`tput cols`)|| true;
  tput cup 0 0;
  IFS= read -p "live\$ $INPUT" -n 1 CHAR;
  echo;
  if [[ $CHAR == $'\177' ]]; then
    if [[ "$INPUT" != "$ORIGINAL" ]]; then
      INPUT="${INPUT%?}";
    fi
  else
    INPUT+="$CHAR";
  fi
done
