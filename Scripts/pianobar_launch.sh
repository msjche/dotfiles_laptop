#/bin/bash

urxvt -e ~/.config/pianobar/pianobar_headless.sh
pid=$!
sleep 3
kill ${pid}

