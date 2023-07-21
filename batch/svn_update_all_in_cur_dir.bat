cd /d %~dp0
:: Get date Format：20110820
set datevar=%date:~0,4%%date:~5,2%%date:~8,2%
:: Time, Format time by 24h
set timevar=%time:~0,2%%time:~3,2%%time:~6,2%
echo %datevar%%timevar% >> svnupdate.log

setlocal enabledelayedexpansion 
for /d  %%i in (*) do (
	svn cleanup %%i
	svn update %%i --accept p  >> svnupdate.log
	echo= >> svnupdate.log
)
echo ******************************************************************************** >> svnupdate.log
echo= >> svnupdate.log
echo= >> svnupdate.log