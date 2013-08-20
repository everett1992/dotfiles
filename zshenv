# load amazon credentials 
[[ -f "$HOME/.amazon_keys" ]] && source "$HOME/.amazon_keys";

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

PATH="$PATH:/home/caleb/.gem/ruby/2.0.0/bin"
PATH="$PATH:/home/caleb/.cabal/bin"
PATH="/home/caleb/bin:$PATH"
export GEM_HOME=~/.gem/ruby/2.0.0
