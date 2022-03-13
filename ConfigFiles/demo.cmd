@echo off
title Config Demo
set balance=0
set file=%~nx0
set config-heading=This is the config for %file%

if not exist "config.cmd" (
      echo :: %config-heading%
      echo.
) >config.cmd


:game-set-balance
cls
set /a balancep1=%balance%+1
set /a balancem1=%balance%-1
echo Current Balance: $%balance%
echo [1] Add 1 to balance (New balance: $%balancep1%)
echo [2] Remove 1 from balance (New balance: $%balancem1%)
echo [3] Set to custom
echo.
echo [4] Save balance
echo [5] Load balance

choice /c 12345 /n >nul

if %errorlevel%==1 set balance=%balancep1%
if %errorlevel%==2 set balance=%balancem1%
if %errorlevel%==3 set /p balance=Set balance to: 

if %errorlevel%==4 (
      echo Saving balance
      goto save-config
)

if %errorlevel%==5 (
      echo Loading balance
      goto load-config
)

goto game-set-balance


:save-config
(
      echo :: %config-heading%
      echo.
      echo set balance=%balance%
) >config.cmd
echo Saved config
ping 127.0.0.1 -n 2 >nul
goto game-set-balance


:load-config
call config.cmd
echo Loaded config
ping 127.0.0.1 -n 2 >nul
goto game-set-balance