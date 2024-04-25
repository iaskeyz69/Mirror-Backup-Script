@echo off
setlocal enabledelayedexpansion

rem Read configuration from config file
set "configFile=config.txt"
for /f "tokens=1,* delims=:" %%a in (%configFile%) do (
    set "%%a=%%b"
)

rem Get the current logged-in user
set currentUser=%USERNAME%

rem Set the log file path
set "logFile=%USERPROFILE%\Documents\automatic-backup\SyncLog.txt"

rem Check if source and destination folders exist
if not exist "%sourceFolder%" (
    echo Source folder "%sourceFolder%" does not exist.
    exit /b
)
if not exist "%destinationFolder%" (
    echo Destination folder "%destinationFolder%" does not exist.
    exit /b
)
if not exist "%sourceFolder2%" (
    echo Source folder "%sourceFolder2%" does not exist.
    exit /b
)
if not exist "%destinationFolder2%" (
    echo Destination folder "%destinationFolder2%" does not exist.
    exit /b
)

echo %DATE% %TIME% - Synchronizing folders %sourceFolder% to %destinationFolder%... Started! >> "%logFile%"
echo Synchronizing folders %sourceFolder% to %destinationFolder%...
robocopy "%sourceFolder%" "%destinationFolder%" /mir /fft /eta /ndl /np /r:5 /w:5 /XD "%USERPROFILE%\My Pictures" /XD "%USERPROFILE%\My Music" /XD "%USERPROFILE%\My Videos" /XJ >> "%logFile%"
echo %DATE% %TIME% - Synchronizing folders %sourceFolder% to %destinationFolder%... Complete! >> "%logFile%"

echo %DATE% %TIME% - Synchronizing folders %sourceFolder2% to %destinationFolder2%... Started! >> "%logFile%"
echo Synchronizing folders %sourceFolder2% to %destinationFolder2%...
robocopy "%sourceFolder2%" "%destinationFolder2%" /mir /fft /eta /ndl /np /r:5 /w:5 /XD "%USERPROFILE%\My Pictures" /XD "%USERPROFILE%\My Music" /XD "%USERPROFILE%\My Videos" /XJ >> "%logFile%"
echo %DATE% %TIME% - Synchronizing folders %sourceFolder2% to %destinationFolder2%... Complete! >> "%logFile%"

echo Folder Mirrored successfully!

rem Send email notification if configured
if "%sendEmail%"=="true" (
    python send_email.py "Backup Notification" "Backup process completed successfully." "%adminEmail%" "%smtpServer%" %smtpPort% "%fromEmail%" "%emailPassword%"
)

pause
