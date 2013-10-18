# load amazon credentials 
[[ -f "$HOME/.amazon_keys" ]] && source "$HOME/.amazon_keys";

PATH="$PATH:/home/caleb/.cabal/bin"
PATH="/home/caleb/.bin:$PATH"

[[ -f $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
