#!/bin/bash
pkill nm-applet &

sleep 3

#~/Scripts/start_HUD.sh &
nm-applet &
insync start &
#hp-systray &
/usr/bin/megasync &
/opt/dropbox/dropboxd &
redshift
