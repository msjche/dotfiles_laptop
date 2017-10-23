#!/bin/bash

file="/sys/class/backlight/intel_backlight/brightness"
level=$(cat $file)
echo $(( level - 200)) > $file
