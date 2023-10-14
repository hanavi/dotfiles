## Python
alias pylab='ipython --pylab'

alias fpg='gpg-connect-agent updatestartuptty /bye'
alias kap="killall pinentry"

alias hv='sudo ~/.local/bin/homevpn'
alias vim='nvim'
alias v='nvim'

## Mounting
# alias ec='vim /usr/local/src/dwm/dwm-6.2/config.h'
alias src='cd /usr/local/src/'
alias notes='cd ${HOME}/Dropbox/Documents/notes'
alias food='cd ${HOME}/Dropbox/Documents/notes/food'
alias en='vim ${HOME}/Dropbox/Documents/notes/notes.tex'
alias tmp='cd ~/tmp'
alias ndir="cd ~/.config/nvim/"

alias ds="ps aux | grep -i dropbox |grep -v grep"
alias dr="ps aux | grep -i redshift |grep -v grep"

alias rs="$HOME/scripts/run_redshift.sh &; disown"

alias z="zathura"
alias px='pulsemixer'
alias bat='cat /sys/class/power_supply/BAT0/capacity'

alias todo="vim ~/Documents/todo.md"

## ls stuff
alias ll='ls -l'
alias la='ls -A'
alias l='ls -F'
alias lll='ls -alhF'
alias l.='ls -d .*'
alias lh='ls -alh'

## Logging
alias plog='~/scripts/log.sh'
alias mood='~/scripts/log.sh mood'
alias weight='~/scripts/log.sh weight'
alias alcohol='~/scripts/log.sh alcohol'
alias salad='~/scripts/log.sh salad'
alias carbs='~/scripts/log.sh carbs'
alias trumpet='~/scripts/log.sh trumpet'
alias violin='~/scripts/log.sh violin'

## SSH
# alias ssh='TERM=rxvt-256color ssh'
alias sa='ssh-agent bash'
alias saa='ssh-add'
alias hl='ssh homelocal'
alias hv1='ssh hv1'
alias hv2='ssh hv2'
alias hr='ssh homeremote'
alias em='ssh 10.0.0.77'
alias svnc='ssh -L 5901:localhost:5900'
alias weather='ssh homelocal -t "LC_ALL=C.UTF-8 ~/.local/bin/weather"'
alias wd='ssh homelocal -t "LC_ALL=C.UTF-8 ~/.local/bin/weather --daily"'
alias cw='curl -s wttr.in'

## Misc
alias cm='hl "./scripts/check_mail.sh" 2>/dev/null'
# alias wx='curl -s http://wttr.in/hsv'
alias tl='tmux ls'
alias ta='tmux attach'
alias nmd='xrandr --output eDP-1 --brightness .5; redshift -O 2000'
alias nmdl='xrandr --output eDP-1 --brightness .6; redshift -O 2500'
alias dmd='redshift -x'
alias topic='hl scripts/topic.sh'
alias mentions='hl scripts/mentions.sh'

alias c='ssh homelocal /home/james/.local/bin/crypto'
alias mm='ssh -X -t pi6 "/usr/bin/mutt"'
alias rmm='ssh -J homeremote -X -t pi6 "/usr/bin/mutt"'
alias kp='killall pinentry'

alias rmutt='ssh -X -t email "env LC_ALL=C.UTF-8 MUTT_CONFIG=fetchmail /usr/bin/mutt"'
alias rrmutt='ssh -X -t remail "env LC_ALL=C.UTF-8 MUTT_CONFIG=fetchmail /usr/bin/mutt"'
alias amutt='ssh -X -t email "env LC_ALL=C.UTF-8 MUTT_CONFIG=aol /usr/bin/mutt"'
# alias calcurse='ssh -X -t email "env LC_ALL=C.UTF-8 MUTT_CONFIG=aol /usr/bin/calcurse"'
alias gwi='$HOME/.local/bin/get_weather_image.py'
alias procmail="vim scp://email/.procmailrc"

## Email
alias mutt="MUTT_CONFIG=fetchmail /usr/bin/mutt"
alias gmutt="MUTT_CONFIG=gmail /usr/bin/mutt"
alias mmutt="zless /usr/share/doc/mutt/manual.txt.gz"

alias pp='source ~/.local/python/python3.9/bin/activate'

## This are old... should I keep them?
alias resume='cd ~/Dropbox/Documents/Professional/resume_latex'
alias ytlink='~/Dropbox/scripts/youtube/youtube_link.py'
alias tvim="tmux new-session \; split-window -l 10"

alias eb='vim $HOME/.bash_aliases'
alias sb='source $HOME/.bash_aliases'
alias es='vim $HOME/.ssh/config'
alias ev='vim $HOME/.config/nvim/init.lua'
alias et='vim $HOME/.tmux.conf'

# alias f='firefox https://www.facebook.com'
alias f='feh -.'
# alias h='firefox https://hangouts.google.com'
alias yt='firefox https://www.youtube.com'

alias we='curl wttr.in'
alias nb='newsboat'
alias kas="killall ssh"
alias pm='/home/james/.local/bin/pmode'

alias cm="ssh email ~/scripts/cmail.sh"
alias cf="hv2 sh -c '~/tmp/check_feeds.sh' | tee .cf"

today() {
    BASEPATH="${HOME}/Dropbox/Documents/notes/logging"
    TODAY=`date "+%Y%m%d"`
    JOURNAL_FILE=${HOME}/Dropbox/Documents/notes/logging/daily/${TODAY}.tex
    pushd "${BASEPATH}"
    vim "${JOURNAL_FILE}"
    popd
}
