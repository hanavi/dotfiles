# config stuff

[[ -n "$_HANAVI_DEBUG" ]] && echo "loading config editing config"

alias eb="vim $HOME/files/dotfiles/zsh/plugins/hanavi/hanavi.plugin.zsh ${_HANAVI_PLUG_PATH}/*.zsh"
alias sb='exec zsh'

alias es='vim $HOME/.ssh/config'
alias et='vim $HOME/.tmux.conf'

export EDITOR=vim
export FCEDIT=vim
