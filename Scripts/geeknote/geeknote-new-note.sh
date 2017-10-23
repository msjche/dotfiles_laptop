#!/bin/bash

echo -n "Title: "
read title

echo -n "Content: "
read content

echo -n "Notebook: "
read notebook

echo -n "Tags: "
read tags

python2 ~/Git/geeknote/geeknote.py create --title "$title" --content "$content" --notebook "$notebook" --tags "$tags"
