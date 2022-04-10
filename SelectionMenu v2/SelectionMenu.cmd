@echo off
setlocal enabledelayedexpansion
setlocal enableextensions
title Selection Menu v2

:::::::::::::::::::::::::::::
::   Coded by DNAScanner   ::
::      DNAScanner.de      ::
:::::::::::::::::::::::::::::

set "colorReset=[0m"
set "colorRed=[31m"
set "colorGreen=[32m"

set "menuMaxOptions=6" & ::Maximum number of options to display
set "menuSelection=1" & ::Default Selected

::Add options to the menu below
set "menuOption1=Jeff Bezos"
set "menuOption2=Steve Ballmer"
set "menuOption3=Bill Gates"
set "menuOption4=Mark Zuckerberg"
set "menuOption5=Larry Page"
set "menuOption6=Sergey Brin"

for /l %%A in (1,1,!menuMaxOptions!) do if defined menuOption%%A (
      set "menuOption%%ARaw=!menuOption%%A!"
      set "menuOption%%A=#   !menuOption%%A!   #"
      set "menuOptionsFound=%%A"
      set "menuOption%%ALenght=0"
      set "menuOption%%ABoxLine="
      call :getLength "!menuOption%%A!" menuOption%%ALenght
      for /l %%B in (1,1,!menuOption%%ALenght!) do ( set "menuOption%%ABoxLine=!menuOption%%ABoxLine!#" )
)

:display
cls
for /l %%A in (1,1,!menuOptionsFound!) do ( 
            if %%A==!menuSelection! (
            echo !colorGreen!!menuOption%%ABoxLine!!colorReset!
            echo !colorGreen!!menuOption%%A!!colorReset!
            echo !colorGreen!!menuOption%%ABoxLine!!colorReset!
      ) else (
            echo !menuOption%%ABoxLine!
            echo !menuOption%%A!
            echo !menuOption%%ABoxLine!
      )
      echo.
)

for /l %%A in (1,1,2) do ( echo. )
::Customize the control-key-message below
echo Press %colorRed%[W]%colorReset% to go up or %colorRed%[S]%colorReset% to go down
echo Press %colorRed%[A]%colorReset% or %colorRed%[D]%colorReset% to proceed

::Get input
choice /c wsad /n >nul

::Check input
if !errorlevel!==1 set /a "menuSelection-=1"
if !errorlevel!==2 set /a "menuSelection+=1"

::Check if selection is valid
if !menuSelection! leq 0 set menuSelection=!menuOptionsFound!
if !menuSelection! gtr !menuOptionsFound! set menuSelection=1

::Proceed
if !errorlevel!==3 call :action%menuSelection%
if !errorlevel!==4 call :action%menuSelection%

goto display


exit /b 0

:getLength
set "s=#%~1"
set "len=0"
for %%N in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
	if "!s:~%%N,1!" neq "" (
		set /a "len+=%%N"
		set "s=!s:~%%N!"
	)
)
if "%~2" neq "" ( set %~2=%len% ) else ( echo %len% )
exit /b

:action1
::paste your code to be executed here
cls
echo You selected !menuOption1Raw!
pause >nul
exit /b 0

:action2
::paste your code to be executed here
cls
echo You selected !menuOption2Raw!
pause >nul
exit /b 0

:action3
::paste your code to be executed here
cls
echo You selected !menuOption3Raw!
pause >nul
exit /b 0