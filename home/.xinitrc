#!/bin/bash
xset -b
xset +fp /usr/share/fonts/local
xset fp rehash

eval $(/usr/bin/ssh-agent)

# Run local xinitrc
[[ -f $HOME/.xinitrc.system ]] && $HOME/.xinitrc.system

function herbstluftwm {
  ~/.autostart
  exec herbstluftwm
}

function bspwm {
  sxhkd &
  ~/.autostart
  exec bspwm
}

case ${2:-$1} in
gnome)
  exec gnome-session
  ;;
steam)
  steam
  exec startxfce4
  ;;
herbstluftwm)
  herbstluftwm
  ;;
bspwm)
  bspwm
  ;;
xfce)
  #sh .autostart
  nm-applet &
  volumeicon &
  exec startxfce4
  ;;
*)
  herbstluftwm
  #bspwm
  ;;
esac
