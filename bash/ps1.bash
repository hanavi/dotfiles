# Bash ps1

# Don't rerun if this has been set to avoid problems with conda
[ ! -z "_PS1_SET" ] && return

export _PS1_SET=1

LGREEN='\[\033[01;92m\]'
GREEN='\[\033[01;32m\]'
WHITE='\[\033[00m\]'
BLUE='\[\033[01;34m\]'
LBLUE='\[\033[01;94m\]'
CYAN='\[\033[01;36m\]'
LCYAN='\[\033[01;96m\]'
RED='\[\033[01;31m\]'
LMAGENTA='\[\033[01;95m\]'

PS1="${RED}[${CYAN}\h ${LGREEN}\w${RED}]${GREEN}\$ ${WHITE}"
