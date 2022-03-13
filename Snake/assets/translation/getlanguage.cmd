::get available languges and save them to a variable
:getLanguages

del /f /q tabcomplete\*
echo Tabcomplete asset>tabcomplete\CANCEL
echo Tabcomplete asset>tabcomplete\REAPPLY
echo Tabcomplete asset>tabcomplete\RELOAD

for /f "tokens=1*delims=:" %%A in ('2^>nul dir ??_??.cmd /b^| findstr /berinc:".._..\.cmd"') do (
      set language[#]=%%A
      set language[%%A]=%%~nB
      echo Tabcomplete asset>tabcomplete\%%~nB
)
::tell the player how many languages there are and echo them
:echoLanguages
cls
if !language[#]! EQU 1 echo %translation.menuLanguage.singleAvailable1% !language[#]! %translation.menuLanguage.singleAvailable2%
if not !language[#]! EQU 1 echo %translation.menuLanguage.multipleAvailable1% !language[#]! %translation.menuLanguage.multipleAvailable2%


for /l %%A in (1,1,%language[#]%) do (
      echo  !language[%%A]!
)
echo.
::prompt the user for the language to use
echo %translation.menuLanguage.promptLanguage%
pushd tabcomplete
set /p languageInput=%promptIcon%
popd


::check if the inputted language is available
set languageAvailable=false

::check for normal language
if %languageAvailable%==false for /l %%A in (1,1,%language[#]%) do (
      if %languageInput%==!language[%%A]! (
            set languageAvailable=true
            set userLanguage=%languageInput%
      )
)

::switch languages
if %languageAvailable%==true (
      echo %translation.menuLanguage.switch%
      timeout /nobreak /t 2 >nul
      call setlanguage.cmd
)

::check for reload
if %languageAvailable%==false if %languageInput%==RELOAD (
      echo %translation.menuLanguage.reloading%
      timeout /nobreak /t 2 >nul
      set languageAvailable=true
      goto getLanguages
)

::check for reapply
if %languageAvailable%==false if %languageInput%==REAPPLY (
      echo %translation.menuLanguage.reapply%
      timeout /nobreak /t 2 >nul
      call %userLanguage%.cmd
      goto getLanguages
)

::check for cancel
if %languageAvailable%==false if %languageInput%==CANCEL (
      echo %translation.menuLanguage.cancel% %userLanguage%
      timeout /nobreak /t 2 >nul
      set languageAvailable=true
      exit /b
)

if %languageAvailable%==false (
      echo %translation.menuLanguage.notFound%
      timeout /nobreak /t 2 >nul
      cls
      goto echoLanguages
)


exit /b
:saveconfig

:important
set /p startupCommand=%promptIcon%
if not %startupCommand%==exit %startupCommand%
if not %startupCommand%==exit goto important
cls

exit /b