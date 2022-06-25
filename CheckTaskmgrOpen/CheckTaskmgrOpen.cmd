@echo off
setlocal enabledelayedexpansion
setlocal enableextensions
>nul chcp 65001
set "integrated="
set "integrated=%~1"

:checkTaskmgr
for /f "tokens=*" %%A in ('tasklist /fi "imagename eq taskmgr.exe"') do (
      set "result=%%A"
      cls
      if not "!result:Taskmgr=!" equ "%%A" (
            if defined integrated (
                  echo running
            ) else (
                  echo [33m[%time:~0,-3%][0m TaskManager is running!
            )
      ) else (
            if defined integrated (
                  echo closed
            ) else (
                  echo [33m[%time:~0,-3%][0m TaskManager is not running!
            )
      )
)
if not defined integrated goto checkTaskmgr