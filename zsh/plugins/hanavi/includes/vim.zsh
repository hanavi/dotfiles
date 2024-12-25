# vim/nvim

[[ -n "$_HANAVI_DEBUG" ]] && echo "loading vim/nvim config"


if command -v nvim &> /dev/null; then

    vim() {
        nvim "$@"
    }

    v() {
        nvim "$@"
    }

    alias vd='nvim -d'
    alias ev='vim $HOME/.config/nvim/lua/hanavi/*.lua $HOME/.config/nvim/after/plugin/*.lua'
    alias vv='/usr/bin/vim'
    alias ndir="cd ~/.config/nvim/lua/hanavi"
else
    alias v='vim'
    alias vd='vimdiff'
    alias ev='vim $HOME/.vim/vimrc'
fi

alias vdir="cd ~/.vim/"
