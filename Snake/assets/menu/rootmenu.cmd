::output
echo Logged in as : %col_yellow%%playerName%%col_reset%
echo Language     : %col_yellow%%userLanguage%%col_reset%
echo Version      : %col_yellow%%gameVersion%%col_reset%
echo Logins       : %col_yellow%%joins%%col_reset%
echo Highscore    : %col_yellow%%highscore%%col_reset%
echo Directory    : %col_yellow%%cd%%col_reset%

echo.
echo %translation.rootmenu.information%
::prompt user button
choice /c qe /n >nul
cls

::get button input
if %errorlevel%==1 goto quit

if %errorlevel%==2 (
      echo %translation.rootmenu.commandlist%
      :rootInput
      set /p rootInput=%promptIcon%

      cd
      if not "!rootInput:name=!"=="!rootInput!" echo test
      
      if %rootInput%==exit (
            echo Quitting Root Console 
            goto :quit 
      ) else goto rootInput
)


:quit
cls
exit /b