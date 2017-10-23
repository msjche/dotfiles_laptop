## Index ##
-----------
1. Conky
2. Install
3. Weather Forecast
4. Update Checker
5. MPD Cover / OSD
6. Start Conky
7. Color Schemes



## 1. Conky ##
-----------------------------------------------------------------------------
For this theme you NEED conky >=1.7.2 compiled with:
	--enable-imlib2 \
	--enable-lua \
	--enable-lua-cairo \
	--enable-lua-imlib2 \
	--enable-nvidia \
	--enable-mpd

You can check with "conky -v" in a terminal if your conky has the needed features:

 Music detection:
  * MPD

 General:
  * nvidia
  * Imlib2
  * Lua

  Lua bindings:
   * Cairo
   * Imlib2

How to compile conky from source: http://conky.sourceforge.net/documentation.html
Arch users can use this PKGBUILD: http://aur.archlinux.org/packages.php?ID=31589 (add --enable-nvidia)
-----------------------------------------------------------------------------




## 2. Install ##
-----------------------------------------------------------------------------
Extract the conky_NightDrive.tar in you home directory.
Go to: /home/YourUser/.conky/NightDrive/	--> .conky is a hidden directory so you probably need to press strg+h to see it

Install the font for the clock:
cp ~/.conky/NightDrive/font/Digital\ Readout\ Thick\ Upright.ttf ~/.fonts/
If the ".fonts" folder in your home dir doesn't exists you can just create it.
After that run: fc-cache

About the font: http://www.1001fonts.com/font_details.html?font_id=1232

If you don't want to put the theme files in ~/.conky/NightDrive/ you need to change the paths in the conkyrc
-----------------------------------------------------------------------------




## 3. Weather Forecast ##
-----------------------------------------------------------------------------
Install the Conky Weather Forecast Python Script: http://ubuntuforums.org/showthread.php?t=869328
PKGBUILD: http://aur.archlinux.org/packages.php?ID=32211

After the installation run:
cp /usr/share/conkyforecast/conkyForecast.config ~/.conkyForecast.config

Then open the conkyrc in an editor (~/.conky/NightDrive/conkyrc) and replace "--location=GMXX0270" in line 103 with your location.
-----------------------------------------------------------------------------




## 4. Update Checker ##
-----------------------------------------------------------------------------
Create (as root) a file like "/etc/cron.hourly/sync.sh"
Depending on your distro put this in the file:

	Arch Linux:
	pacman -Sy > /dev/null

	Debian/Ubuntu:
	apt-get -qy update > /dev/null
	
Then execute: chmod a+x /etc/cron.hourly/sync.sh

This way you get a fresh package list every hour.
For Debian/Ubuntu: Replace "${execi 600 pacman -Qu | wc -l}" in line 119 of the conkyrc with "${execi 600 aptitude search "~U" | wc -l}"

Other distros: I dunno :P --> drop me a note then I'll edit the info for other distros
-----------------------------------------------------------------------------




## 5. MPD Cover / OSD ##
-----------------------------------------------------------------------------
Install: python-mpd - Python MPD client library http://pypi.python.org/pypi/python-mpd/ (should be directly available for most distros)
Open "~/.conky/NightDrive/scripts/mpd_infos.py" in an editor.
Set your MPD music directory in line 12.

If you want a sexy osd for mpd on song and state change set "notify_osd = True" in the mpd_infos.py (line 13) and choose an icon as default cover (line 15).
For the osd you need to install: notify-osd
Preview of the osd (lower screenshot, upper right corner): http://sen7.deviantart.com/art/Screenshot-2010-01-22-151263206
-----------------------------------------------------------------------------




## 6. Start Conky ##
-----------------------------------------------------------------------------
Start conky via the "start_conky.sh" in "~/.conky/NightDrive/".
This way the python script for the mpd cover/osd will always start with conky.
(you can put it in your autostart or .xinitrc or whatever)
-----------------------------------------------------------------------------




## 7. Color Schemes ##
-----------------------------------------------------------------------------
Open the conkyrc and go to line ~43. There you can see the sections for the color schemes.
Simply comment out the one you don't want (green is active by default) and remove the comments for the one that you want.

Now go to ~/.conky/NightDrive/images/icons/
You can see different subfolders for every color scheme. Copy the icons inside the folder with the color you want to ~/.conky/NightDrive/images/icons/ and replace them.
-----------------------------------------------------------------------------
