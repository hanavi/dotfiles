#!/bin/bash
# Author: James Casey
# Last Updated: 2024-11-07

# echo "[ WARNING ] Running in test mode"

create_link() {

    src=$1
    dst=$2

    if [ ! -e "${dst}" ]; then
        ln -s "${src}" "${dst}"
    else
        printf "skipping %s\n" "${dst}"
    fi
}

[[ -d ~/.config ]] || mkdir ~/.config
[[ -f ~/.bashrc ]] || printf '[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases\n' > ~/.bashrc
[[ -f ~/.bash_profile ]] || printf '[[ -f ~/.bashrc ]] && . ~/.bashrc\n' > ~/.bash_profile

create_link ~/files/dotfiles/bash_aliases ~/.bash_aliases
create_link ~/files/dotfiles/inputrc ~/.inputrc
create_link ~/files/dotfiles/tmux.conf ~/.tmux.conf
create_link ~/files/dotfiles/bash/ ~/.config/bash
create_link ~/files/dotfiles/vim ~/.vim
create_link ~/files/dotfiles/nvim ~/.config/nvim
