#!/bin/bash

echo "type filename"
read FILE

exec 6<>"$FILE"

while read -r DUDE; do
  echo "BALLER: $DUDE"
done <&6

echo "File read on $(date)" >&6

exec 6>&-
