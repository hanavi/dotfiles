# Config editing stuff
shopt -s autocd
shopt -s nullglob

# This has to be set early...
[[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && export PATH=$PATH:$HOME/.local/bin

for fn in ~/.config/bash/*.bash; do
    source "$fn"
done

for fn in ~/.config/bash/local/*.bash; do
    source "$fn"
done

# special case...
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

command -v exa &> /dev/null && alias ls='exa'
command -v batcat &> /dev/null && alias cat='batcat'
command -v feh &> /dev/null && alias f='feh -.'
command -v zathura &> /dev/null && alias z="zathura"

alias dh="du -hs"
alias ipy="ipython"
alias m='mplayer'

# dropbox
if [ -d ~/.dropbox-dist ]; then
    alias db="~/.dropbox-dist/dropboxd &; disown"
    alias ds="ps aux | grep -i dropbox |grep -v grep"
fi

# redshift
if [ -x $HOME/scripts/run_redshift.sh ]; then
    alias rr="$HOME/scripts/run_redshift.sh &; disown"
    alias rs="ps aux | grep -i redshift |grep -v grep"
fi

## Misc
alias tl='tmux ls'
alias ta='tmux attach'
alias kap="killall pinentry"

# Check for up ssh systems
up() {
    nmap -n -oG - --open 192.168.1.0/24 -p 22 |grep Up | awk '{print $2}'
}

resetcard() {
    rm -r ~/.gnupg/private-keys-v1.d
    gpgconf --kill gpg-agent
    gpg --card-status
}

# set transparency for terminal... disabled for now?
# [ $TERM == "st-256color" ] && transset-df --id "$WINDOWID" .75 >/dev/null

export EDITOR=vim
export FCEDIT=vim
