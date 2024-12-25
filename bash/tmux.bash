[[ -n "$_BASH_DEBUG" ]] && echo "loading tmux plugin"

alias tl='tmux ls'

ta() {
    if tmux ls &>/dev/null; then
        tmux attach
    else
        tmux
    fi
}

