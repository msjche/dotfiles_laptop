#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

# Disable screen blanking
xset -dmps &
xset s noblank &
xset s off &

# Update X resources db
xrdb -merge ~/.Xresources &

# Run URxvt as a daemon
( ( sleep 1 && /usr/bin/urxvtd -q -f -o) & )

# Automount external drives
#( ( sleep 10 && /usr/bin/udiskie) & )

# Compton composite manager
#( ( sleep 2 && /usr/bin/compton -b) & )

# Music Player Daemon
#( ( sleep 10 && /usr/bin/mpd ) & )

# X Screensaver
#( ( sleep 10 && /usr/bin/xscreensaver -no-splash ) & )

# f.lux screen dimmer
#( ( sleep 5 && /usr/bin/xflux -z 94596 ) & )

# NetworkManager applet
#( ( sleep 2 && dbus-launch /usr/bin/nm-applet ) & )

# Dropbox
#( ( sleep 2 && /usr/bin/dropbox ) & )

# Copy/Paste sync
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# Pulseaudio
/usr/bin/start-pulseaudio-x11 &

# Add 2560x1440 resolution via xrandr
xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode eDP1 1920x1080_60.00
xrandr --output eDP1 --mode 1920x1080_60.00

# Awesome default session
session=${1:-ck-launch-session dbus-launch --sh-syntax --exit-with-session awesome}

case $session in
    kde ) exec startkde;;
     # No known session, try to run it as command
    *) exec $1;;
esac

#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session startkde
#exec awesome
