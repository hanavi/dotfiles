## Email

[[ -n "$_HANAVI_DEBUG" ]] && echo "loading email config"


alias mmutt="zless /usr/share/doc/mutt/manual.txt.gz"
alias rmutt='ssh -X -t email "env LC_ALL=C.UTF-8 MUTT_CONFIG=fetchmail /usr/bin/mutt"'
alias amutt='ssh -X -t email "env LC_ALL=C.UTF-8 MUTT_CONFIG=aol /usr/bin/mutt"'
alias mm='ssh -X -t pi6 "/usr/bin/mutt"'
alias rmm='ssh -X -t rpi6 "/usr/bin/mutt"'
