# zsh login shell
# ~/.zlogin

#:: Start ssh-agent
eval $(/usr/bin/ssh-agent)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
