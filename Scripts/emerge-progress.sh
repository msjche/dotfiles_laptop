#!/bin/bash
# source: Jeremy_Z @ forums.gentoo.org http://forums.gentoo.org/viewtopic-t-351806-postdays-0-postorder-asc-start-550.html
#
# This script will report the progress of the last emerge command run.  It 
# reports the TOTAL percentage complete - not the percentage of the current
# package.  For example, if there are 110 packages currently being emerged, and
# it is on the 55th package, it will report 50.
#
# Usage:
# .conkyrc:     ${execibar [time] /path/to/script/emerge-progress.sh}
#
# Usage Example
#               ${execibar 30 /home/youruser/scripts/emerge-progress.sh}

tail -n 50 /var/log/emerge.log |\
tac |\
grep -v "Starting retry" |\
grep -iE '([0-9]* of [0-9]*)' -o -m 1 |\
sed -e 's/\(.*\) of \(.*\)/\1 \2/' |\
awk '{print 100.0*$1/$2}' 
