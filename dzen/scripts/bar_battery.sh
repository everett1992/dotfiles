#!/bin/bash

source $(dirname $0)/config.sh

BAT=`acpi -b | awk '{gsub(/%,/,""); print $4}' | sed 's/%//g'`
STATUS=`acpi -b | awk '{gsub(/,/,""); print $3}'`

if [[ $BAT -lt 10  ]]; then
	ICON="bat_empty_01.xbm"
	if [[ $STATUS != "Charging" ]]; then
		notify-send "Warning, battery level below 10 percent" -u critical -t 30000
	fi
else

#	if [[ $BAT -lt 10 ]]; then
#		ICON="battery10.xbm"
#	elif [[ $BAT -lt 20 ]]; then
#		ICON="battery20.xbm"
#	elif [[ $BAT -lt 30 ]]; then
#		ICON="battery30.xbm"
#	elif [[ $BAT -lt 40 ]]; then
#		ICON="battery40.xbm"
#	elif [[ $BAT -lt 50 ]]; then
#		ICON="battery50.xbm"
#	elif [[ $BAT -lt 60 ]]; then
#		ICON="battery60.xbm"
#	elif [[ $BAT -lt 70 ]]; then
#		ICON="battery70.xbm"
#	elif [[ $BAT -lt 80 ]]; then
#		ICON="battery80.xbm"
#	elif [[ $BAT -lt 90 ]]; then
#		ICON="battery90.xbm"

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
