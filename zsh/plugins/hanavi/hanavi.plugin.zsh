# Init and misc stuff
# export _HANAVI_DEBUG=1

[[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && export PATH=$PATH:$HOME/.local/bin

# export _HANAVI_PLUG_PATH=${HOME}/.oh-my-zsh/custom/plugins/hanavi/includes/
export _HANAVI_PLUG_PATH=${0:a:h}/includes

# custom sub-plugin stuff
for fn in ${_HANAVI_PLUG_PATH}/*.zsh; do
    source $fn
done

