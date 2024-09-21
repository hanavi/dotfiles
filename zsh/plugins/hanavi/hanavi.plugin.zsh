# Config editing stuff
[[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && export PATH=$PATH:$HOME/.local/bin

alias eb='vim $HOME/files/dotfiles/zsh/plugins/hanavi/hanavi.plugin.zsh'
alias sb='exec zsh'

alias es='vim $HOME/.ssh/config'
alias et='vim $HOME/.tmux.conf'

alias aps='apt search'
alias api='sudo apt install'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

command -v batcat &> /dev/null && alias cat='batcat'
command -v exa &> /dev/null && alias ls='exa'
command -v feh &> /dev/null && alias f='feh -.'
command -v zathura &> /dev/null && alias z='zathura'

if command -v nvim &> /dev/null; then
    alias vim='nvim'
    alias v='nvim'
    alias vd='nvim -d'
    alias ev='vim $HOME/.config/nvim/lua/hanavi/init.lua'
    alias vv='/usr/bin/vim'
else
    alias v='vim'
    alias vd='vimdiff'
    alias ev='vim $HOME/.vim/vimrc'
fi

function ipy {
    [ "$CONDA_DEFAULT_ENV" = "base" ] && conda deactivate && conda activate working
    ipython "$@"
}

alias dh="du -hs"
alias m='mplayer'
alias dr='docker run --rm -it'

# Conda
caw() {
    conda deactivate
    conda activate working
}
alias ci='conda install'
alias ca='conda activate'

# Moving around
[ -d /usr/local/src ] && alias src='cd /usr/local/src/'

if [ -d ~/.config/nvim/lua/hanavi ]; then
    alias ndir="cd ~/.config/nvim/lua/hanavi"
else
    alias ndir="cd ~/.vim/"
fi

alias tmp='cd ~/tmp'
alias dfd='cd ~/files/dotfiles/'

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

## ls stuff
alias ll='ls -l'
alias la='ls -A'
alias l='ls -F'
alias lll='ls -alhF'
alias l.='ls -d .*'
alias lh='ls -alh'

## SSH
alias sa='ssh-add'
alias hl='ssh homelocal'
alias hv1='ssh hv1'
alias hv2='ssh hv2'
alias pi7='ssh pi7'

## Misc
alias tl='tmux ls'
alias ta='tmux attach'
alias kap="killall pinentry"

## Email
alias mmutt="zless /usr/share/doc/mutt/manual.txt.gz"
alias rmutt='ssh -X -t email "env LC_ALL=C.UTF-8 MUTT_CONFIG=fetchmail /usr/bin/mutt"'
alias amutt='ssh -X -t email "env LC_ALL=C.UTF-8 MUTT_CONFIG=aol /usr/bin/mutt"'
alias mm='ssh -X -t pi6 "/usr/bin/mutt"'

# webbrowser stuff
alias web="python -m webbrowser"
alias gnews='firefox --private-window -- http://news.google.com'
alias gmail='python -m webbrowser gmail.com'
alias xkcd='python -m webbrowser xkcd.com'

# Check for local running ssh systems
up() {
    nmap -n -oG - --open 192.168.1.0/24 -p 22 |grep Up | awk '{print $2}'
}

# reset yubikey encryption when using a different key
resetcard() {
    rm -r ~/.gnupg/private-keys-v1.d
    gpgconf --kill gpg-agent
    gpg --card-status
}

# Load yubikey
function lg
{

read -d '' DATA << __EOF__

-----BEGIN PGP MESSAGE-----
Comment: GPGTools - https://gpgtools.org

hQIMA33dgLuA5dX+AQ//eQq+/Mt33EtvY+i+ne6lQdEjRs4xtNDDb6gz6b4DThoB
a3JKM2EtBoRSpe6s1/t2vbJA1oqbYmGrbPfjR+rCY2gN/sBJ/0XxYGs9rHarwtqD
89TVMYPefmB3U3fW6tNyuXrzZP4z8KkjmUGAXQtF2lR2jqo+FaZjbiD7x44C92KR
AVaAvGuRQqrABN1RTkDnHwOuERHrHiQwOL0V0k8UlqyQ/R75yhH4lHPr+YoWiGVo
+PeMK6Sj6+EoshlL0HnrAB67qrbzYGP9ra2rJKtDRz0+JV5MP3N/2VOYA+dRt8Q/
c1/luPgmpGbLIJAvEGT02xpb8UCgoucEHdmDU/psBIZr5eB8Ztxz1oUEupmm4QNN
EkxadzqLXVnILWdie3g2lzTgT7lRhJlWd8gVsO/bOM3kbiU+WzPHSUeBPdGaBf4m
feifjG8VM5fW9KRLEFTITTo3V4PUxOYVL/Imw29UPpFtH/UEknFiPCBa/8C167gj
ppXm35g18IncZ9V/V0dgMbe+Y46+aU7hKAM8rxl1KWv9uFR5ZTcQ8+1O9Qk9HbfN
d6igpmzLqq9f5V4v9ZnkmCH9HmODDtiry4jU9fVu2zT28SRm2kpwqh7gfwLMCnLa
poD8SX8dVKKkOxVCrJYBdS+8JFoCrxIsqIBLc7Nmwik1DQ/jNejxUBthvyGMX+nS
SgF5S+kIS52oEBTkyoWdBav6X5OzPP/AFBO0vzRxW7Rn/CswENDK3WcSke0076Js
i/y6aXbYatU7HgtfXsq77mTTLrMgu5iLrb6L
=Vyo3
-----END PGP MESSAGE-----

__EOF__

gpg --card-status >/dev/null
gpg -d <(echo $DATA) 2> /dev/null

}

function fu {
    if [ -z "$(mount |grep $HOME/mnt)" ]
    then
        echo mounting
        sshfs pi6:/media/james ~/mnt
    else
        echo un-mounting
        fusermount -u $HOME/mnt
    fi
}

# GPG stuff
GPG_TTY=$(tty)
export GPG_TTY

gpg-connect-agent updatestartuptty /bye >/dev/null
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# # python
# if [ -f ~/.local/python/python3.11/bin/activate ]; then
#     export VIRTUAL_ENV_DISABLE_PROMPT=1
#     . ~/.local/python/python3.11/bin/activate
# fi

[ -d ~/.gem/ruby/2.7.0/bin ] && export PATH=$PATH:~/.gem/ruby/2.7.0/bin

export EDITOR=vim
export FCEDITOR=vim
