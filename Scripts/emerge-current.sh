#!/bin/bash
# emerge-current.sh by Hellf[i]re
#
# This script is designed to read the name of the last package compiled.
#
# As this script does read the entirety of emerge.log, it will be rather
# heavy on the CPU.  It shouldn't be enough to be noticable on newer (2.0Ghz+)
# processors, but it still should not be run more often than every 30 seconds.
#
# Usage:
# .conkyrc:     ${execi [time] /path/to/script/emerge-current.sh}
#
# Usage Example
#               ${execi 30 /home/youruser/scripts/emerge-current.sh}

tac /var/log/emerge.log |\
grep 'Compiling' |\
head |\
sed -e 's/.*(//' |\
sed -e 's/::.*)//' |\
head -n 1 |\
cut -d \) -f 1
