#!/bin/bash

system=~/.autostart.system.sh

echo "Starting programs"
#:: start programs
xrandr --auto # screen setup
compton  &    # composition
pidgin   &    # chat TODO: don't spawn buddy list
dropboxd &    # file sync
alsactl restore & # restore audio settings

#:: Bind keys
xbindkeys & # Media keys
volumeicon & # Volume bindings

#:: System specific
if [ -x $system ]; then
  $system
fi
