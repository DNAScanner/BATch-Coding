::dev
set translation.game.yourHighscore=Your current highscore is:
set translation.game.yourScore=Your score is:
set translation.game.goodLuck=Good luck,

set score=1
set isRunning=false
for /l %%A in (1,1,25) do (
      set game.field%%A=%game.air%
      echo set game.field%%A=%game.air%
)

pause >nul

::snake "logo" and stats
for %%A in (1,2,3,4,5,6) do echo    !snakeShortLine%%A!
echo.
echo %translation.game.yourHighscore% %col_yellow%%highscore%%col_reset%

if not %isRunning%==true echo %translation.game.goodLuck% %col_yellow%%playerName%%col_reset%
if %isRunning%==true echo %translation.game.yourScore% %score%

set isRunning=true
echo %translation.pressAnyKey%
pause >nul

if %isRunning%==true (
      echo.
      echo.
      echo %game.field1%%game.field2%%game.field3%%game.field4%%game.field5%
      echo %game.field6%%game.field7%%game.field8%%game.field9%%game.field10%
      echo %game.field11%%game.field12%%game.field13%%game.field14%%game.field5%
      echo %game.field16%%game.field17%%game.field18%%game.field19%%game.field20%
      echo %game.field21%%game.field22%%game.field23%%game.field24%%game.field25%
)


pause >nul
cls