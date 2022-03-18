::output
echo Logged in as : %col_yellow%%playerName%%col_reset%
echo Language     : %col_yellow%%userLanguage%%col_reset%
echo Version      : %col_yellow%%gameVersion%%col_reset%
echo Logins       : %col_yellow%%joins%%col_reset%
echo Highscore    : %col_yellow%%highscore%%col_reset%
echo Directory    : %col_yellow%%gameDirectory%%col_reset%

echo.
echo %translation.rootmenu.information%
::prompt user button
choice /c qe /n >nul
cls

::get button input
if %errorlevel%==1 goto quit

if %errorlevel%==2 (
      pushd menu\rootmenu\tabcomplete
      del /f /q *
      echo Tabcomplete asset>"DIRECTORY"
      echo Tabcomplete asset>"NAME"
      echo Tabcomplete asset>"CLEAR"
      echo Tabcomplete asset>"HELP"
      echo Tabcomplete asset>"EXIT"

      echo Tabcomplete asset>"RESET"
      echo Tabcomplete asset>"SET"

      :listCommands
      echo %translation.rootmenu.commandlist% DIRECTORY EXIT NAME CLEAR%col_reset%

      :rootInput
      set /p rootInput=%promptIcon%

      if "!rootInput!"=="DIRECTORY" (
            echo %translation.rootmenu.directory% %col_yellow%%gameDirectory%%col_reset%
            goto rootInput
      )

      if not "!rootInput:NAME SET =!"=="!rootInput!" (
            for /f "tokens=3 delims= " %%A in ("!rootInput!") do (
                  set playerName=%%A
                  echo %translation.rootmenu.setname% %col_yellow%%%A%col_reset%
                  goto rootInput
            )
      )

      if "!rootInput!"=="NAME RESET" (
            set "playerName="
            echo %translation.rootmenu.reset%
            goto rootInput
      )

      
      if "!rootInput!"=="CLEAR" (
            cls
            goto listCommands
      )

      if not "!rootInput:HELP =!"=="!rootInput!" (
            for /f "tokens=2 delims= " %%A in ("!rootInput!") do (
                  pushd ..
                  call help.cmd %%A
                  popd
                  goto rootInput
            )
      )

      if "!rootInput!"=="EXIT" (
            echo Quitting Root Console
            goto quit 
      )

      echo %translation.rootmenu.commandNotFound% !rootInput! %col_reset%
      goto rootInput

)


:quit
popd
cls
exit /b