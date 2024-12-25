[[ -n "$_BASH_DEBUG" ]] && echo "loading ssh plugin"

## SSH
alias sa='ssh-add'

check-ssh-agent() {
    [[ -f ~/.ssh/agent ]] && . ~/.ssh/agent

    for pid in $(pgrep ssh-agent); do
        [[ $pid -eq $SSH_AGENT_PID ]] && return 0
    done
    return 1
}

start-ssh-agent() {

    check-ssh-agent && return 0
    echo "Starting ssh agent"
    ssh-agent | sed 's/^echo Agent/# &/' > ~/.ssh/agent
    check-ssh-agent && echo "Agent running" && return 0
    echo "Failed to start ssh agent"
    return 1
}

if command -v ssh-agent &>/dev/null && [[ ! -f ~/.ssh/noagent ]]; then
    start-ssh-agent
fi

# Only run this on my "thinkpad"
[[ ! "$(hostname)" = "thinkpad" ]] && return

alias hl='ssh homelocal'
alias hv1='ssh hv1'
alias hv2='ssh hv2'
alias pi7='ssh pi7'
