# vim/nvim

[ -n "$_HANAVI_DEBUG" ] && echo "loading vim/nvim config"

if command -v nvim &> /dev/null; then

    function vim {
        nvim "$@"
    }

    function v {
        nvim "$@"
    }

    alias vd='nvim -d'
    alias ev='vim $HOME/.config/nvim/lua/hanavi/init.lua'
    alias vv='/usr/bin/vim'
else
    alias v='vim'
    alias vd='vimdiff'
    alias ev='vim $HOME/.vim/vimrc'
fi
