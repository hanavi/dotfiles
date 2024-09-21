# paths config

[ -n "$_HANAVI_DEBUG" ] && echo "loading paths config"

[ -d /usr/local/src ] && alias src='cd /usr/local/src/'

if [ -d ~/.config/nvim/lua/hanavi ]; then
    alias ndir="cd ~/.config/nvim/lua/hanavi"
else
    alias ndir="cd ~/.vim/"
fi

alias tmp='cd ~/tmp'
alias dfd='cd ~/files/dotfiles/'
