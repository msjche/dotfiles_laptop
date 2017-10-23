#!/bin/bash

cd ~/Downloads/YouTube
echo "youtube-dl helper"
echo "================="
echo -n "video to download: "
read video
echo "getting video filename..."
filename=$(youtube-dl --get-filename -o "%(title)s.%(ext)s" $video)
echo "getting available video formats..."
youtube-dl -F $video
echo "file to download is '"$filename"'..."
echo -n "video format: "
read format
echo "downloading video..."
youtube-dl -v -f $format -o "%(title)s.%(ext)s" $video
echo "download complete."
mplayer ~/Downloads/Youtube/"%(title)s.%(ext)s"
