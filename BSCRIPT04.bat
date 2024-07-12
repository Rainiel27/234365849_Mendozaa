@echo off
setlocal enabledelayedexpansion

:: Define directories
set source_dir=C:\*.txt
set archive_dir=Z:\archive

:: Create archive directory if it doesn't exist
if not exist %archive_dir% mkdir %archive_dir%

:: Sort files by date and move older files to archive
forfiles /p C:\ /m *.txt /d -30 /c "cmd /c move @file %archive_dir%"

:: Sort archived files by size
echo Sorting archived files by size:
for /f "tokens=*" %%a in ('dir %archive_dir%\*.txt /s /o:-s /b') do (
    echo %%a
)

:: Prompt user for permission to delete old, large files
set /p confirm="Do you want to delete the sorted old, large files? (yes/no): "
if /i "%confirm%"=="yes" (
    del /q %archive_dir%\*.txt
    echo Files deleted.
) else (
    echo Deletion cancelled.
)

:end
pause
exit