@echo off
setlocal enabledelayedexpansion

:menu
cls
echo Select a command to execute:
echo 1. ipconfig
echo 2. tasklist/taskkill
echo 3. chkdsk
echo 4. format
echo 5. defrag
echo 6. find
echo 7. attrib
set /p choice="Enter your choice (1-7): "

if "%choice%"=="1" goto ipconfig
if "%choice%"=="2" goto tasklist
if "%choice%"=="3" goto chkdsk
if "%choice%"=="4" goto format
if "%choice%"=="5" goto defrag
if "%choice%"=="6" goto find
if "%choice%"=="7" goto attrib
echo Invalid choice. Please try again.
goto menu

:ipconfig
ipconfig
goto end

:tasklist
echo Tasklist options:
echo 1. View tasks
echo 2. Kill task
set /p taskchoice="Enter your choice (1-2): "
if "%taskchoice%"=="1" (
    tasklist
) else if "%taskchoice%"=="2" (
    set /p pid="Enter the PID of the task to kill: "
    taskkill /PID %pid% /F
) else (
    echo Invalid choice. Returning to main menu.
)
goto end

:chkdsk
set /p drive="Enter the drive letter to check (e.g., C:): "
chkdsk %drive%
goto end

:format
set /p drive="Enter the drive letter to format (e.g., D:): "
echo Warning: This will erase all data on the drive %drive%.
set /p confirm="Are you sure you want to proceed? (yes/no): "
if /i "%confirm%"=="yes" (
    format %drive%
) else (
    echo Format cancelled.
)
goto end

:defrag
set /p drive="Enter the drive letter to defrag (e.g., C:): "
defrag %drive%
goto end

:find
set /p filename="Enter the filename to search for: "
set /p text="Enter the text to find: "
find "%text%" %filename%
goto end

:attrib
set /p file="Enter the file or directory to change attributes: "
set /p attributes="Enter the attributes to set (e.g., +r -s): "
attrib %attributes% %file%
goto end

:end
pause
exit