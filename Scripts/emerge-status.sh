#!/bin/bash
#
# emerge-status.sh by Hellf[i]re
#
# This script will report the current status of portage.
#
# Usage:
# .conkyrc:     ${execi [time] /path/to/script/emerge-current.sh}
#
# Usage Example
#               ${execi 30 /home/youruser/scripts/emerge-current.sh}
#
# Known Bugs:
#  1) If there are two emerges running at once, when the first one finishes 
#     running, the script will report the current status as "Completed".
#  2) If there is a emerge running and you run a search, the script will
#     report the current status as "Completed", until the running emerge
#     moves to the next package, or itself completes.
#  The reasons for this are twofold - one, it's a feature ;) and two, there
#  would be far too much parsing required to find out the current status of
#  every command which is run in parallel.

STATUS=`tail -n 15 /var/log/emerge.log |\
grep -iE "Compiling|Cleaning|AUTOCLEAN|completed|search|terminating|rsync" |\
cut -d ' ' -f "2-" |\
grep -Ev 'Finished\.|Cleaning up\.\.\.' |\
tail -n 1`

#echo "$STATUS"

if [ "`echo "$STATUS" | grep -i compiling`" != "" ]; then echo Compiling
elif [ "`echo "$STATUS" | grep -i cleaning`" != "" ]; then echo Cleaning
elif [ "`echo "$STATUS" | grep -i autoclean`" != "" ]; then echo Autoclean
elif [ "`echo "$STATUS" | grep -i sync`" != "" ]; then echo Syncing
elif [ "`echo "$STATUS" | grep -i search`" != "" ]; then echo Searching
elif [ "`echo "$STATUS" | grep -i completed`" != "" ]; then echo Completed
elif [ "`echo "$STATUS" | grep -i terminating`" != "" ]; then echo Completed
else echo Script Error!
fi
