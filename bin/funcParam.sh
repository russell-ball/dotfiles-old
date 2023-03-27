#!/bin/bash

NAME=$1

ageInDays() {
  echo "You are $(($1 * 365))"
}

echo "Enter age in years"
read YEARS

echo "$NAME, you are $(ageInDays "$YEARS")"
