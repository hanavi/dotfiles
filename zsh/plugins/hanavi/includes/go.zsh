
[[ -n "$_HANAVI_DEBUG" ]] && echo "loading go config"

[[ ":$PATH:" != *":/usr/local/go/bin:"* ]] && export PATH=$PATH:/usr/local/go/bin
[[ ":$PATH:" != *":$HOME/go/bin:"* ]] && export PATH=$PATH:$HOME/go/bin
