[ -n "$_BASH_DEBUG" ] && echo "loading ssh plugin"

## SSH
alias sa='ssh-add'

# Only run this on my "thinkpad"
[ ! "`hostname`" = "thinkpad" ] && return

alias hl='ssh homelocal'
alias hv1='ssh hv1'
alias hv2='ssh hv2'
alias pi7='ssh pi7'
