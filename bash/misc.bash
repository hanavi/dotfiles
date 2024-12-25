[[ -n "$_BASH_DEBUG" ]] && echo "loading misc plugin"

# special case...
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

# set transparency for terminal... disabled for now?
# [[ $TERM == "st-256color" ]] && transset-df --id "$WINDOWID" .75 >/dev/null

command -v exa &> /dev/null && alias ls='exa'
command -v batcat &> /dev/null && alias cat='batcat'
command -v feh &> /dev/null && alias f='feh -.'
command -v zathura &> /dev/null && alias z="zathura"

alias dh="du -hs"
alias ipy="ipython"
alias m='mplayer'
alias kap="killall pinentry"

# dropbox
if [[ -d ~/.dropbox-dist ]]; then
    alias db="~/.dropbox-dist/dropboxd &; disown"
    alias ds="ps aux | grep -i dropbox |grep -v grep"
fi

# redshift
if [[ -x $HOME/scripts/run_redshift.sh ]]; then
    alias rr="$HOME/scripts/run_redshift.sh &; disown"
    alias rs="ps aux | grep -i redshift |grep -v grep"
fi


# Check for up ssh systems
up() {
    nmap -n -oG - --open 192.168.1.0/24 -p 22 | grep Up | awk '{print $2}'
}

resetcard() {
    rm -r ~/.gnupg/private-keys-v1.d
    gpgconf --kill gpg-agent
    gpg --card-status
}


now() {
    case "$1" in
        -)
            date "+%Y%m%d-%H%M%S"
            ;;
        -n)
            date "+%Y%m%d%H%M%S"
            ;;
        *)
            date "+%Y%m%d_%H%M%S"
            ;;
    esac
}

field() {
    awk -F "${2:- }" "{ print \$${1:-1} }"
}
