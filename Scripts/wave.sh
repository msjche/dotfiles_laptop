#1/bin/bash
function sine_wave() {
	
	i=0
	while true
	do 
		SIN=$(python -c "from math import *;print map( lambda x: ceil(6*sin((x+$i)*pi/5)), range($(tput cols)) )" | tr -d '[]' | spark)
		echo -ne $SIN\\r 
		let i=i+1
		sleep 0.05
	done
	echo
}
