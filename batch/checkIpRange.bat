@echo off
setlocal EnableDelayedExpansion

set "network=192.168.1."

for /L %%i in (1,1,255) do (
  ping -n 1 !network!%%i | find "TTL=" > NUL
  if !errorlevel! == 0 (
    echo !network!%%i is up
  ) else ( 
    echo !network!%%i is down
  )
)