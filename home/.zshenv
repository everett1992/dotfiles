# load amazon credentials 
[[ -f "$HOME/.amazon_keys" ]] && source "$HOME/.amazon_keys";

[[ -f $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
