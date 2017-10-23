#!/bin/sh

# Check Official Packages
checkupdates > /tmp/off.updates

# Check AUR Packages
wget -O /tmp/aur.rss https://aur.archlinux.org/rss/

grep "$(packer-color -Qm)" /tmp/aur.rss > /tmp/rss.check

grep "<title>$(packer-color -Qm)</title>" /tmp/rss.check > /tmp/aur.updates
