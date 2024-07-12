@echo off
:: Open five websites
start "" "https://www.google.com"
start "" "https://www.microsoft.com"
start "" "https://www.github.com"
start "" "https://www.stackoverflow.com"
start "" "https://www.reddit.com"

:: Launch Calculator
start calc.exe

:: Launch Notepad
start notepad.exe

:: Wait for 60 seconds before shutdown
timeout /t 60

:: Initiate system shutdown
shutdown /s /f /t 0

:: End of script
exit