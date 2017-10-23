#!/bin/bash

echo -n 'p' > /tmp/pianobar

file='/home/msjche/.config/pianobar/isplaying'
var=$(cat $file)

var=$((var==0))
echo $var > $file
