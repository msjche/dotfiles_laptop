
#!/bin/bash

START=$(date +%s)
#rsync -avz -e --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found/*","/home/msjche/Downloads/*","/home/msjche/Dropbox/*","/home/msjche/Google\ Drive/","/home/msjche/MEGA"} ssh msjche@192.168.1.7:/media/Backup/Laptop /*

rsync -aAXv --delete --exclude={'/dev/*','/proc/*','/sys/*','/tmp/*','/run/*','/mnt/*','/media/*','/home/*','/lost+found'} /* /home/msjche/Backup


FINISH=$(date +%s)
echo "total time: $(( ($FINISH-$START) / 60 )) minutes, $(( ($FINISH-$START) % 60 )) seconds" | tee $1/"Backup from $(date '+%Y-%m-%d, %T, %A')"

