net start w32time
w32tm /config /update
w32tm /resync /rediscover
net stop w32time