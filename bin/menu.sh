#!/bin/bash

${MENUBOX=dialog} --title "FU" --menu "CHOOSE" 15 45 3 1 "f off" 2 "f off hard" X "give up" 2>choice.txt

case "`cat choice.txt`" in
  1) echo "F OFF!!";;
  2) echo "F OFF HARD!!!";;
  3) echo "EXIT";;
esac


