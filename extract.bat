@echo off
set finalupload=
set bemindfulof=%~1
set regex=%2
set regex=%regex:[Capital]=[A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z]%
set string=%3
set demeaner=%4
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
set endstring=" "
set /a taken=1
:loop
set /a found=0
set upload=
for /f "tokens=%token% delims=%bemindfulof% " %%i in (%string%) do set /a found=1&echo %%i|findstr /r %regex% >NUL&&(if %taken% NEQ 0 set upload="%%i")
:continue
REM echo if "%upload%" NEQ "" if %taken% NEQ 0 
if "%upload%" NEQ "" if %taken% NEQ 0 set /a taken=0&set finalupload=%upload%& REM echo HAHA _
if %found%==0 goto :end
set /a token+=1
goto :loop
:end
echo %finalupload%