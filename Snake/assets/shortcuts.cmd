if %~1==timeout call :timeout %~2

exit /b

:timeout
timeout /nobreak /t %~1 >nul