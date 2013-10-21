#!/bin/bash
xset -b
xset +fp /usr/share/fonts/local
xset fp rehash

xset mouse 3/1 2

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
