#scratch# Oh-My-Zsh
ZSH=/home/msjche/.oh-my-zsh
#ZSH_THEME="powerline"    #kardan agnoster af-magic bira clean candy gentoo terminalparty
ZSH_THEME="agnoster"    #bullet-train gnzh kardan agnoster af-magic bira clean candy gentoo terminalparty

#POWERLINE_RIGHT_A="date"
#POWERLINE_RIGHT_A="exit-status"
#POWERLINE_FULL_CURRENT_PATH="true"
#POWERLINE_SHOW_GIT_ON_RIGHT="true"
#POWERLINE_DATE_FORMAT="%D{%d-%m}"
#POWERLINE_HIDE_HOST_NAME="true"
#POWERLINE_DETECT_SSH="true"
#POWERLINE_GIT_CLEAN="✔"
#POWERLINE_GIT_DIRTY="✘"
#POWERLINE_GIT_ADDED="%F{green}✚%F{black}"
#POWERLINE_GIT_MODIFIED="%F{blue}✹%F{black}"
#POWERLINE_GIT_DELETED="%F{red}✖%F{black}"
#POWERLINE_GIT_UNTRACKED="%F{cyan}✭%F{black}"
#POWERLINE_GIT_RENAMED="➜"
#POWERLINE_GIT_UNMERGED="═"
#POWERLINE_RIGHT_A_COLOR_FRONT="black"
#POWERLINE_RIGHT_A_COLOR_BACK="red"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Default Programs
#export NMON=cmknt
export EDITOR="vim"
export PAGER="less"
export BROWSER="qutebrowser"
export BROWSERCLI="w3m"
export MOVPLAY="mpv"
export PICVIEW="feh"
export SNDPLAY="mpv"
export TERMINAL="uxterm"
export PULSE_LATENCY_MSEC=60
export TERM="xterm-256color"

# File Extensions
for ext in html org php com net no;    do alias -s $ext=$BROWSER; done
for ext in txt tex py PKGBUILD;        do alias -s $ext=$EDITOR; done
for ext in png jpg gif;            do alias -s $ext=$PICVIEW; done
for ext in mpg wmv avi mkv;        do alias -s $ext=$MOVPLAY; done
for ext in wav mp3 ogg;            do alias -s $ext=$SNDPLAY; done

########################################################
######################## ALIASES ####################### 
########################################################

# Nvidia
alias Nvidia-Settings='optirun -b none nvidia-settings -c :8'
alias Nvidia-Check='lspci -k | grep -A 2 -E "(VGA|3D)"'

# System
alias Shutdown='sudo shutdown -P now'
alias Suspend='sudo pm-suspend'
#alias Suspend='sudo systemctl suspend'
alias Hibernate='hibernate'		#uses sys-power/hibernate-script
alias Stat='uname -a;systemd-analyze time;wc -l /lib/modules/$(uname -r)/modules.order;lsinitcpio -a /boot/initramfs-linux.img'
#alias laptop-mode='grep -r '^\(CONTROL\|ENABLE\)_' /etc/laptop-mode/conf.d'
alias keys='xev'
alias unblock-wireless='rfkill unblock all && ifconfig set wlp6s0 up'
alias toggle-wifi='sudo ifconfig wlp6s0 down && sudo ifconfig wlp6s0 up'
alias audit='lynis --auditor MoJo'
alias Minimal='~/Scripts/minimal.sh'

# Mount Encrypted Drives Manually
alias OpenData='sudo cryptsetup --type luks open /dev/sdb1 datalv'
alias MountData='sudo mount /dev/mapper/datavg-data /media/Data'

# Systemd
# check for errors: sudo systemctl --failed
# check for errors in log files: sudo journalctl -p 3 -xb

# Weather
alias Weather='wego'
alias Redding='wego 4 redding'

# Git
alias cdG='cd ~/Git/dotfiles'
alias GitStatus='git status -u no'
alias GitCommit='git commit -m'

# Configs
alias Config='cd ~/.config'
alias Background='~/.config/awesome/themes/msjche/wall.jpg'

# GPG
alias Keys='gpg --recv-keys'

# Fonts
alias Fonts='fc-cache -vf ~/.fonts'
alias font-check='echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"'

# Backupp
alias Backup-local='sudo /home/msjche/Scripts/laptop_backup_local.sh'

# SSH
alias Anarchia='ssh msjche@192.168.1.9'
alias Anarchia='ssh -X msjche@192.168.1.9'
alias L-get='echo "/path/to/host/file ~/path/to/destination" && scp msjche@192.168.1.7:'

## Stress test
alias Stress='systester-cli -gausslg 64M -threads 4'

## DEs
alias Cinnamon='sudo /home/msjche/Scripts/cinnamon.sh'
alias Awesome='sudo /home/msjche/Scripts/awesome.sh'

## Flash iso to usb drive
#dd bs=4M if=/path/to/archlinux.iso of=/dev/sdb status=progress && sync

## Fun
alias aquarium='asciiquarium'

## Conky
# Awesome conky
alias cdC='cd ~/.config/awesome/conky'
alias eC='cd ~/.config/awesome/conky && vim conkyrc'
#alias eC='vim ~/.conkyrc'
#alias cdC='cd ~/.conky/HUD'
alias HUD='~/Scripts/start_HUD.sh'
alias SafeConky='~/Scripts/safe_conky.sh'
alias DangerConky='~/Scripts/danger_conky.sh'

## Bitcoin
alias bc='btc'

## Games
alias BBS-off='sudo modprobe bbswitch load_state=0 unload-state=1'
alias cdX='cd ~/.local/share/feral-interactive/XCOM2/VFS/Local/my\ games/XCOM2/XComGame/Config/'
alias cdX2='cd ~/.local/share/Steam/steamapps/common/XCOM\ 2/share/data/xcomgame'
alias xcom2='cd ~/Dropbox/XCOM/Saves/XCOM2 && cp ~/.local/share/feral-interactive/XCOM2/VFS/Local/my\ games/XCOM2/XComGame/SaveData/* .'
alias X2-restore='cp ~/Dropbox/XCOM/Saves/XCOM2/* ~/.local/share/feral-interactive/XCOM2/VFS/Local/my\ games/XCOM2/XComGame/SaveData/'
alias xcom='cd ~/Dropbox/XCOM/Saves/XCOMEW && cp ~/.local/share/feral-interactive/XCOM/XEW/savedata/* .'
alias Steam='LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib32/opengl/nvidia/lib" steam'
alias sudoku='nsudoku'
alias tetris='bastet'
alias mario='mupen64plus --windowed ~/ROMs/N64/SuperMario64.v64'
alias kart='mupen64plus --windowed ~/ROMs/N64/MarioKart64.v64'
alias zelda='mupen64plus --windowed ~/ROMs/N64/Zelda64.v64'
alias zeldamajora='mupen64plus --windowed ~/ROMs/N64/ZeldaMajorasMask.z64'
alias ps2='pcsx2'

## Packages
alias extract='dtrx'
alias gz='tar -xzf'
alias xz='tar -xJf'
alias bz='tar -xvjf'
alias bz2='tar -jxvf'

## wgetpaste
# sudo wgetpaste -c 'cat /var/tmp/portage/media-sound/clementineXXXX/temp/build.log'
# then paste url provided

## Gentoo
alias HowLong='genlop -t'
alias OneShot='emerge --oneshot portage'
alias Rebuild='revdep-rebuild -v'
alias Sync='time emerge --sync'
alias S='emerge -s'
alias I='time emerge -av'
alias Uworld='time emerge --ask --verbose --update --newuse --deep @world'
alias Uworld-bdeps='time emerge --ask --newuse --update --deep --with-bdeps=y --keep-going @world'
alias Esync='eix-sync'
alias Eupdate='eix --update'
alias cdP='cd /etc/portage && sudo su'
alias cdU='cd /etc/portage/package.use && sudo su'
alias cdM='cd /etc/portage/package.mask && sudo su'
alias cdK='cd /etc/portage/package.accept_keywords && sudo su'
alias eM='sudo vim /etc/portage/make.conf'
## Portage
alias G='sudo watch genlop -unc'
alias F='sudo tail -f /var/log/emerge-fetch.log'
alias E='sudo tail -f /var/log/emerge.log'

## Manjaro
alias Man-mirrors='sudo pacman-mirrors -g && sudo pacman -Syy'

## Arch
alias UU='packer -Syyu && rm /tmp/off.updates && rm /tmp/aur.updates'
alias Cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias Optimize='sudo pacman-optimize'
alias Reflector='sudo reflector -c "United States" -f 12 -l 12 --verbose --save /etc/pacman.d/mirrorlist'
#alias UU='packer -Syyu'
alias UUA='yaourt -Syyua --devel'
alias P='packer --noconfirm'
alias PI='packer -S --noconfirm'
alias Y='yaourt'
alias YY='yaourt-gui'
alias pac='sudo pacman -S'
alias pac-r='sudo pacman -R'
alias Log='tail -f /var/log/pacman.log'
alias Unlock='sudo rm /var/lib/pacman/db.lck'

## Awesome 
alias eA='cd ~/.config/awesome && vim rc.lua'
alias eW='cd ~/.config/awesome && vim wi.lua'
alias eT='cd ~/.config/awesome/themes/msjche && vim theme.lua' 
alias cdA='cd ~/.config/awesome'
alias cdD='cd ~/.config/awesome/PROFILES/Default'
#alias cdM='cd ~/.config/awesome/PROFILES/msjche'
alias cdT='cd ~/.config/awesome/themes/msjche'
alias BG='~/Scripts/background.sh'

## Theming
alias Msjche='~/Scripts/Theming/msjche.sh'
alias Default='~/Scripts/Theming/default.sh'
alias 1080='/home/msjche/Scripts/Theming/1080.sh'
alias 1440='/home/msjche/Scripts/Theming/1440.sh'

## Tmux
alias TM='~/.tmuxgo'
alias eTM='vim ~/.tmux.conf'

## Geeknote
alias geek-new='~/Scripts/geeknote/geeknote-new-note.sh'

## Directories
alias space='ncdu'
alias space-color='cdu'
alias ll='ls -l'
alias la='ls -ltra'
alias l='ls'
alias C='clear'
alias se='sudo vim'
alias e='vim'
alias home='cd ~'
alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'
alias .....='cd .....'
alias k='exit'
alias te='trash-empty'
alias tl='trash-list'
alias del='trash-put'
alias tr='trash-rm'
alias lsTrash='ls ~/.local/share/Trash/files/'
alias cdTrash='cd ~/.local/share/Trash/files/'
alias lD='ls ~/Downloads'
alias D='cd ~/Downloads'

## YouTube
alias cdYT='cd ~/Downloads/YouTube'
alias yt='mpsyt'
alias cleanYT='rm ~/Downloads/YouTube/*.*'
#alias DL='~/Scripts/ytdl-helper.sh'
alias DL='cd ~/Downloads/YouTube && youtube-dl'

## X Resources Stuff
alias eX='vim ~/.Xresources'
alias XTR='xrdb -merge ~/.Xresources'

## Zsh Stuff
alias eZ='vim ~/.zshrc'
alias eOMZ='vim ~/.oh-my-zsh/themes/msjche.zsh-theme'
alias Z='source ~/.zshrc'

## Vim Stuff
alias eV='vim ~/.vimrc'
alias e='vim'

## Rip CDs
alias CDinfo='cdparanoia -vsQ'
alias rip='cdparanoia -B'
alias mp3='for t in track{01-14}*.wav; do lame -b 320 $t; done'

## Scripts
alias cdS='cd ~/Scripts'
alias colordump='~/Scripts/colordump.sh'
alias activate='chmod 755'
alias top100='/home/msjche/Scripts/top100.sh'
alias time_international='/home/msjche/Scripts/time_international.sh'
alias natgeo='/home/msjche/Scripts/natgeo.sh'
alias ballz='python /home/msjche/Scripts/Games/Ballz.py'
alias tpbs='clear && figlet -c TPB Search && ~/Scripts/tpb.sh'
alias convertMTS='~/Scripts/convertMTS.sh'
alias convertOGV='mencoder out.ogv -ovc lavc -oac mp3lame -o screencast.avi'

alias compressMKV='ffmpeg -i input.mkv -c:v libx264 $1'

## Transmission
alias IP-update='~/Scripts/blocklist.sh'
alias tsm-check='qutebrowser http://localhost:9091/transmission/web'
alias t='transmission-daemon && transmission-remote-cli'
alias kT='killall transmission-daemon'

## News and Music
alias MP='ncmpcpp'
alias MO='mocp -T transparent-background'
alias news='newsbeuter'
alias pods='cd ~/Podcasts && podbeuter'
alias Xcom='cortex xcom2'
alias War='cortex warriors game'
alias nix='cortex linux'
alias Redd='rtv'
alias twit='~/Git/rainbowstream/venv/bin/rainbowstream --image-on-term'
alias Pods='cd ~/Podcasts && ranger'
alias music='sh ~/Scripts/music.sh & '

## Multimedia
#alias irc='cp ~/.weechat/irc.conf.bak ~/.weechat/irc.conf && weechat-curses'
alias irc='weechat-curses'
alias M='mpv'
alias Vids='cd ~/Downloads/.blackbox && ranger'

## Google Calenar
alias gcal-week='gcalcli --width 12 calw'
alias gcal='gcalcli --width 12 calm'
alias gcal-add='gcalcli quick'
alias gcal-agenda='gcalcli agenda'

## Peer Guardian
alias pgl-update='pglcmd update'
alias pgl-start='pglcmd restart'
alias pgl-status='pglcmd status'
alias pgl-dump='pglcmd stats'
alias pgl-test='pglcmd test'
alias pgl-stop='pglcmd stop'

## w3m
alias web='cd ~/Podcasts && w3m -cookie www.google.com'

## Check Screencast
alias FF-check-raw='mpv ~/Screencasts/screencast.mkv'
alias FF-check-final='mpv ~/Screencasts/screencast.mp4'
# Bottom Left
#alias FF-cam='mplayer -cache 128 -tv driver=v4l2:width=700:height=393 -vo xv tv:// -noborder -geometry "2%:95%" -ontop'
# Top Right
#alias FF-cam='mplayer -cache 128 -tv driver=v4l2:width=623:height=350 -vo xv tv:// -noborder -geometry "98%:5%" -ontop'
# Bottom Right
#alias FF-cam='mplayer -cache 128 -tv driver=v4l2:width=467:height=262 -vo xv tv:// -noborder -geometry "99%:96%" -ontop'
alias FF-cam='mplayer -cache 256 -tv driver=v4l2:width=320:height=240 -vo xv tv:// -noborder -geometry "100%:60%" -ontop'


## Net
alias googs='googler $1'
alias NM='sudo /etc/init.d/NetworkManager restart'
alias WW='wicd-curses'
alias hogs='sudo nethogs wlp6s0'
alias net-driftnet='echo "see pics from other computers on network" && sudo driftnet -i wlp6s0'
alias net-ettercap='echo "set up interface to capture network data" && sudo ettercap -TQM arp -i wlp6s0//'
alias net-snarf='echo "see which websites others on network are visiting" && sudo snarf -i wlp6s0|cut -d\" -f4'
alias net-scan='sudo arp-scan -l -I wlp6s0'
alias net-stat='netstat -t -v -c -ee'
alias net-traf='sudo iptraf-ng'
alias net-bmon='bmon'
alias net-nmap='nmap -v -sn 191.168.1.0/24'
alias net-fping='fping -c1 -gds 192.168.1.0/24 2>&1| egrep -v "ICMP|xmt"'
alias net-dump='sudo tcpdump -i wlp6s0'
alias net-wifi='wavemon'
alias net-nmon='nmon'
alias net-speedtest='speedtest-cli'
alias net-graph='speedometer -r wlp6s0 -t wlp6s0'
alias graph='nbwmon -i wlp6s0'
alias iftop='sudo iftop -p -n'
alias slurm='slurm -i wlp6s0'

## Power
alias bat='acpi'
alias bat-all='acpi -V'
alias Power='sudo powertop'

## Misc
alias biguns='~/Scripts/biguns.sh'
alias flux='xflux -z 94596'
alias Redshift='sudo redshift -l 37.9:122.1'
alias X='xscreensaver &'
alias kX='killall xscreensaver'
alias kG='killall gnome-screensaver'
alias kF='pkill xflux'
alias pic='tiv'
alias clock='tty-clock -c -C 4'
alias clock-graph='clockywock'
alias date-time='watch -n 1 -t date'
alias stopwatch='echo "cntl-z to end" & time cat'
alias starwars='telnet towel.blinkenlights.nl'
alias info='inxi -F'
alias Cap='cd ~/Screencasts/Screencaps/ && scrot'
alias rip='abcde'
alias vidterm='mplayer -vo caca'
#alias graph='gnuplot'

## Sparklines - CLI visualizations
alias spark-earthquake='curl http://earthquake.usgs.gov/earthquakes/catalogs/eqs1day-M1.txt --silent | sed '1d' | cut -d, -f9 | sparklines'
alias spark-wifi='~/Scripts/wifi.sh'

###########################################################
########################### ZSH ###########################
###########################################################

# enable vim mode on commmand line
bindkey -v

# no delay entering normal mode
# https://coderwall.com/p/h63etq
# https://github.com/pda/dotzsh/blob/master/keyboard.zsh#L10
# 10ms for key sequences
#KEYTIMEOUT=1

# show vim status
# http://zshwiki.org/home/examples/zlewidgets
#function zle-line-init zle-keymap-select {
#    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#    RPS2=$RPS1
#    zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select

# add missing vim hotkeys
# fixes backspace deletion issues
# http://zshwiki.org/home/zle/vi-mode
bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# history search in vim mode
# http://zshwiki.org./home/zle/bindkeys#why_isn_t_control-r_working_anymore
bindkey -M viins '^s' history-incremental-search-backward
bindkey -M vicmd '^s' history-incremental-search-backward

###########################################################
######################## FUNCTIONS ######################## 
###########################################################

# Awesome Logout
Logout() { echo 'awesome.restart()' | awesome-client ;}

# Christmas Tree
Christmas() { perl -MAcme::POE::Tree -e 'Acme::POE::Tree->new()->run()' ;}

# Best of YouTube
bestofyoutube() { cd ~/Downloads/YouTube && ~/Scripts/bestofyoutube.sh  }

# Simple python HTTP server
server() { python3 -m http.server ;}

# Hacker top
hacker-top() { python ~/Scripts/hacker-top/hacker_top.py  ;}

# Reddit top
reddit-top() { python ~/git/reddit-top/reddit_top ;}

# Transmission
T() { ~/Scripts/blocklist.sh && transmission-daemon && transmission-remote-cli ;}

# Pirate Bay search
tpb() { clear && figlet -c Pirate Bay && ~/Scripts/tpb.sh ;}

# Torrentz.eu search
torrentzeu() { clear && figlet -c Torrentz EU && ~/Scripts/torrentzeu.sh ;}

# YouTube Viewer
yt-viewer() { clear && figlet -c YouTube Viewer && youtube-viewer ;}

# No video / music only

yt-listen() { clear && figlet -c YouTube Listen && youtube-viewer -n $@ ;}

# Pianobar - ncurses Pandora Radio client
pandora-cli() { clear && figlet -c Pandora CLI && ~/.config/pianobar/pianobar_headless.sh ;}

# PMS- ncurses Spotify client
#spotify-cli() { clear && cd ~/Music && figlet -c Spotify CLI && python3 ~/Scripts/mps/mps;}
#spotify-cli() { clear && python2 ~/Git/mps/mps;}

# Grooveshark CLI
groove-dl-cli() { cd grooveshark && clear && figlet -c Grooveshark && groove-dl ;}

## Vim help page
:h()  { vim +":h $1" +'wincmd o' +'nnoremap q :q!<CR>' ;}

## Command-line calculator
calc() { python -ic "from __future__ import division; from math import *; from random import *" ;}

## Commandline Fu
cmdfu() { curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" \
	| sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" ;}

##Check if websites are down
down4me() { curl -s "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g';}

###########################################################
###################### TRANSMISSION ####################### 
###########################################################

tsm-clearcompleted() {
        transmission-remote -l | grep 100% | grep Done | \
        awk '{print $1}' | xargs -n 1 -I % transmission-remote -t % -r ;}
tsm() { transmission-remote --list ;}
tsm-start() { transmission-daemon ;}
tsm-stop() { pkill tramsmission-daemon ;}
tsm-altspeedenable() { transmission-remote --alt-speed ;}
tsm-altspeeddisable() {	transmission-remote --no-alt-speed ;}
tsm-add() { transmission-remote --add "$1" ;}
tsm-askmorepeers() { transmission-remote -t"$1" --reannounce ;}
tsm-pause() { transmission-remote -t"$1" --stop ;}
tsm-start-torrent() { transmission-remote -t"$1" --start ;}
tsm-purge() { transmission-remote -t"$1" --remove-and-delete ;} # will delete data also
tsm-remove() { transmission-remote -t"$1" --remove ;} # does not delete data
tsm-info() { transmission-remote -t"$1" --info ;}
#tsm-speed() { while true;do clear; transmission-remote -t"$1" -i | grep Speed;sleep 1;done ;}

###########################################################
######################### FFMPEG ########################## 
###########################################################

ffx_MONO="1"		# mono
ffx_DUAL="2"		# dual channel
ffx_HW="hw:1,0" 	# alsa; run 'cat /proc/asound/pcm' to change to the correct numbers
ffx_PULSE="pulse" 	# pulseaudio; might have to install pavucontrol to change volume
ffx_FPS="30"		# frame per seconds
#ffx_WIN_FULL="2560x1440"	# record fullscreen
ffx_WIN_FULL="2560x1440"	# record fullscreen
ffx_AUDIO="pcm_s16le"	# audio codec
ffx_VIDEO="libx264"	# video codec
ffx_PRESET="ultrafast"	# preset error? run 'x264 -h' replace with fast,superfast, slow ..etc
ffx_CRF="0"
ffx_THREADS="0"
ffx_THREAD_QUEUE_SIZE="512"
ffx_SCALE="scale=1920x1080"	# scale resolution, no black bars on sides of video on youtube
ffx_DIR="$HOME/Screencasts/"
ffx_OUTPUT=$ffx_DIR/$(date +%d-%b-%r)-screencast.mkv
ffx_OUTPUT_FINAL=~/Screencasts/screencast.mp4
# Note: -vf is optional delete if you want, -y is to overwrite existing file

## Concatinate (combine) two or more videos
#ffmpeg -i "concat:input1.avi|input2.avi..." -c copy output.avi

FF-full() { 
	ffmpeg \
#	-thread_queue_size 2048 \
	-f alsa \
	-ac $ffx_MONO \
	-i $ffx_PULSE \
#	-thread_queue_size 512 \
	-f x11grab \
	-r $ffx_FPS \
	-s $ffx_WIN_FULL \
	-i :0.0 \
	-acodec $ffx_AUDIO \
	-vcodec $ffx_VIDEO \
	-preset $ffx_PRESET \
	-crf $ffx_CRF \
	-threads $ffx_THREADS \
	-y $ffx_OUTPUT \
	$ffx_OUTPUT \
#	-vf $ffx_SCALE \
	}

# capture single window, use mouse cursor to select window you want to record
FF-window() { 
	ffx_INFO=$(xwininfo -frame)
    ffmpeg \
    -f alsa \
    -ac $ffx_MONO \
	-i $ffx_PULSE \
    -f x11grab \
    -r $ffx_FPS \
	-s $(echo $ffx_INFO \
    | grep -oEe 'geometry [0-9]+x[0-9]+'\
	| grep -oEe '[0-9]+x[0-9]+') \
	-i :0.0+$(echo $ffx_INFO | grep \
    -oEe 'Corners:\s+\+[0-9]+\+[0-9]+' \
	| grep -oEe '[0-9]+\+[0-9]+' | sed \
    -e 's/\+/,/' ) \
	-acodec $ffx_AUDIO \
    -vcodec $ffx_VIDEO \
    -preset $ffx_PRESET \
    -crf $ffx_CRF \
    -threads $ffx_THREADS \
	-y $ffx_OUTPUT \
            }

FF-convert() {
    ffmpeg \
	-i $ffx_OUTPUT \
	-ar 22050 \
	-ab 32k \
	-strict -2 \
	 $ffx_OUTPUT_FINAL
	}

Convert2mp4() {
    ffmpeg \
	-i $1 \
	-ar 22050 \
	-ab 32k \
	-strict -2 \
	 output.mpeg
	}



## Check Internal and External IPs ##
my-ip() {
        echo "--------------- Network Information ---------------"
	# newer system like arch
	ip addr | awk '/global/ {print $1,$2}' | cut -d\/ -f1
	ip addr | awk '/global/ {print $3,$4}'
	ip addr | awk '/ether/ {print $1,$2}'
	ip addr | awk '/scope link/ {print $1,$2}' | cut -d\/ -f1
	# older system like debian
    ifconfig | awk '/inet addr/ {print $1,$2}' | awk -F: '{print $1,$2}'
    ifconfig | awk '/Bcast/ {print $3}' | awk -F: '{print $1,$2}'
    ifconfig | awk '/inet addr/ {print $4}' | awk -F: '{print $1,$2}'
    ifconfig | awk '/HWaddr/ {print $4,$5}'
    ifconfig | awk '/Scope:Link/ {print $1,$3}' | cut -d\/ -f1
    echo Current IP $(curl -s http://checkip.dyndns.org/ | grep -o "[[:digit:].]\+")
    echo "---------------------------------------------------"
}

## Google Translate Functions ##
say() { 

	mplayer -user-agent Mozilla \
	"http://translate.google.com/translate_tts?ie=UTF-8&tl="$1"&q=$(echo "$@" \
	| cut -d ' ' -f2- | sed 's/ /\+/g')" > /dev/null 2>&1 ;}

say-translation() { 

	lang=$1
	trans=$(translate {=$lang} "$(echo "$@" | cut -d ' ' -f2- | sed 's/ /\+/g')" )	
	echo $trans
	mplayer -user-agent Mozilla \
	"http://translate.google.com/translate_tts?ie=UTF-8&tl=$lang&q=$trans" > /dev/null 2>&1 ;}

##############################################################
########################## PODCASTS ########################## 
##############################################################

nvlc-podcast() { nvlc --no-color -S podcast --podcast-urls "$@" ;}
pods-LinuxActionShow() { nvlc-podcast "http://feeds.feedburner.com/computeractionshowvideo" ;}
pods-Unfiltered() { nvlc-podcast "http://www.jupiterbroadcasting.com/feeds/unfilterHD.xml" ;}
pods-Scibyte() { nvlc-podcast "http://feeds.feedburner.com/scibytelarge " ;}
pods-RonPaul() { nvlc-podcast "https://www.google.com/url?q=http://www.ronpaul2012podcast.com/feed/&sa=U&ei=h8NIUbzfJoXJiQL4uoCoDw&ved=0CDYQFjAI&sig2=N2y3rxIlKxYDRI-Z9U8yRw&usg=AFQjCNGmGih9EAkV2JfSw2Nj64V90Jk5qg" ;}
pods-StefanMolyneux() { nvlc-podcast "http://feeds.feedburner.com/FreedomainRadioVolume6" ;}
pods-JoeRoganExperience() { nvlc-podcast "htthttp://joeroganexp.joerogan.libsynpro.com/irssp://joeroganexp.joerogan.libsynpro.com/irss" ;}
pods-FreedomFeens() { nvlc-podcast "http://www.freedomfeens.com/feed/" ;}
pods-GoldMoneyVideos() { nvlc-podcast "http://feeds.feedburner.com/GoldmoneyRssFeedGoldVideos" ;}
pods-GoldMoneyPodcasts() { nvlc-podcast "http://feeds.feedburner.com/GoldmoneyFoundationPodcasts" ;}
#pod-() { nvlc-podcast "" ;}

##############################################################
######################## LIVE STREAMS ######################## 
##############################################################

Stream() { streamlink -p mpv "$1" best ;}
TV-v() { livestreamer -p vlc "$1" best ;}

Jupiter() { livestreamer -p mpv http://www.ustream.tv/channel/jupiterbroadcasting best ;}

TwitchyMarbs() { livestreamer -p mpv http://www.twitch.tv/Marbozir best ;}
TwitchyBeagle() { livestreamer -p mpv http://www.twitch.tv/beagsandjam best ;}
TwitchyQuill() { livestreamer -p mpv http://www.twitch.tv/quill18 best ;}
TwitchyElysium() { livestreamer -p mpv http://www.twitch.tv/enterelysium best ;}

# News
live-news-cnn() { livestreamer -p mplayer http://www.justin.tv/msnbc_live_stream_cnn#/w/5008673600 live ;}
live-news-cnn_international() { livestreamer -p mplayer http://www.justin.tv/rentadrone_cnbc#/w/5011049360/22 live ;}
live-news-cbs() { livestreamer -p mplayer http://www.ustream.tv/cbsnews live ;}
live-news-fox() { livestreamer -p mplayer http://www.justin.tv/newswatch_2#/w/5013818384/5 live ;}
live-news-prisonplanet() { livestreamer -p mplayer http://www.ustream.tv/channel/alex-jones---infowars-com---prisonplanet-tv live ;}
live-news-KRON_San_Francisco() { livestreamer -p mplayer http://www.ustream.tv/kron4news best ;}
live-news-The_FED() { livestreamer -p mplayer http://www.ustream.tv/federalreserve live ;}  
 
# Series
live-series-simpsons() { livestreamer -p mplayer http://www.justin.tv/arconai_244#/w/5013781232/19  live ;}
live-series-southpark() { livestreamer -p mplayer http://www.justin.tv/arconai_229#/w/5622202400/179  best ;}
live-series-survival() { livestreamer -p mplayer http://www.justin.tv/survivor101#/w/5531579536/12 best ;}
live-series-criminal_minds() { livestreamer -p mplayer http://www.justin.tv/lurking_in_the_dark17 live ;}
live-series-mythbusters() { livestreamer -p mplayer  best ;}
live-series-married_with_children() { livestreamer -p mplayer http://www.justin.tv/mwconjtv#/w/4992184096/88 live ;}
live-series-stargate_SG1() { livestreamer -p mplayer http://www.justin.tv/oldngr8#/w/5006964064/9 live ;}
live-series-that_70s_show() { livestreamer -p mplayer http://www.justin.tv/highspothorror128#/w/4994695216/102 live ;}
 
# Science
live-science-the_universe() { livestreamer -p mplayer http://www.justin.tv/the_lost_continent#/w/5005014000/48 live ;}
 
# Movies
 
#live-movies-horror-2000_2013_HQ() { livestreamer -p mplayer http://www.justin.tv/horrorhq0010#/w/5074870864/20 live ;}
live-movies-horror4life() { livestreamer -p mplayer http://www.justin.tv/finn_horrorstfu51 live ;}
#live-movies-horror-2() { livestreamer -p mplayer http://www.justin.tv/jags__movies04#/w/5008275648/4 live ;}
 
live-movies-new_releases-2010_2013() { livestreamer -p mplayer http://www.justin.tv/videoisnothere6 live ;}
#live-movies-new_releases-2012_2013_HQ() { livestreamer -p mplayer http://www.justin.tv/movies_tv68#/w/5056426000/115 live ;}
live-movies-movies_2010_2013() { livestreamer -p mplayer http://www.justin.tv/gewinnen_duh_bringen live ;}
 
live-movies-general() { livestreamer -p mplayer http://www.justin.tv/420nomad554 live ;}
#live-movies-general-movies_n_that() { livestreamer -p mplayer http://www.justin.tv/walterkronic#/w/5013245536/8 live ;}
 


## Capture video streams
 
sniff-begin() { sudo iptables -t nat -A OUTPUT -p tcp --dport 1935 -m owner \! --uid-owner root -j REDIRECT ;}
sniff-capture-rtmpsrv() { rtmpsrv ;}
sniff-end() { sudo iptables -t nat -D OUTPUT -p tcp --dport 1935 -m owner \! --uid-owner root -j REDIRECT ;}

## Rtmpsrv Feeds (may need to add -v before -r)

# Jupiter Broadcasting
live-JupiterBroadcasting() { vlc rtsp://videocdn-us.geocdn.scaleengine.net/jblive/live/jblive.stream }


# Russia Today US
iptv-RT_US() { rtmpdump \
		-r "rtmp://rt.fms-04.visionip.tv/live" \
		-a "live" \
		-f "LNX 11,2,202,270" \
		-W "http://rt.com/s/swf/player5.4.viral.swf" \
		-p "http://rt.com" -y "RT_US_2" \
		| mplayer - ;}

# Bloomberg
iptv-Bloomberg() { rtmpdump \
		-v \
		-r rtmp://cp116697.live.edgefcs.net:80/live/BnazlkNDpCIcD-QkfyZCQKlRiiFnVa5I_640_360_440@18679  \
		-W http://player.ooyala.com/cacheable/c78f866930724ffedfe8cf5349712569/player_v2.swf \
		-p http://tvpc.com \
		| mplayer - ;}

# MSNBC
iptv-MSNBC() { rtmpdump \
		-v \
		-r "rtmp://a.cdn.msnbclive.eu/edge" \
		-y "msnbc_live" \
		-W "http://msnbclive.eu/getswf.php?name=player.swf" \
		-p "http://www.rentadrone.tv/msnbc-live-rockinroosters/" \
		| mplayer - ;}

# Rueters
iptv-Rueters() {  rtmpdump \
		-r "rtmp://media9.lsops.net/reuters/" \
		-a "reuters/" -W "http://reuters.cdn.livestation.com/flash/player/5.7/player.swf" \
		-p "http://reuters.livestation.com/demo" \
		--live \
		-y "reuters_rlsweba_en_veryhigh.sdp" \
		| mplayer -;}

##########################################################
########################## MODS ########################## 
##########################################################



plugins=(git archlinux vi-mode themes zsh-completions color-command)
source /home/msjche/Git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/msjche/.oh-my-zsh/oh-my-zsh.sh

clear
#neofetch --w3m --source ~/Icons/arch-blue-large.png
#neofetch
#/home/msjche/Scripts/pacolor.sh
#/home/msjche/Scripts/starwars.sh
#/home/msjche/Scripts/batman.sh
#/home/msjche/Scripts/invaders1.sh
screenfetch -E
