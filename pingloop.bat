@echo off
:loop

rem Get the current date and time
for /f "tokens=1-4 delims=/:. " %%a in ('echo %date% %time%') do (
    set day=%%a
    set month=%%b
    set year=%%c
)

rem Get the current time
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set hour=%%a
    set minute=%%b
)

rem Ensure hour has leading zero if needed
if "%hour:~0,1%"==" " set hour=0%hour:~1,1%

rem Combine date and time into the filename
set filename=%year%_%month%_%day%_%hour%_%minute%.txt

rem Perform the ping for a specific duration (3600 seconds - e.g. 1 hour) and log the output to the file
ping -n 3601 www.vg.no >> C:\tmp\3rd\%filename%

rem Immediately start a new file rotation without waiting additional time
goto loop
