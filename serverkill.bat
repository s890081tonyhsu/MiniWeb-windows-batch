@echo off
tasklist /FI "IMAGENAME eq miniweb.exe" | grep miniweb.exe
IF %ERRORLEVEL% == 0 GOTO Kill
IF NOT %ERRORLEVEL% == 0 GOTO End

:Kill
taskkill /f /im miniweb.exe

:End