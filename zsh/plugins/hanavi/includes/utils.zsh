# misc utils...

[ -n "$_HANAVI_DEBUG" ] && echo "loading utils config"

# Check for local running ssh systems
up() {
    nmap -n -oG - --open 192.168.1.0/24 -p 22 |grep Up | awk '{print $2}'
}

# dropbox
if [ -d ~/.dropbox-dist ]; then
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
if [ -x $HOME/scripts/run_redshift.sh ]; then
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
