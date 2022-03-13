:display
::snake heading nigga
for %%A in (1,2,3,4,5,6,7,8) do echo    !snakeLine%%A!
if %joins%==1 echo %translation.menu.greetingHello% !playerName!%translation.menu.greetingFirstTime1%
if not %joins%==1 echo %translation.menu.greetingHello% !playerName!%translation.menu.greetingNotFirstTime1% %joins% %translation.menu.greetingNotFirstTime2%
if %playerName%==%root% echo Press F to enter root mode
if not %playerName%==%root% echo.

::play button selected
if %menuSelection%==0 (
      echo %col_green%%translation.menu.button.play1%%col_reset%
      echo %col_green%%translation.menu.button.play2%%col_reset%
      echo %col_green%%translation.menu.button.play3%%col_reset%
      echo.
      echo.
      echo %col_reset%%translation.menu.button.language1%
      echo %col_reset%%translation.menu.button.language2%
      echo %col_reset%%translation.menu.button.language3%
      echo.
      echo.
      echo %col_reset%%translation.menu.button.exit1%
      echo %col_reset%%translation.menu.button.exit2%
      echo %col_reset%%translation.menu.button.exit3%
)

::language button selected
if %menuSelection%==1 (
      echo %col_reset%%translation.menu.button.play1%
      echo %col_reset%%translation.menu.button.play2%
      echo %col_reset%%translation.menu.button.play3%
      echo.
      echo.
      echo %col_green%%translation.menu.button.language1%%col_reset%
      echo %col_green%%translation.menu.button.language2%%col_reset%
      echo %col_green%%translation.menu.button.language3%%col_reset%
      echo.
      echo.
      echo %col_reset%%translation.menu.button.exit1%%col_reset%
      echo %col_reset%%translation.menu.button.exit2%%col_reset%
      echo %col_reset%%translation.menu.button.exit3%%col_reset%
)

::exit button selected
if %menuSelection%==2 (
      echo %col_reset%%translation.menu.button.play1%
      echo %col_reset%%translation.menu.button.play2%
      echo %col_reset%%translation.menu.button.play3%
      echo.
      echo.
      echo %col_reset%%translation.menu.button.language1%
      echo %col_reset%%translation.menu.button.language2%
      echo %col_reset%%translation.menu.button.language3%
      echo.
      echo.
      echo %col_green%%translation.menu.button.exit1%%col_reset%
      echo %col_green%%translation.menu.button.exit2%%col_reset%
      echo %col_green%%translation.menu.button.exit3%%col_reset%
)


echo.
rem echo %menuSelection%
echo.
echo.
echo %translation.menu.information1%
echo %translation.menu.information2%

goto listener


:listener
::navigation buttons
choice /c wsadf /n >nul
cls


::up/down navigation
if %errorlevel%==1 set /a menuSelection=%menuSelection%-1
if %errorlevel%==2 set /a menuSelection=%menuSelection%+1

::proceed action
if %errorlevel%==4 if %menuSelection%==0 (
      set proceedToGame=true
      exit /b
)

if %errorlevel%==4 if %menuSelection%==1 (
      pushd translation
      call getlanguage.cmd
      cls
      popd
)

::root menu
if %errorlevel%==5 call menu\rootmenu.cmd

if %errorlevel%==4 if %menuSelection%==2 exit

::save to config
call saveconfig.cmd

::limit selection
if %menuSelection% LSS 0 set menuSelection=2
if %menuSelection% GTR 2 set menuSelection=0


goto display