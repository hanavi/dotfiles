# SSH

[[ -n "$_HANAVI_DEBUG" ]] && echo "loading ssh config"

alias sa='ssh-add'
alias hl='ssh homelocal'
alias hv1='ssh hv1'
alias hv2='ssh hv2'
alias pi7='ssh pi7'

fu() {
    if [[ -z "$(mount |grep $HOME/mnt)" ]]; then
        echo mounting
        sshfs pi6:/media/james ~/mnt
    else
        echo un-mounting
        fusermount -u $HOME/mnt
    fi
}
