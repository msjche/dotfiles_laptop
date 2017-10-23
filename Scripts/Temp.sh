
#!/bin/bash

echo -n "Enter Temp"
read temp

echo "$temp" > /sys/bus/platform/devices/coretemp.0/temp5_input
