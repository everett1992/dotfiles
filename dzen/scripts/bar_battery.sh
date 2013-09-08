#!/bin/bash

source $(dirname $0)/config.sh

BAT=`acpi -b | awk '{gsub(/%,/,""); print $4}' | sed 's/%//g'`
STATUS=`acpi -b | awk '{gsub(/,/,""); print $3}'`

if [[ $BAT -lt 10  ]]; then
	ICON="bat_empty_01.xbm"
else
	if [[ $BAT -lt 40 ]]; then
		ICON="bat_low_01.xbm"
	else
		ICON="bat_full_01.xbm"
	fi
fi

if [[ $STATUS != "Discharging" ]]; then
	ICON="ac_01.xbm"
fi
ICON='^i(/home/caleb/.dzen/icons/'"$ICON)"
echo "$ICON"
