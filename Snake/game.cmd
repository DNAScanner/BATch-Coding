@echo off
::dont change /\ else u will probably regret it
setlocal EnableDelayedExpansion
set gameVersion=0.0.89
set gameDirectory=%cd%
call assets\translation\codes.cmd

::read config
if exist assets\config.cmd call assets\config.cmd

::define undefined definered variable
if not defined userLanguage set userLanguage=en_us
if not defined highscore set highscore=0
if not defined joins set joins=1

::set language
pushd assets\translation
call setlanguage.cmd
popd

::count join
set /a joins=%joins%+1

::title
title %translation.title%

::Fullscreen recommendation
echo %translation.fullscreenMessage1%
echo %translation.fullscreenMessage2%
echo %translation.fullscreenMessage3%
timeout /nobreak /t 3 >nul
echo.
echo.
echo.


::ask player for name
if not defined playerName (
      echo %translation.menu.greeting%
      set /p playerName=%promptIcon%
      if !playerName!==%root% echo Welcome back admin %col_yellow%%root%%col_reset%!
      if not !playerName!==%root% echo %translation.menu.greetingSubmitted1% !playerName!%translation.menu.greetingSubmitted2%
      timeout /nobreak /t 4 >nul
)
cls

:menu
::Menu
set menuSelection=0
pushd assets
call menu\main.cmd
popd

:game
::Game
if %proceedToGame%==true (
      pushd assets 
      call game\display.cmd
      popd
)

goto menu

pause