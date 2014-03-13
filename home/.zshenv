# Z shell env
# ~/.zshenv

#:: load credentials
[[ -f "$HOME/.keys" ]] && source "$HOME/.keys";

[[ -f $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin        # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/heroku/bin # Add Heroku to the path
