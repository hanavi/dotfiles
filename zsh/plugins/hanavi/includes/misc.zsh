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

timestamp() {
    case "$1" in
        _)
            date "+%Y%m%d_%H%M%S"
            ;;
        -n)
            date "+%Y%m%d%H%M%S"
            ;;
        *)
            date "+%Y%m%d-%H%M%S"
            ;;
    esac
}

field() {
    awk -F "${2:- }" "{ print \$${1:-1} }"
}

ipaddr() {
    ip route get 1 | sed -n 1p | field 7
}

fcopy() {
    local now=$(date "+%Y%m%d-%H%M%S")
    local clip_board_file=${HOME}/.clipboard/${now}.txt
    tee "$clip_board_file"
}

fpaste() {

    local _FZF_OPTS=(
        --preview='/usr/bin/batcat {}'
        --no-sort
    )
    [[ -n $TMUX ]] && _FZF_OPTS+=--tmux=80%

    local cfile

    for fn in $HOME/.clipboard/*.txt; do
        printf "%s\n" "$fn"
    done | sort -r | fzf "${_FZF_OPTS[@]}" | read cfile

    cat "$cfile"
}

fclean() {
    rm $HOME/.clipboard/*.txt
}
