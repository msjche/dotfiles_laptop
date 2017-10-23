#!/usr/bin/env python2
# -*- coding: utf-8 -*-
 
#LICENSE: WTFPL
#DEPENDS: on this cool font from http://asdasd.rpg.fi/~svo/glasstty/
#TODO: port to Python3
 
from time import sleep
from sys import stdout
 
anim = ["|", "/", "-", "\\"]
while True:
    for c in anim:
        print "Loading (0 %)", c, "\r",
        stdout.flush()
        sleep(0.1)
