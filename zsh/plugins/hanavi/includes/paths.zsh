# paths config

[[ -n "$_HANAVI_DEBUG" ]] && echo "loading paths config"

[[ -d /usr/local/src ]] && alias src='cd /usr/local/src/'

alias tmp='cd ~/tmp'
alias ddir='cd ~/files/projects/docker/'

alias p="cd ~/projects"

dfd(){
    if [[ -d  "$HOME/.local/dotfiles" ]]; then
        cd "$HOME/files/dotfiles/"
    elif [[ -d  "$HOME/files/dotfiles" ]]; then
        cd "$HOME/files/dotfiles/"
    else
        echo "ERROR: dotfiles directory not found!"
        return 1
    fi
}
