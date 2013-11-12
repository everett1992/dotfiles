#!/bin/bash

QUAL=`iwconfig $1 | grep 'Link Quality=' | awk '{gsub(/[=/]/," "); print $3}'`
if [ ! -z $QUAL ]; then
  MAX=`iwconfig $1 | grep 'Link Quality=' | awk '{gsub(/[=/]/," "); print $4}'`
  QUAL=${QUAL:-0}
  MAX=${MAX:-100}
  PERC=`echo $(($QUAL*100/$MAX))`

  if [[ $PERC -lt 20 ]]; then
    ICON="wireless1.xbm"
  elif [[ $PERC -lt 40 ]]; then
    ICON="wireless2.xbm"
  elif [[ $PERC -lt 60 ]]; then
    ICON="wireless3.xbm"
  elif [[ $PERC -lt 80 ]]; then
    ICON="wireless4.xbm"
  elif [[ $PERC -lt 101 ]]; then
    ICON="wireless5.xbm"
  fi

  ICON='^i(/home/caleb/.dzen/icons/'"$ICON)"
  echo "$color$ICON"
fi
