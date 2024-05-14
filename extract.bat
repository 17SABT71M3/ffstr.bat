@echo off
set finalupload=
set bemindfulof=%~2
 REM <WEL COME> /\Namastey0`:,
set handle=%~1


set regex=%3
  set regex=%regex:[CAPITAL]=[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%
    set regex=%regex:[lower]=[abcdefghijklmnopqrstuvwxyz]%

if /i "%handle%"=="/c:" goto endinit
setlocal enabledelayedexpansion
set thirst=!handle!
set first=!thirst:~0,1!
if "!first!" NEQ "/" goto :printhelpmenu
set local=
set /a cis=0
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
if /i "&%%i&"=="&?&" set /a cool=1&goto :printhelpmenu
if !cool!==0 goto :printhelpmenu
)
if %cis%==1 Endlocal&set handle=/%prepare%&goto endinit
endlocal disabledelayedexpansion
goto _init
:printhelpmenu
echo:
echo:Syntax-
echo:"%~nx0" [/option] [delimiter] ["pattern"] ["string"]
echo:The following are valid FINDSTR handles in the context of this
echo:batch script:
echo:  /C:        Uses the specified pattern as a literal search string. (Do not write
echo:             any string or pattern after colon. See "Syntax")
echo:  /B         Matches pattern if at the beginning.
echo:  /E         Matches pattern if at the end.
echo:  /L         Uses search strings literally.
echo:  /R         Uses search strings as regular expressions.
echo:  /I         Specifies that the search is not to be case-sensitive.
echo:  /X         Prints sub-strings that match exactly.
echo:  /V         Prints sub-strings that do not contain a match.
echo:
echo:All above handles must be combined if using more than one.
echo:Eg. /bel OR /RI
echo:
echo:Not----^> /b /e /l OR /R /I
echo:
if defined cool if "%cool%"=="1" echo: Delimiters using Symbols that need escaping must be 
if defined cool if "%cool%"=="1" echo: escaped.         Eg- "^&"
if defined cool if "%cool%"=="1" echo: "%~nx0" /?  ----^>Prints this help menu.
if defined cool if "%cool%"=="1" echo:
if defined cool if "%cool%"=="1" echo:@Lastly, I thank God.`
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

ReM (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((

REM echo Delimiter = "%bemindfulof% "
REM echo regex = %regex%
REM echo string= %string%

REM ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
REM SAMPLE PARAMETERS - - - - -|
REM                   . .  `\  | /
REM                    `    `\ |/
REM                         ` \/
REM .
REM "[[A-Za-z]*]"
REM "Seventh Son of a Seventh Son (2015 Remaster) [ZjphaXXEU9o].webm"
rem echo:be mindful all you sons!!
rem echo:Hold on to your Horses.......!
rem echo:It's time for some token frenzy..
set whoami=%%i
set /a token=1
set /a continue=0
:loop
set /a uploadtaken=1
set /a found=0
set upload=

for /f "tokens=%token% delims=%bemindfulof%" %%i in (%string%) do set /a found=1&echo %%i|findstr %handle%%regex% >NUL&&(set upload="%%i"&set /a uploadtaken=0)
if %uploadtaken% NEQ 1 goto continue
for /f "tokens=%token% delims=%bemindfulof%" %%i in (%string%) do set /a found=1&echo "%%i"|findstr %handle%%regex% >NUL&&(set upload="%%i"&set /a uploadtaken=0)
:continue
if %uploadtaken%==0 for /f "delims=" %%i in (%upload%) DO for /f "delims=" %%a in ('echo:%%i') do echo %%a
if %found%==0  goto :eof
set /a token+=1
goto :loop
:end
::SWEET::DREAMS`
