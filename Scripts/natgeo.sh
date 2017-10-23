#!/bin/bash  
 # Copyright (c) 2011 Josh Schreuder  
 # http://www.postteenageliving.com  
 #  
 # Permission is hereby granted, free of charge, to any person obtaining a copy  
 # of this software and associated documentation files (the "Software"), to deal  
 # in the Software without restriction, including without limitation the rights  
 # to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
 # copies of the Software, and to permit persons to whom the Software is  
 # furnished to do so, subject to the following conditions:  
 #  
 # The above copyright notice and this permission notice shall be included in  
 # all copies or substantial portions of the Software.  
 #  
 # THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
 # IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
 # FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE  
 # AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER  
 # LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  
 # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN  
 # THE SOFTWARE.  
 # ********************************  
 # *** OPTIONS  
 # ********************************  
 # Set this to 'yes' to save a description (to ~/description.txt) from ngeo page  
 GET_DESCRIPTION="yes"  
 # Set this to the directory you want pictures saved  
 PICTURES_DIR=~/Pictures  
 # ********************************  
 # *** FUNCTIONS  
 # ********************************  
 function get_page {  
   echo "Downloading page to find image"  
   wget http://photography.nationalgeographic.com/photography/photo-of-the-day/ --quiet -O- 2> /dev/null |  
   grep -m 1 http://images.nationalgeographic.com/.*.jpg -o > /tmp/pic_url  
 }  
 function clean_up {  
   # Clean up  
   echo "Cleaning up temporary files"  
   if [ -e "/tmp/pic_url" ]; then  
     rm /tmp/pic_url  
   fi  
 }  
 # ********************************  
 # *** MAIN  
 # ********************************  
 echo "===================="  
 echo "== NGEO Wallpaper =="  
 echo "===================="  
 # Set date  
 TODAY=$(date +'%Y%m%d')  
 # If we don't have the image already today  
 if [ ! -e ~/Pictures/${TODAY}_ngeo.jpg ]; then  
   echo "We don't have the picture saved, save it"  
   get_page  
   # Got the link to the image  
   PICURL=`/bin/cat /tmp/pic_url`  
   echo "Picture URL is: ${PICURL}"  
   echo "Downloading image"  
   wget --quiet $PICURL -O $PICTURES_DIR/${TODAY}_ngeo.jpg   
   feh $PICTURES_DIR/${TODAY}_ngeo.jpg
   # Else if we have it already, check if it's the most updated copy  
 else  
   get_page  
   # Got the link to the image  
   PICURL=`/bin/cat /tmp/pic_url`  
   echo "Picture URL is: ${PICURL}"  
   # Get the filesize  
   SITEFILESIZE=$(wget --spider $PICURL 2>&1 | grep Length | awk '{print $2}')  
   FILEFILESIZE=$(stat -c %s $PICTURES_DIR/${TODAY}_ngeo.jpg)  
   # If the picture has been updated  
   if [ $SITEFILESIZE != $FILEFILESIZE ]; then  
     echo "The picture has been updated, getting updated copy"  
     rm $PICTURES_DIR/${TODAY}_ngeo.jpg  
     # Got the link to the image  
     PICURL=`/bin/cat /tmp/pic_url`  
     echo "Downloading image"  
     wget --quiet $PICURL -O $PICTURES_DIR/${TODAY}_ngeo.jpg
     echo "Here it is: "
     feh $PICTURES_DIR/${TODAY}_ngeo.jpg
   # If the picture is the same  
   else  
     echo "Picture is the same, finishing up"
     echo "Here it is: "
     feh $PICTURES_DIR/${TODAY}_ngeo.jpg
   fi  
 fi  
 clean_up
