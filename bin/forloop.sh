#!/bin/bash

for SCRIPT in "$(ls *.sh)"; do
  CONTENTS="$(cat $SCRIPT)"
  echo "FILE: $SCRIPT CONTENTS: $CONTENTS"
done
