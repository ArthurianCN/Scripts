#!/bin/bash

procname="$1"
logpath="/root/log/mem"
logfile="$logpath/memusage.log"
interval=3
mkdir -p $logpath

while true
do
	pid=$(pidof $procname) 
	if [ -z "$pid" ]; then
		echo "$procname not running"
		sleep 1
		continue
	fi
	memusage_percent=$(ps -p $pid -o %mem | tail -n 1)
	memusage_kb=$(ps -p $pid -o rss | tail -n 1) 
	timestamp=$(date +%Y-%m-%d_%H:%M:%S)
	echo "[pid:$pid] $timestamp mem:$memusage_kb KB" 
	echo "[pid:$pid] $timestamp mem:$memusage_kb KB" >> $logfile
    
	sleep $interval
done
