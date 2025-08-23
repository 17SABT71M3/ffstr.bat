<SUP>
<h4>SAMPLE CODES</h4>

```
::sample1
set "string=abc 123"
for /f "delims=" %%i in ('extract.bat " " /r  "[[a-z]]" %string%') do set match=%%i
echo %match%
REM OUTPUT is mentioned below
REM abc
::sample2
set sentence="Seventh Son of a Seventh Son (2015 Remaster) [ZjphaXXEU9o]"
for /f "delims=" %%i in ('extract.bat " " /r  "[[a-z]]" %sentence%') do set removable_word=%%i
echo %removable_word%
REM OUTPUT is mentioned below
REM [ZjphaXXEU9o]
```
 </SUP>
________
_Thanks for visiting !!_
 </p>

<br><b>Extract.bat Syntax:</b>
"extract.bat" [delimiter] [/option] ["pattern"] ["string"] {OPTIONAL:[/last][/reverse]}


### Now supports stdin usage (warning included)
<font size=15><b>Now supports read from stdin like:</font></b>
<br>`echo String hello here without double-quote|extract.bat " " /r "[-]"`

_Conditions for above (**stdin**) usage_: <br>1. string being echoed must not contain double quotes
<br>2. special symbols can be DOUBLE escaped (eg.`^^^&`) but you will have to test the code even after to check for unexpected results and/or errors. It is recommended to NOT USE them and remove them from the string (`&^|><"` See Tip below)

Tip: Avoid usage with **stdin** if string contains offensive characters. (mentioned above)

### `findstr` tests
Make your own tests using the appropriate handle/option to test whether your regex/pattern works to find your sub-string.
Examples -
```
echo [YOUR-SUB-STRING]|findstr /r "[Regex pattern]"
echo [YOUR-SUB-STRING]|findstr /c:"[literal pattern with/without additional regex patterns]"
echo [YOUR-SUB-STRING]|findstr /Ic:"[casE inSensitive PattErn]"
```

### Study `FINDSTR` options to reference in the syntax
<br>Findstr Syntax: findstr </option> "[pattern]" "optional:filename"<br>
The `extract.bat` and `findstr`'s first (`</option>`) parameter are the same. Except in the script `extract.bat` multiple options like `/r /c`  are combined  `/rc`. There is also one more difference: use `/c` instead of `/c:` and strictly follow the syntax of `extract.bat`

### Regex additions in addition to findstr's regex pattern
This particular batch script has built-in substitutes for `findstr`'s missing regex support. 
Capital or lower letters. 
`Findstr` has a particular way of functioning that is different from normal regexes that it does not work for upper/lower case letters.
These substitutes can be used:-
- `[CAPITAL]` this will match all uppercase letters only
- `[lower]` this will match all lowercase letters only


### Tips on using findstr's regex pattern -

| Character       | Remarks          |
| --------------- | --------------- |
| \    | "\\\\"    |
| [   | if `/r` is used bracket must be closed `]` to represent a valid character set inside it Eg. `"[abc]"`. But there are exceptions like: `"[]]"` is a valid pattern and will not return an error. If u want to specify a literal `[` character try escaping it: `\[`  |
| A   | `"[A]"` would represent capital A whereas either `"[a-z]"` or `"[A-Z]"` would match both lower and capital   |
| A or b   | `"[Ab]"` represents a character class and represents a single character Either capital A or lower b  |
| Space " "    | if you are looking for whitespace " " use the `/c` option. (can be clubbed with the `/r` option for half regex half literal matches `/rc` )   |

### Script Syntax Quick Review
- The first parameter is the delimiter
- The second parameter is the `FINDSTR` handle Eg. `/r`
- The third parameter is the `FINDSTR`-compatible regex
- The fourth parameter is the STRING to extract substring from.

<h1>Noob section</h1>
### What are Delimiters
They are used to separate strings into 'tokens'. Since the given string is split into individual sub-strings, only then the pattern matching is done. Delimiters are  not part of the search hence ignored. You must write the delimiter parameter. If "" is used as the delimiter (Meaning Nothing) then the whole string is treated as One String and there is no substring to extract from it. If you have a sentence containing words which you would like to search, one possible delimiter is WHITESPACE `" "`. If you have a string like `"https://www.yahoo.com/search?q=HELLO"` you may want to use "=" as the delimiter is your looking for the sub-string `HELLO`. 
____________

### Output Examples  :newspaper:
- Example #1 ```extract.bat " " /r  "^[CAPITAL]" "Hello hollow oh so dear Mister Pierce"```

Output:
```
Hello
Mister
Pierce
```
- Example #2 ```extract.bat " " /r "^[lower]*$" "Hello hollow oh so dear Mister PierceX ------"```

Output:
```
hollow
oh
so
dear
------
```
- Example #3 ```extract.bat  "H"  /c " " "x x yH EL LO"```
<br>Note: the delimiter here used is "H"

Output:
```
x x y
 EL LO
```
- Example #4 ```extract.bat ";" /e "E" "HEEB;HXLP; EE;EEJO"```
<br>Note: Out of the Words HEEB, HXLP, EE, EEJO we are looking for the word ending (/e option used) 
with E.

Output:
```
 EE
```
Notice the leading space is preserved.

### Noob Heaven :hear_no_evil::hear_no_evil:🥳
Simple usage in batch files.
- Example #1
```
set file_name="Seventh Son of a Seventh Son (2015 Remaster) [ZjphaXXEU9o]"
for /f "delims=" %%i in ('extract.bat " " /r "[[a-z]]" %file_name%') do set removable_part=%%i
REM removable_part=[ZjphaXXEU9o]
CALL set file_name=%%filename:%removable_part%=%%
```
- Example #2
```
set file_name="Seventh Son of a Seventh Son (2015 Remaster) [ZjphaXXEU9o]"
for /f "delims=" %%i in ('extract.bat " ()" /r "[1-2][0-9][0-9][0-9]" %file_name%') do set year=%%i
REM year of song is %year%
```
- Example #3
```
for /f "delims=" %%i in ('ver') do for /f "delims=" %%a in ('extract.bat "()[] " /r "^[0-9.]*$" "%%i"') do set ver=%%a
echo Windows Version is %ver%
```
- Example #4
```
set url=https://www.yahoo.com/search?q=HELLO+MISTER
for /f "tokens=*" %%i in ('extract.bat "=" /r "[a-z]" "%url%" /last') do set search_term=%%i
REM set search_term=HELLO+MISTER
```
- Example #5
```
set url=https://www.youtube.com/watch?v=bhH5M_HH2k4
for /f "tokens=*" %%i in ('extract.bat "=" /r "[a-z0-9]" "%url%" /last') do set video_id=%%i
REM video_id bhH5M_HH2k4
```
- Example #6
```
set ipadr=1.1.1.1
for /f "tokens=*" %%i in ('ping -n %ipadr% ^| findstr /ir "Reply from" ^| find /i "ms"') do for /f "tokens=*" %%a in ('extract.bat "^<^>^= " /r  "^[0-9]*ms$" "%i"') do echo %%a
REM 35ms
```
- Example #7<br>
`C:\Users\Anil Bapna\Desktop>extract.bat "-" /c " " "my-name-is puneet-notwhatyouthink"`<br>output:<br>
`is puneet`<br>this command searches for the literal space ` ` using the `/c` handle and the delimiter `-` (the delimiter is the break up character) 

NOTE: < FINDSTR REGEX > is different in operation from regular expected regex. therefore please test your inputs and regex using FINDSTR independently to confirm the output/efficacy
<h1> Final apologies</h1>
i am revisiting this page (not the project) and find the code to be miserably planned. this script hangs (actually it is waiting for stdin input) if no arguments are provided. my apologies for such shoddy work. barring that fact, it still works. i can't go back and correct it at this point in time. please bear with us, and modify according to your use case (see license)

Praise The Lord ! `✞` xxxfor helping me thru this Project
<br>(C) Readme . Rest in Peace `☮`
<br>Pray for me!!
<br>✞ Live Guilt Free and Without Pressure<sup><a href="#abcd">#</a></sup></p>
