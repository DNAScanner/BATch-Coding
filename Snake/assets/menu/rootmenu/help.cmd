set rootmenuHelpInput=%~1


if "%rootmenuHelpInput%"=="DIRECTORY" (
      echo %translation.rootmenu.usage.directory%
      exit /b
)

if "%rootmenuHelpInput%"=="EXIT" (
      echo %translation.rootmenu.usage.exit%
      exit /b
)

if "%rootmenuHelpInput%"=="NAME" (
      echo %translation.rootmenu.usage.name%
      exit /b
)

if "%rootmenuHelpInput%"=="CLEAR" (
      echo %translation.rootmenu.usage.clear%
      exit /b
)

if "%rootmenuHelpInput%"=="GAY" (
      echo u gay
      exit /b
)
