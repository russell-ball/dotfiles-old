#!/bin/bash

echo "enter file"
read FILE

echo "enter delim"
read DELIM

IFS="$DELIM"

while read -r NAME AGE SPORT; do
  echo "NAME: $NAME"
  echo "AGE: $AGE"
  echo "SPORT: $SPORT"
done <"$FILE"
