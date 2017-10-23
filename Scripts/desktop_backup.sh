
#!/bin/bash

START=$(date +%s)

#rsync -avz -e --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found/*","/home/msjche/Downloads/*","/home/msjche/Dropbox/*","/home/msjche/Google\ Drive/","/home/msjche/MEGA"} ssh msjche@192.168.1.7:/media/Backup/Laptop /*

sudo rsync -aAXv --delete --exclude=/dev/* --exclude=/proc/* --exclude=/sys/* --exclude=/tmp/* --exclude=/run/* --exclude=/mnt/* --exclude=/media/* --exclude="swapfile" --exclude="lost+found" --exclude=".cache" --exclude=/home/*/Downloads --exclude=/home/*/VirtualBox\ VMs --exclude=".ecryptfs" --exclude=/home/*/Distros --exclude=/home/*/Documents --exclude=/home/*/Dropbox --exclude=/home/*/Google --exclude=/home/*/MEGA --exclude=/home/*/Gentoo --exclude=/home/*/Guitar --exclude=/home/*/Icons --exclude=/home/*/Laptop --exclude=/home/*/Lehigh --exclude=/home/*/Movies --exclude=/home/*/Music --exclude=/home/*/Podcasts --exclude=/home/*/Screencasts --exclude=/home/*/Scripts --exclude=/home/*/TV --exclude=/home/*/Videos --exclude=/home/*/.local/share/Steam --exclude=/home/*/.gvfs --exclude=/home/*/Wallpaper / /media/Data/Backups/Desktop_Backup/

FINISH=$(date +%s)
#echo "total time: $(( ($FINISH-$START) / 60 )) minutes, $(( ($FINISH-$START) % 60 )) seconds" | tee $1/"Backup from $(date '+%Y-%m-%d, %T, %A')"
echo "total time: $(( ($FINISH-$START) / 60 )) minutes, $(( ($FINISH-$START) % 60 )) seconds"

