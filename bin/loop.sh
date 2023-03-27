#!/bin/bash

SVR=(web01 web02 web03 db01 db02)
COUNT=0

for INDEX in "${SVR[@]}"; do
  echo "processing ${SVR[INDEX]}"
  COUNT="$((COUNT + 1))"
done;
