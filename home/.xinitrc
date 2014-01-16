#!/bin/bash
# Startx script
# ~/.xinitrc

#:: Load fonts
xset -b
xset +fp /usr/share/fonts/local
xset fp rehash


#:: Start ssh-agent
eval $(/usr/bin/ssh-agent)

#:: Run local xinitrc
[[ -f $HOME/.xinitrc.system ]] && $HOME/.xinitrc.system


#:: Start window manager
function herbstluftwm {
  ~/.autostart
  exec herbstluftwm
}

function bspwm {
  sxhkd &
  ~/.autostart
  exec bspwm
}

herbstluftwm

#case ${2:-$1} in
#gnome)
#  exec gnome-session
#  ;;
#steam)
#  steam
#  exec startxfce4
#  ;;
#herbstluftwm)
#  herbstluftwm
#  ;;
#bspwm)
#  bspwm
#  ;;
#xfce)
#  #sh .autostart
#  nm-applet &
#  volumeicon &
#  exec startxfce4
#  ;;
#*)
#  herbstluftwm
#  #bspwm
#  ;;
#esac
