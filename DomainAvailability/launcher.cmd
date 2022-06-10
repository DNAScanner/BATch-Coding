@echo off
setlocal enabledelayedexpansion
setlocal enableextensions
>nul chcp 65001

set "colorBlack=[30m"
set "colorRed=[31m"
set "colorGreen=[32m"
set "colorYellow=[33m"
set "colorBlue=[34m"
set "colorMagenta=[35m"
set "colorCyan=[36m"
set "colorWhite=[37m"
set "colorReset=[0m"

set /a "checkSeperatorLength=0"

set "tld=com net org gov info biz co de ch fr uk"
set "tld=ac ad ae af ag ai al am ao aq ar arpa as at au aw ax az ba bb bd be bf bg bh bi bit bitnet bj bl bm bn bo bq br bs bt bv bw by bz ca cc cd cf cg ch ci ck cl cm cn co cr cu cv cw cx cy cz de dj dk dm do dz ec ee eg eh er es et eu ex fi fj fk fm fo fr ga gb gd ge gf gg gh gi gl gm gn gp gq gr gs gt gu gw gy hk hm hn hr ht hu id ie il im in invalid io iq ir is it je jm jo jp ke kg kh ki km kn kp kr kw ky kz la lb lc li lk local localhost lr ls lt lu lv ly ma mc md me mf mg mh mk ml mm mn mo mp mq mr ms mt mu mv mw mx my mz na nato nc ne nf ng ni nl no np nr nu nz om onion pa pe pf pg ph pk pl pm pn pr ps pt pw py qa re ro root rs ru rw sa sb sc sd se sg sh si sj sk sl sm sn so sr ss st su sv sx sy sz tc td test tf tg th tj tk tl tm tn to tr tt tv tw tz ua ug uk us uucp uy uz va vc ve vg vi vn vu wf ws ye yt za zm zw"

cls
set /p "domain=Enter domain(-s) (wo/ TLD) to check (seperate by SPACE): !colorYellow!" & <nul set /p "_=!colorReset!"
set /p "tld=Enter the TLDs you'd like to check (seperate by SPACE, press ENTER for default): !colorYellow!" & <nul set /p "_=!colorReset!"
set "startTime=%time:~0,-3%"

set "checkSeperator=--------------------DOMAIN--"
for %%A in (!domain!) do (
      for %%B in (!tld!) do (
            call :getLength "%%A.%%B" checkSeperatorLengthGet
            if !checkSeperatorLengthGet! gtr !checkSeperatorLength! (
                  set "checkSeperatorLength=!checkSeperatorLengthGet!"
            )
      )
)
for /l %%A in (1,1,!checkSeperatorLength!) do set "checkSeperator=!checkSeperator!-"
set "checkSeperator=!checkSeperator:~0,-8!STATUS!checkSeperator:~-2!"


echo !checkSeperator!
for %%A in (!domain!) do (
      for %%B in (!tld!) do (
            set /a "placeStatus=18 + !checkSeperatorLength!"
            set "%%A.%%B_success="
            <nul set /p "_=Checking domain !colorYellow!%%A.%%B!colorReset!"
            title %%A.%%B
            for /f "tokens=*" %%C in ('ping %%A.%%B -l 1 -n 1 -w 750 ^| find "time"') do set "%%A.%%B_success=%%C"
            if "!%%A.%%B_success!" equ "" (
                  echo [!placeStatus!G ^|  !colorGreen!free!colorReset!
            ) else (
                  echo [!placeStatus!G ^|  !colorRed!taken!colorReset!
            )
      )

      echo !checkSeperator!
)

echo.
set "endTime=%time:~0,-3%"
echo Finished checking - Started at !colorYellow!!startTime!!colorReset! and ended at !colorYellow!!endTime!!colorReset!

>nul pause

exit /b

:getLength
set "s=#%~1"
set "len=0"
for %%N in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
	if "!s:~%%N,1!" neq "" (
		set /a "len+=%%N"
		set "s=!s:~%%N!"
	)
)
if "%~2" neq "" ( set /a "%~2=%len%" ) else ( echo %len% )
exit /b