@echo off

:1
cls
set /a randomNumber=%random%*69/32768+1
echo %randomNumber%
echo Press any key to generate a new random random number
pause >nul
goto 1