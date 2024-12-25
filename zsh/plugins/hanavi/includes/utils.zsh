# misc utils...

[[ -n "$_HANAVI_DEBUG" ]] && echo "loading utils config"

# Check for local running ssh systems
up() {
    local network=$1
    if [[ -z "$network" ]]; then
        network="192.168.1.0/24"
    fi
    nmap -n -oG - --open "$network" -p 22 | grep Up | awk '{print $2}'
}

# dropbox
if [[ -d ~/.dropbox-dist ]]; then
    db() {
        if pgrep -f "dropbox" > /dev/null; then
            echo 'dropbox already running!'
        else
            echo "starting dropbox..."
            ~/.dropbox-dist/dropboxd &> /dev/null &
            disown
        fi
    }
fi

# redshift
if [[ -x $HOME/scripts/run_redshift.sh ]]; then
    rs() {
        if pgrep -f "redshift" > /dev/null; then
            echo 'redshift already running!'
        else
            echo "starting redshift"
            $HOME/scripts/run_redshift.sh &> /dev/null &
            disown
        fi
    }
fi
