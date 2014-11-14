@echo off
PATH=%PATH%;%~dp0;
SET HTDOCS=%CD%
tasklist /FI "IMAGENAME eq miniweb.exe" | findstr miniweb.exe
IF %ERRORLEVEL% == 0 GOTO Kill
IF NOT %ERRORLEVEL% == 0 GOTO Start

:Kill
SET /P ANSWER=Do you want to kill the front server? (Y/N)
IF "%ANSWER%"=="Y" taskkill /f /im miniweb.exe
IF NOT "%ANSWER%"=="Y" GOTO End

:Start
echo The server will start with the folder you give.
IF NOT [%1] EQU [] SET HTDOCS=%1
start /B miniweb.exe -r %Htdocs% -l %~dp0\miniweb.log -m 500 -d 0
break

:End