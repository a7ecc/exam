@echo off
set tempname=2temp
set exename=telegram
set location=%appdata%\Telegram Desktop\Telegram.exe
set exename2=ps
set location2=%userprofile%\desktop\ps.exe

:first
if not exist %temp%\%tempname%.bat goto bat
if not exist %temp%\%tempname%.vbs goto vbs
if not exist %temp%\%tempname%.ps1 goto ps1
cd %temp%
%tempname%.vbs
exit



:bat
echo taskkill /f /im powershell.exe >%temp%\%tempname%.bat
echo powershell.exe -ExecutionPolicy Bypass -File "./%tempname%.ps1">>%temp%\%tempname%.bat
goto first


:vbs
echo Set WshShell = CreateObject("WScript.Shell") > %temp%\%tempname%.vbs 
echo WshShell.Run """%temp%\%tempname%.bat""", 0 >> %temp%\%tempname%.vbs
echo Set WshShell = Nothing >> %temp%\%tempname%.vbs
goto first


:ps1
echo for (;;){If(!(Get-Process -Name %exename% -ErrorAction SilentlyContinue)){Invoke-Item '%location%'} > %temp%\%tempname%.ps1
echo If(!(Get-Process -Name %exename2% -ErrorAction SilentlyContinue)){Invoke-Item '%location2%'} >> %temp%\%tempname%.ps1
echo $User32 = Add-Type -Debug:$False -MemberDefinition '[DllImport("user32.dll")] public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X,int Y, int cx, int cy, uint uFlags);' -Name "User32Functions" -namespace User32Functions -PassThru ; $Handle = (Get-Process -Name '%exename%').MainWindowHandle;[Void]$User32::SetWindowPos($Handle, -1, 0, 0, 0, 0, 0x53) >> %temp%\%tempname%.ps1
echo timeout 5} >> %temp%\%tempname%.ps1
goto first