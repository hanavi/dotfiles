# Init and misc stuff

[[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && export PATH=$PATH:$HOME/.local/bin
[ -d ~/.gem/ruby/2.7.0/bin ] && export PATH=$PATH:~/.gem/ruby/2.7.0/bin

export _HANAVI_PLUG_PATH=${HOME}/.oh-my-zsh/custom/plugins/hanavi/plugs/

alias eb='vim $HOME/files/dotfiles/zsh/plugins/hanavi/hanavi.plugin.zsh $HOME/files/dotfiles/zsh/plugins/hanavi/plugs/*.zsh'
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

# custom sub-plugin stuff
for fn in ${_HANAVI_PLUG_PATH}/*.zsh; do
    source $fn
done

alias dh="du -hs"
alias m='mplayer'
alias dr='docker run --rm -it'

# dropbox
if [ -d ~/.dropbox-dist ]; then
    db() {
        if pgrep -f "dropbox" > /dev/null; then
            echo 'dropbox already running!'
        else
            echo "starting dropbox..."
            ~/.dropbox-dist/dropboxd &> /dev/null &
            disown
        fi
    }
fi

# redshift
if [ -x $HOME/scripts/run_redshift.sh ]; then
    rs() {
        if pgrep -f "redshift" > /dev/null; then
            echo 'redshift already running!'
        else
            echo "starting redshift"
            $HOME/scripts/run_redshift.sh &> /dev/null &
            disown
        fi
    }
fi

## Misc
alias tl='tmux ls'
alias ta='tmux attach'
alias kap="killall pinentry"

# Check for local running ssh systems
up() {
    nmap -n -oG - --open 192.168.1.0/24 -p 22 |grep Up | awk '{print $2}'
}

export EDITOR=vim
export FCEDIT=vim

