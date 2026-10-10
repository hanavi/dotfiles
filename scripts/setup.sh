#!/usr/bin/env bash
# Last Updated: 2026-10-10

REPO_DIR="${HOME}/.local/dotfiles"

if [[ -t 2 ]]; then
    RESET='\033[0m'
    CYAN='\033[01;36m'
    GREEN='\033[01;32m'
    RED='\033[01;31m'
    # RED='\033[07;31m'
    YELLOW='\033[01;93m'
else
    RESET=''
    CYAN=''
    GREEN=''
    RED=''
    YELLOW=''
fi

timestamp() {
  date '+%Y-%m-%d %H:%M:%S'
}

debug() { printf "$(timestamp) ${CYAN}[DEBUG]${RESET} $*\n"     >&2; }
info()  { printf "$(timestamp) ${GREEN}[INFO]${RESET} $*\n"     >&2; }
warn()  { printf "$(timestamp) ${YELLOW}[WARNING]${RESET} $*\n" >&2; }
error() { printf "$(timestamp) ${RED}[ERROR]${RESET} $*\n"      >&2; }

setup-nvim() {
  info "configuring neovim"

  if [[ -e ~/.config/nvim ]]; then
    warn "~/.config/nvim already exists! Skipping..."
    return
  fi

  if ! command -v nvim &>/dev/null ; then
    warn "Neovim not found! Skipping..."
    return
  fi

  create-link nvim ~/.config/nvim
  # command -v nvim &>/dev/null && nvim -c "PlugInstall | q | q"
}

setup-vim() {
  info "configuring vim"

  if [[ -e ~/.vim ]]; then
    warn "~/.vim already exists! Skipping..."
    return
  fi

  create-link vim ~/.vim
  # vim -c "PlugInstall | q | q"
}

create-link() {

  local src="${REPO_DIR}/$1"
  local dst=$2

  if [[ -e "${dst}" ]]; then
    warn "Path ${dst} already exists! Skipping..."
    return
  else
    info "creating link ${dst}"
    ln -s "${src}" "${dst}"
  fi
}

setup-bash() {
  info "configuring bash"

  if ! grep -q bash_aliases ~/.bashrc &>/dev/null; then
    printf "[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases \n" >> ~/.bashrc
  fi

  if ! grep -q bashrc ~/.bash_profile &>/dev/null; then
    printf "[[ -f ~/.bashrc ]] && . ~/.bashrc \n" >> ~/.bash_profile
  fi

  create-link bash_aliases ~/.bash_aliases
  create-link bash ~/.config/bash
}

setup-zsh() {
  info "configuring zsh"

  if [[ ! -d ~/.oh-my-zsh/custom/plugins/ ]]; then
    warn "oh-my-zsh directory not found! Skipping"
    return
  fi

  create-link zsh/plugins/hanavi ~/.oh-my-zsh/custom/plugins/
  # error "zsh not configured!"
}

setup-directories() {
  info "Setting up directories"

  [[ ! -d ~/.local ]] && mkdir ~/.local
  [[ ! -d ~/.config ]] && mkdir ~/.config
  [[ ! -d ~/.local/bin ]] && mkdir -p ~/.local/bin

}

clone-repo() {

  if [[ -f ${REPO_DIR}/scripts/setup.sh ]]; then
    echo "dotfiles exists! skipping..."
    return 1
  fi

  git clone https://github.com/hanavi/dotfiles.git ${REPO_DIR}
}

setup-misc() {
  info "creating misc links"

  create-link inputrc ~/.inputrc
  create-link tmux.conf ~/.tmux.conf
  create-link gitconfig ~/.gitconfig
}

disable-sshagent-docker() {
  if [[ -f /.dockerenv ]]; then
    mkdir -p ~/.ssh &>/dev/null
    touch ~/.ssh/noagent
  fi
}

clone-repo
setup-directories
setup-bash
setup-zsh
setup-vim
setup-nvim
setup-misc
disable-sshagent-docker
