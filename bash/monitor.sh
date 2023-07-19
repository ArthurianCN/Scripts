
#!/bin/bash

procname="$1"
logpath="/root/log/mem"
logfile="$logpath/memusage.log"
interval=3
mkdir -p $logpath

function log_memusage()
{
	pid=$1
	memusage_percent=$(ps -p $pid -o %mem | tail -n 1)
	memusage_bytes=$(ps -p $pid -o rss | tail -n 1)
	timestamp=$(date +%Y-%m-%d_%H:%M:%S)
	echo "$timestamp [pid:$pid] mem:$memusage_bytes KB"
	echo "$timestamp [pid:$pid] mem:$memusage_bytes KB" >> $logfile
}


while true
do
	pid_list=$(pidof $procname) 
	if [ -z "$pid_list" ]; then
		echo "$procname not running"
		sleep 1
		continue
	fi

	oldIFS=$IFS
	
	IFS=' '
	for item in $pid_list; do
		log_memusage "$item"
	done

	IFS=$oldIFS
    
	sleep $interval
done
