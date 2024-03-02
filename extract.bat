@echo off
set finalupload=
set bemindfulof=%~2
 REM <WEL COME> /\Namastey0`:,
set handle=%~1


set regex=%3
  set regex=%regex:[Capital]=[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%
set regex=%regex:[^Capital]=[^ABCDEFGHIJKLMNOPQRSTUVWXYZ]%
  set regex=%regex:[^LOWER]=[^abcdefghijklmnopqrstuvwxyz]%
    set regex=%regex:[LOWER]=[abcdefghijklmnopqrstuvwxyz]%

if /i "%handle%"=="/c:" goto skip_handle_init
setlocal enabledelayedexpansion
set thirst=!handle!
set first=!thirst:~0,1!
if "!first!" NEQ "/" goto :printhelpmenu
set local=
for /l %%i in (1,1,5) do set something=!thirst:~%%i,1!&set local=!local! !something!
for %%i in (%local%) do (
set /a cool=0

if /i "&%%i&"=="&b&" set /a cool=1
if /i "&%%i&"=="&e&" set /a cool=1
if /i "&%%i&"=="&l&" set /a cool=1
if /i "&%%i&"=="&r&" set /a cool=1
if /i "&%%i&"=="&i&" set /a cool=1
if /i "&%%i&"=="&x&" set /a cool=1
if /i "&%%i&"=="&v&" set /a cool=1
if !cool!==0 goto :printhelpmenu
)
endlocal disabledelayedexpansion
goto _init
:printhelpmenu
echo:The following are valid FINDSTR handles in the context of this
echo:batch script:
echo:  /C:        Uses specified string as a literal search string.
echo:  /B         Matches pattern if at the beginning of a line.
echo:  /E         Matches pattern if at the end of a line.
echo:  /L         Uses search strings literally.
echo:  /R         Uses search strings as regular expressions.
echo:  /S         Searches for matching files in the current directory and all
echo:             subdirectories.
echo:  /I         Specifies that the search is not to be case-sensitive.
echo:  /X         Prints lines that match exactly.
echo:  /V         Prints only lines that do not contain a match.
echo:
echo:All above handles must be combined if using more than one.
echo:Eg. /bel OR /RI
echo:
echo:Not----^> /b /e /l OR /R /I
goto :eof
:_init

REM caution space sensitive code
set handle=%handle% 
:skip_handle_init
set string=%4
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
