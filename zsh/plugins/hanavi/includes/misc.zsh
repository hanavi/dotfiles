# Misc stuff...
#
[[ -n "$_HANAVI_DEBUG" ]] && echo "loading misc config"

# Simple Terminal transparency
[[ $TERM == "st-256color" ]] && transset --id "$WINDOWID" .80 > /dev/null

# Ruby for some reason...?
[[ -d ~/.gem/ruby/2.7.0/bin ]] && export PATH=$PATH:~/.gem/ruby/2.7.0/bin

alias aps='apt search'
alias api='sudo apt install'
alias py="python"

alias dh="du -hs"
alias fr="free -h"
alias m='mplayer'

alias kap="killall pinentry"

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

command -v exa &> /dev/null && alias ls='exa'
command -v feh &> /dev/null && alias f='feh -.'
command -v zathura &> /dev/null && alias z='zathura'
command -v batcat &> /dev/null && alias cat='batcat'
command -v fdfind &>/dev/null && alias fd='fdfind'

if command -v xsel &> /dev/null; then
    clip() {
        xsel -b
    }
fi

notes() {

    YEAR=$(date "+%Y")
    MONTH=$(date "+%m")
    DATE=$(date "+%Y%m%d")
    NOTESDIR="${HOME}/Dropbox/Documents/notes/logs/${YEAR}/${MONTH}"
    NOTEFILE="${NOTESDIR}/log_${DATE}.wiki"

    [[ ! -d "${NOTESDIR}" ]] && mkdir -p "${NOTESDIR}"
    pushd "$NOTESDIR"
        vim "${NOTEFILE}"
    popd
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

