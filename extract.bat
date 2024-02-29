@echo off
set finalupload=
set bemindfulof=%~1
set regex=%2
set regex=%regex:[Capital]=[A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z]%
set string=%3
set string=%string:|=^|%
ReM if "%4" NEQ "" echo %4|findstr /r "^/[0-9][0-9]*$"
REM echo Delimiter = "%bemindfulof% "
REM echo demeaner=x%demeaner%x
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
rem echo %bemindfulof%
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
:continue
if %uploadtaken%==0 echo %upload%
if %found%==0 goto :eof
set /a token+=1
goto :loop
:end
echo %upload%