::x===========================x
::I    Line breaks will be    I
::I      converted into a     I
::I        single line        I
::x===========================x
::I  Example:                 I
::I   line1                   I
::I   line2                   I
::I   line3                   I
::I ... will be converted to  I
::I   line1\nline2\nline3     I
::x===========================x
::I  Usage:                   I
::I   MTSL [<file>] <output>  I
::x===========================x
@echo off
setlocal enabledelayedexpansion
set "mtslNew="
set "outputDestination="
set "inputFile=%~1"
set "outputDestination=%~2"
if not defined inputFile goto sendUsage
if defined inputFile if not exist "!inputFile!" goto sendUsage
for /f "delims=" %%A in ('more %~1') do set "mtslNew=!mtslNew!%%A\n"
if defined outputDestination (
      >%~2 echo !mtslNew!
) else (
      echo !mtslNew!
)
exit /b
:sendUsage
echo Usage:
echo  %~n0 [^<file^>] ^<output^>
exit /b