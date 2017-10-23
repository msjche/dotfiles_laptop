#!/bin/bash

rm ~/.config/awesome/freedesktop
rm ~/.config/awesome/lain
rm ~/.config/awesome/menugen
rm ~/.config/awesome/rc.lua
rm ~/.config/awesome/themes
rm ~/.config/awesome/wi.lua

ln -s ~/.config/awesome/PROFILES/Default/* ~/.config/awesome/

cp ~/Scripts/Theming/zenburn.Xresources ~/.Xresources

xrdb -merge ~/.Xresources

echo 'awesome.restart()' | awesome-client

sleep 5

notify-send "Welcome to MoJos Default config!"
