@echo off
set bemindfulof=%1
set regex=%2
set string=%3
echo regex = %regex%
echo string= %string%
set remove=
REM "[[A-Za-z]*]"
REM "Seventh Son of a Seventh Son (2015 Remaster) [ZjphaXXEU9o].webm"
echo %bemindfulof%
echo:Hold on to your Horses,bitch!
echo:It's time for some token frenzy..
set whoami=%%i
set /a token=1
:loop
set /a found=0
for /f "tokens=%token% delims=%bemindfulof% " %%i in (%string%) do echo Token %token%=%%i&set /a found=1&echo "%%i"|findstr /r %regex% &&set remove=%%i
if defined remove if "%remove%" NEQ "" CALL set string=%%string:%remove%=%%&goto :end
if %found%==0 goto :eof
set /a token+=1
goto :loop
:end
echo %string%