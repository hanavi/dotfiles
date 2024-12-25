[[ -n "$_BASH_DEBUG" ]] && echo "loading docker plugin"

command docker -v &> /dev/null || return

alias d='docker'
alias dil='docker image ls'
alias dcl='docker container ls'
alias dr='docker run --rm -it'
