#!/bin/bash
# Last Updated: 2024-11-08

set -eo pipefail

if ! grep -q bash_aliases ~/.bashrc &>/dev/null; then
  printf "[ -f ~/.bash_aliases ] && . ~/.bash_aliases ]\n" >> ~/.bashrc
fi

if ! grep -q bashrc ~/.bash_profile &>/dev/null; then
  printf "[ -f ~/.bashrc ] && . ~/.bashrc ]\n" >> ~/.bash_profile
fi

[[ ! -d ~/files ]] && mkdir ~/files
[[ ! -d ~/.config ]] && mkdir ~/.config
[[ ! -d ~/.local/bin ]] && mkdir -p ~/.local/bin

ln -s ~/files/dotfiles/bash_aliases ~/.bash_aliases
ln -s ~/files/dotfiles/bash ~/.config/bash
ln -s ~/files/dotfiles/inputrc ~/.inputrc
ln -s ~/files/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/files/dotfiles/vim ~/.vim
ln -s ~/files/dotfiles/nvim ~/.config/nvim

vim -c "PlugInstall | q | q"
command -v nvim &>/dev/null && nvim -c "PlugInstall | q | q"
