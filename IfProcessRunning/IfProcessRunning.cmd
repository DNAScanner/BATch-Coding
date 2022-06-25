@echo off
setlocal enabledelayedexpansion
setlocal enableextensions

set "pid=%~1"

if not defined pid (
      echo "Usage: %~n0 <PID>"
      exit /b
)

for /f "delims=" %%A in ('powershell -Command $process^=Get-Process -id !pid!^;Write-Host $process') do set "output=%%A"

if not "!output:System.=!" equ "!output!" (
      echo There is a process with [33m!pid![0m
) else (
      echo There is no process running with [33m!pid![0m
)

exit /b