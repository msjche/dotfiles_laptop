#!/bin/bash

rm ~/.config/awesome/freedesktop
rm ~/.config/awesome/rc.lua
rm ~/.config/awesome/themes
rm ~/.config/awesome/vicious
rm ~/.config/awesome/wallpapers
rm ~/.config/awesome/wi.lua
rm ~/.config/awesome/widgets

ln -s ~/.config/awesome/PROFILES/msjche/* ~/.config/awesome/

cp ~/Scripts/Theming/msjche.Xresources ~/.Xresources

xrdb -merge ~/.Xresources

echo 'awesome.restart()' | awesome-client

sleep 5

notify-send "Welcome to MoJos msjche config!"
