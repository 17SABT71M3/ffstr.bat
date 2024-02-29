@echo off
set finalupload=
set bemindfulof=%~1
set regex=%2
  set regex=%regex:[Capital]=[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%
set regex=%regex:[^Capital]=[^ABCDEFGHIJKLMNOPQRSTUVWXYZ]%
  set regex=%regex:[^LOWER]=[^abcdefghijklmnopqrstuvwxyz]%
    set regex=%regex:[LOWER]=[abcdefghijklmnopqrstuvwxyz]%
set string=%3
set string=%string:^=^^%
set string=%string:|=^|%
set string=%string:&=^&%
ReM if "%4" NEQ "" echo %4|findstr /r "^/[0-9][0-9]*$"
REM echo Delimiter = "%bemindfulof% "
REM echo regex = %regex%
REM echo string= %string%
set remove=
REM ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
REM SAMPLE PARAMETERS ------ |
REM                   . .  \ |/
REM                    `    \/
REM .
REM "[[A-Za-z]*]"
REM "Seventh Son of a Seventh Son (2015 Remaster) [ZjphaXXEU9o].webm"
rem be mindful all you sons!!
rem echo:Hold on to your Horses.......!
rem echo:It's time for some token frenzy..
set whoami=%%i
set /a token=1
set /a continue=0
:loop
set /a uploadtaken=1
set /a found=0
set upload=
for /f "tokens=%token% delims=%bemindfulof% " %%i in (%string%) do set /a found=1&echo %%i|findstr /r %regex% >NUL&&(set upload="%%i"&set /a uploadtaken=0)
if %uploadtaken% NEQ 1 goto continue
for /f "tokens=%token% delims=%bemindfulof% " %%i in (%string%) do set /a found=1&echo "%%i"|findstr /r %regex% >NUL&&(set upload="%%i"&set /a uploadtaken=0)
:continue
if %uploadtaken%==0 for /f "tokens=*" %%i in (%upload%) DO for /f "tokens=*" %%a in ('echo %%i') do echo %%a
if %found%==0 goto :eof
set /a token+=1
goto :loop
:end
::SWEET::DREAMS`
