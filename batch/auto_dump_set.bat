@echo off&color 17
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
bcdedit >nul
if '%errorlevel%' NEQ '0' (goto UACPrompt) else (goto UACAdmin)
:UACPrompt
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit
exit /B
:UACAdmin
cd /d "%~dp0"
echo ��ǰ����·���ǣ�%CD%
echo �ѻ�ȡ����ԱȨ��

@echo off

echo.
echo ######################��ѡ��Ҫִ�еĲ���######################
echo ----------------------1������1�����س�������dump�Զ��ռ�����----------------------
echo ----------------------2������2�����س����ر�dump�Զ��ռ�����----------------------
echo ----------------------4���������κ������ַ����Զ���ֹ������ ----------------------
echo.
echo ��ѡ��Ҫִ�еĲ���
set /p num=

if "%num%"=="1" (
echo ��������Dump...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps" /v DumpFolder /t REG_EXPAND_SZ /d "C:\CrashDump" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps" /v DumpType /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps" /v DumpCount /t REG_DWORD /d 10 /f
echo Dump�Ѿ�����
pause
@echo on
)

if "%num%"=="2" (
@echo off
echo ���ڹر�Dump...
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps" /f
echo Dump�Ѿ��ر�
pause
@echo on
)

exit 

