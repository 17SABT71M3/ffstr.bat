@echo off
set finalupload=
set bemindfulof=%~1
 REM <WEL COME> /\Namastey0`:,
set handle=%~2
set cool=0

set regex=%3
  set regex=%regex:[CAPITAL]=[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%
    set regex=%regex:[lower]=[abcdefghijklmnopqrstuvwxyz]%

if /i "%handle%"=="/c:" goto endinit
setlocal enabledelayedexpansion
set thirst=!handle!

set local=
set /a cis=0
set helphim=0
for /l %%i in (1,1,10) do set something=!thirst:~%%i,1!&(if /i "&!something!&" =="&?&" set /a cool=1&goto :printhelpmenu)&(if /i "&!something!&" =="&c&" set /a cis=1)&if /i "&!something!&" NEQ "&c&" if "&!something!&" NEQ "&:&" set local=!local! !something!
set prepare=
if %cis%==1 set local=!local! c:
if %cis%==1 for %%i in (%local%) do set prepare=!prepare!%%i
for %%i in (%local%) do (
set /a cool=0
if /i "&%%i&"=="&c:&" set /a cool=1
if /i "&%%i&"=="&b&"  set /a cool=1
if /i "&%%i&"=="&e&"  set /a cool=1
if /i "&%%i&"=="&l&"  set /a cool=1
if /i "&%%i&"=="&r&"  set /a cool=1
if /i "&%%i&"=="&i&"  set /a cool=1
if /i "&%%i&"=="&x&"  set /a cool=1
if /i "&%%i&"=="&v&"  set /a cool=1
if !cool!==0 goto :printhelpmenu
)
if %cis%==1 Endlocal&set handle=/%prepare%&goto endinit
endlocal disabledelayedexpansion
goto _init
:printhelpmenu
if "%bemindfulof%"=="/?" set /a cool=1
if "%bemindfulof%"=="/h" goto authorinfo
echo:
echo:Syntax-
echo:"%~nx0" [delimiter] [/option] ["pattern"] ["string"] {OPTIONAL:[/last][/reverse]}
echo:The following are valid FINDSTR handles in the context of this
echo:batch script:
echo:  /C:        Uses the specified pattern as a literal search string. (Do not write
echo:             any string or pattern after colon. See "Syntax")
echo:  /B         Matches pattern at the beginning.
echo:  /E         Matches pattern at the end.
echo:  /L         Uses search strings literally.
echo:  /R         Uses search strings as regular expressions.
echo:  /I         The search is case-insensitive.
echo:  /X         Print sub-strings if match exactly.
echo:  /V         Print sub-strings that do not contain a match.
echo:  /?         help menu
echo:  /h         author information
echo:
echo:All above handles must be combined if using more than one.
echo:Eg. /bel OR /RI
echo:
echo:Not----^> /b /e /l OR /R /I
echo:
if %cool%==1 echo: The [pattern] is used to search sub-strings in the given
if %cool%==1 echo: [string].
if %cool%==1 echo:
if %cool%==1 echo: Delimiters using Symbols that need escaping must be 
if %cool%==1 echo: escaped.         Eg- "^&"
if %cool%==1 echo: "%~nx0" /?  ----^>Prints this help menu.
if %cool%==1 echo:
goto :eof
:authorinfo
echo:Name: Puneet Bapna
echo:Twitter:
echo:
echo: Lastly, I thank God
goto :eof
:_init
REM caution space sensitive code
set handle=%handle% 
:endinit
set string=%4
if [%string%]==[] goto printhelpmenu
set string=%string:^=^^%
set string=%string:|=^|%
set string=%string:&=^&%
set string=%string:>=^>%
set string=%string:<=^<%

set reverse=0
set last=0
set onlyonce=1
if "%~5" NEQ "" if "%~5"=="/reverse" (set reverse=1) else (set reverse=0)
if "%~5" NEQ "" if "%~5"=="/last" (set last=1) else (set last=0)


REM echo Delimiter = "%bemindfulof% "
REM echo regex = %regex%
REM echo string= %string%


REM "[[A-Za-z]*]"
REM "Seventh Son of a Seventh Son"

rem echo:be mindful all you sons!!
rem echo:Hold on to your Horses.......!

rem echo:It's time for some token frenzy..
rem echo:HalleLuyah

set whoami=%%i
set /a token=1
set /a continue=0

goto loop
:see
if %found%==0  goto :eof
if %uploadtaken%==0 if %last%==1 set lastupload=%upload%
exit /b
:printonce
if %onlyonce%==1 for /f "delims=" %%i in (%lastupload%) DO for /f "delims=" %%a in ('echo:%%i') do echo %%a
set /a onlyonce=0
exit /b
:loop
set /a uploadtaken=1
set /a found=0

set upload=

for /f "tokens=%token% delims=%bemindfulof%" %%i in (%string%) do set /a found=1&echo %%i|findstr %handle%%regex% >NUL&&(set upload="%%i"&set /a uploadtaken=0)

:continue
call :see

set /a token+=1
if %reverse%==1 if %uploadtaken%==0 for /f "delims=" %%i in (%upload%) DO for /f "delims=" %%a in ('echo:%%i') do call :loop & echo %%a
if %last%==1 if %uploadtaken%==0 call :loop & call :printonce
if %reverse%==0 if %last%==0 if %uploadtaken%==0  for /f "delims=" %%i in (%upload%) DO for /f "delims=" %%a in ('echo:%%i') do echo:%%a
if %found%==1 goto loop

:end
::SWEET::DREAMS`