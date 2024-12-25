
[[ -n "$_HANAVI_DEBUG" ]] && echo "loading docker config"

alias mp="~/files/projects/docker/mplayer/mplayer.sh"
alias yt="~/files/projects/docker/ytdl/ytdl.sh"

alias dil='docker image ls'
alias dcl='docker container ls'

alias dc='docker'

dr() {
    docker run --rm -it "$@"
}
