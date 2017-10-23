#!/bin/sh

conky -c ~/.conky/NightDrive/conkyrc &
python2 ~/.conky/NightDrive/scripts/mpd_infos.py
