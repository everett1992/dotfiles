# Z shell env
# ~/.zshenv

#:: load credentials
[[ -f "$HOME/.keys" ]] && source "$HOME/.keys";

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
