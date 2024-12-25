# Config editing stuff
shopt -s autocd
shopt -s nullglob

# This has to be set early...
[[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && export PATH=$PATH:$HOME/.local/bin

for fn in ~/.config/bash/*.bash; do
    source "$fn"
done

for fn in ~/.config/bash/local/*.bash; do
    source "$fn"
done

export EDITOR=vim
export FCEDIT=vim
