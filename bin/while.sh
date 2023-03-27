#!/bin/bash

echo "how many times?"
read -r REPEAT

COUNT=1

while [ "$COUNT" -le "$REPEAT" ]; do
  echo "FU - $COUNT"
  COUNT="$((COUNT + 1))"
done
