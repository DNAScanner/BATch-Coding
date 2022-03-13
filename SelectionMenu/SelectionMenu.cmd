@echo off
title SelectionMenu
echo Navigator Loaded. Use W / S to switch
ping 127.0.0.1 -n 2 >nul
cls

set p1=First Selection
set p2=Second Selection
set p3=Third Selection

set selected= 
set col_green=[32m
set col_red=[31m
set col_reset=[0m

set slt=1
goto tell_slt_1

:check_slt
if %slt%==1 goto tell_slt_1
if %slt%==2 goto tell_slt_2
if %slt%==3 goto tell_slt_3
goto listener

:listener
choice /c wsad /n
cls

if %slt%==1 if %errorlevel%==2 set slt=2
if %slt%==2 if %errorlevel%==2 set slt=3
if %slt%==2 if %errorlevel%==1 set slt=1
if %slt%==3 if %errorlevel%==1 set slt=2

if %slt%==1 if %errorlevel%==3 goto start_p1
if %slt%==2 if %errorlevel%==3 goto start_p2
if %slt%==3 if %errorlevel%==3 goto start_p3
if %slt%==1 if %errorlevel%==4 goto start_p1
if %slt%==2 if %errorlevel%==4 goto start_p2
if %slt%==3 if %errorlevel%==4 goto start_p3

goto check_slt

:tell_slt_1
echo %selected%%col_green%%p1%%col_reset%
echo %p2%
echo %p3%

echo. && echo. && echo. && echo. && echo Press %col_red%[D]%col_reset% or %col_red%[A]%col_reset% to continue. && echo. && echo. &&echo Press %col_red%[W]%col_reset% or %col_red%[S]%col_reset% to go up / down.
goto listener

:tell_slt_2
echo %p1%
echo %selected%%col_green%%p2%%col_reset%
echo %p3%

echo. && echo. && echo. && echo. && echo Press %col_red%[D]%col_reset% or %col_red%[A]%col_reset% to continue. && echo. && echo. &&echo Press %col_red%[W]%col_reset% or %col_red%[S]%col_reset% to go up / down.
goto listener

:tell_slt_3
echo %p1%
echo %p2%
echo %selected%%col_green%%p3%%col_reset%

echo. && echo. && echo. && echo. && echo Press %col_red%[D]%col_reset% or %col_red%[A]%col_reset% to continue. && echo. && echo. &&echo Press %col_red%[W]%col_reset% or %col_red%[S]%col_reset% to go up / down.
goto listener

:start_p1
echo 1 was selected
ping 127.0.0.1 -n 2 >nul
cls
goto check_slt

:start_p2
echo 2 was selected
ping 127.0.0.1 -n 2 >nul
cls
goto check_slt

:start_p3
echo 3 was selected
ping 127.0.0.1 -n 2 >nul
cls
goto check_slt