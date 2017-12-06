
#!/bin/bash

START=$(date +%s)
#rsync -avz -e --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found/*","/home/msjche/Downloads/*","/home/msjche/Dropbox/*","/home/msjche/Google\ Drive/","/home/msjche/MEGA"} ssh msjche@192.168.1.7:/media/Backup/Laptop /*

rsync -aAXv --delete --exclude={'/dev/*','/proc/*','/sys/*','/tmp/*','/run/*','/mnt/*','/media/*','/home/*','/lost+found'} /* /run/media/msjche/1921659a-2451-4971-9bd4-e043c7659daf/Laptop/


FINISH=$(date +%s)
echo "total time: $(( ($FINISH-$START) / 60 )) minutes, $(( ($FINISH-$START) % 60 )) seconds" | tee $1/"Backup from $(date '+%Y-%m-%d, %T, %A')"

