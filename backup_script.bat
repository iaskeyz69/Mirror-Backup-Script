@echo off
setlocal enabledelayedexpansion

rem Get the current logged-in user
set currentUser=%USERNAME%

rem Set the source and destination folders based on the logged-in user
set sourceFolder="C:\Users\%currentUser%\Documents"
set destinationFolder="R:\Documents"

set sourceFolder2="C:\Users\%currentUser%\Desktop"
set destinationFolder2="R:\Desktop"


rem Set the log file path
set logFile="C:\Users\%currentUser%\Documents\automatic-backup\SyncLog.txt"


echo %DATE% %TIME% - Synchronizing folders %sourceFolder% to %destinationFolder%... Started! >> %logFile%
echo Synchronizing folders %sourceFolder% to %destinationFolder%...
robocopy %sourceFolder% %destinationFolder% /mir /fft /eta /ndl /np /r:5 /w:5 /XD "%USERPROFILE%\My Pictures" /XD "%USERPROFILE%\My Music" /XD "%USERPROFILE%\My Videos" /XJ
echo %DATE% %TIME% - Synchronizing folders %sourceFolder% to %destinationFolder%... Complete! >> %logFile%

echo %DATE% %TIME% - Synchronizing folders %sourceFolder2% to %destinationFolder2%... Started! >> %logFile%
echo Synchronizing folders %sourceFolder2% to %destinationFolder2%...
robocopy %sourceFolder2% %destinationFolder2% /mir /fft /eta /ndl /np /r:5 /w:5 /XD "%USERPROFILE%\My Pictures" /XD "%USERPROFILE%\My Music" /XD "%USERPROFILE%\My Videos" /XJ
echo %DATE% %TIME% - Synchronizing folders %sourceFolder2% to %destinationFolder2%... Complete! >> %logFile%


echo Folder Mirrored successfully!
pause
