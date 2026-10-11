# tty1: river + hrwm (river runs ~/.config/river/init, which starts hrwm)
# tty2: X + herbstluftwm via ~/.xinitrc, as a fallback
if [[ ! $DISPLAY && ! $WAYLAND_DISPLAY ]]; then
	if [[ $XDG_VTNR -eq 1 ]]; then
		mkdir -p ~/.local/state
		# keep the previous session's log, e.g. after a crash
		[[ -f ~/.local/state/river.log ]] && mv ~/.local/state/river.log ~/.local/state/river.log.old
		exec river > ~/.local/state/river.log 2>&1
	elif [[ $XDG_VTNR -eq 2 ]]; then
		exec startx
	fi
fi
