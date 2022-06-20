#!/bin/bash

ICON_SIZE=22
Xaxis=$(echo $(xrandr --current | grep '*' | uniq | awk '{print $1;exit}' | cut -d 'x' -f1) - $ICON_SIZE | bc)
Yaxis=$(echo $(xrandr --current | grep '*' | uniq | awk '{print $1;exit}' | cut -d 'x' -f2) - $ICON_SIZE | bc)

if pgrep stalonetray;
then pkill stalonetray;
else exec stalonetray --grow-gravity E  --icon-gravity E --icon-size=$ICON_SIZE -geometry 1x1+$Xaxis+$Yaxis
fi

