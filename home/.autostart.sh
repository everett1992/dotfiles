#:: start programs
xrandr --auto # screen setup
compton &     # composition
pidgin &      # chat TODO: don't spawn buddy list
dropboxd &    # file sync

#:: Bind keys
xbindkeys & # Media keys
xmodmap ~/.scripts/bind_keys & # swapping caps and control
volumeicon & # Volume bindings

#:: System specific
~/.autostart.system.sh
