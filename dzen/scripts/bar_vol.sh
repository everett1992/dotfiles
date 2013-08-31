#!/bin/bash

source $(dirname $0)/config.sh

AMASTER=`amixer get Master | awk 'END{gsub(/\[|\]|%/,""); print $4}'`
ASTAT=`amixer get Master | awk 'END{gsub(/\[|\]|%/,""); print $6}'`
ICON=""

if [[ $ASTAT = "on" ]]; then
    ICON="spkr_01.xbm"
else
    ICON="spkr_02.xbm"
fi

ICON='^i(/home/caleb/.dzen/icons/'"$ICON)"
echo "$ICON $AMASTER"
