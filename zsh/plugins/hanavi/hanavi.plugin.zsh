# Init and misc stuff
# export _HANAVI_DEBUG=1

[[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && export PATH=$PATH:$HOME/.local/bin
[ -d ~/.gem/ruby/2.7.0/bin ] && export PATH=$PATH:~/.gem/ruby/2.7.0/bin

# export _HANAVI_PLUG_PATH=${HOME}/.oh-my-zsh/custom/plugins/hanavi/includes/
export _HANAVI_PLUG_PATH=${0:a:h}/includes

alias eb="vim $HOME/files/dotfiles/zsh/plugins/hanavi/hanavi.plugin.zsh ${_HANAVI_PLUG_PATH}/*.zsh"
alias sb='exec zsh'

alias es='vim $HOME/.ssh/config'
alias et='vim $HOME/.tmux.conf'

alias aps='apt search'
alias api='sudo apt install'

alias py="python"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

command -v exa &> /dev/null && alias ls='exa'
command -v feh &> /dev/null && alias f='feh -.'
command -v zathura &> /dev/null && alias z='zathura'
command -v batcat &> /dev/null && alias cat='batcat'
command -v fdfind &>/dev/null && alias fd='fdfind'

function notes {

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

# custom sub-plugin stuff
for fn in ${_HANAVI_PLUG_PATH}/*.zsh; do
    source $fn
done

alias dh="du -hs"
alias m='mplayer'
alias dr='docker run --rm -it'

## Misc
alias tl='tmux ls'
alias ta='tmux attach'
alias kap="killall pinentry"

export EDITOR=vim
export FCEDIT=vim
