#!/bin/bash
#
# Author: Jacer Omri
# Description:
# text to speech engine using google
 
## a function to encode urls
rawurlencode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
 
  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  echo "${encoded}"
}
 
if [ -z "$1" ]
  then
    echo "No text specified, exiting"
    exit
  else
    TEXT=$( rawurlencode "$1" )
fi
 
if [ -z "$2" ]
  then
    echo "No language supplied, using en"
    LANG="en"
  else
    LANG="$2"
fi
 
API="http://translate.google.com/translate_tts?ie=UTF-8&tl=$LANG&q=$TEXT"
hash="$(echo -n "$TEXT" | md5sum )"
UA="Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.2 Safari/537.36"
wget -o /dev/null --user-agent="$UA" -O "/tmp/$hash.mp3" "$API"
mpg123 -q "/tmp/$hash.mp3"
rm "/tmp/$hash.mp3"
