# tmux stuff

[[ -n "$_HANAVI_DEBUG" ]] && echo "loading tmux config"

alias tl='tmux ls'

ta() {
    if tmux ls &>/dev/null; then
        tmux attach
    else
        tmux
    fi
}



