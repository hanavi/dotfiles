#!/bin/bash
# Author: James Casey
# Last Updated: 2024-10-22

echo "[ WARNING ] Running in test mode"

create_link() {

    src=$1
    dst=$2

    if [ ! -e "${dst}" ]; then
        echo ln -s "${src}" "${dst}"
    else
        printf "skipping %s\n" "${dst}"
    fi
}

create_link ~/files/dotfiles/bash_aliases ~/.bash_aliases
create_link ~/files/dotfiles/inputrc ~/.inputrc
create_link ~/files/dotfiles/tmux.conf ~/.tmux.conf
create_link ~/files/dotfiles/bash/ ~/.config/bash
create_link ~/files/dotfiles/vim ~/.vim
create_link ~/files/dotfiles/nvim ~/.config/nvim
