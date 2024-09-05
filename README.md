# Dotfiles

## bash

```
ln -s ~/files/dotfiles/bash/bash_aliases ~/.bash_aliases
ln -s ~/files/dotfiles/bash/inputrc ~/.inputrc
ln -s ~/files/dotfiles/bash/ps1.env ~/.ps1.env
```

## tmux

```
ln -s ~/files/dotfiles/tmux.conf ~/.tmux.conf
```

## vim/nvim

```
ln -s ~/files/dotfiles/vim ~/.vim
ln -s ~/files/dotfiles/nvim ~/.config/nvim
```

## batcat

```
$ sudo apt install bat
```

## fzf
https://github.com/junegunn/fzf/releases

```
$ fzf --bash > ~/.fzf.bash
```

## neovim


```
$ mkdir -p ~/.local/bin
$ wget https://github.com/neovim/neovim/releases/download/v0.10.1/nvim.appimage -O ~/.local/bin/nvim
$ chmod +x ~/.local/bin/nvim
```

This is apparently need right now until I can get the powerline fonts running
in WSL

```
$ printf "\nexport DISABLE_POWERLINE_FONTS=1\n" >> ~/.bashrc
```


## python (ubuntu 22)

```
$ sudo apt install python-is-python3
$ sudo apt install python-pip3
$ sudo apt install python3.10-venv
$ mkdir -p ~/.local/python
$ python -m venv ~/.local/python/nvim
$ source ~/.local/python/nvim/bin/activate
$ pip install pynvim black ruff pylint mypy
```

## Windows

Remap caps lock to ctrl.  Run this in powershell as admin and reboot.

```
$hexified = "00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00".Split(',') | % { "0x$_"};
$kbLayout = 'HKLM:\System\CurrentControlSet\Control\Keyboard Layout';
New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified);
```

