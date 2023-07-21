#!/bin/bash

network="10.0.12."

for ip in $(seq 1 255); do
  ping -c 1 ${network}${ip} &> /dev/null

  if [ $? -eq 0 ]; then
    echo "${network}${ip} is up"
  else
    echo "${network}${ip} is down"
  fi  
done
