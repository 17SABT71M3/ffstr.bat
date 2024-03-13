NOTE: < FINDSTR REGEX > is different in operation from regular expected regex. therefore please test your inputs and regex using FINDSTR independently to confirm the output/efficacy
_________

<b>Similarities with FINDSTR syntax</b>
<br>Findstr Syntax: 
`findstr </option> "[pattern]" "optional:filename"`
<br>Extract.bat Syntax:
`extract.bat </option> "delimiter" "[pattern]" "STRING"`

### Why the `FINDSTR` handle is used
Using this extra parameter/option gives us the freedom to use the different `Findstr` handles such as `/c` and `/i`. Remember if `/c` is used in combination with `/r` like `/rc` then the matching is a mix of literal string and regex. This is particularly useful but you should know more about the workings of the `Findstr` Regex on that.

### Regex Substitutes
This particular batch script has built-in substitutes for `findstr`'s REGEX certain short comings. For instance, you will find it difficult if u need to specify capital or lower letters. `Findstr` has a particular way of functioning that is different from normal regexes and by that there are certain shortcomings. Example-
```
C:\Users\Anil Bapna\Desktop>extract.bat /r . "^[a-z]" "HELo hello"
HELo
hello
```
Despite mentioning the lower range of [a-z] the result output is both letters starting with Capital H and lower h.
`Findstr` operates differently with such regexes. As such, There are substitutes built into this script for there to be a work around.
, namely
- `[Capital]`
- `[LOWER]`

REGEX Notes -

| Character       | Remarks          |
| --------------- | --------------- |
| \    | "\\\\"    |
| [   | if `/r` is used bracket must be closed to represent a valid character set inside it Eg. `"[abc]"`   |
| A   | `"[A]"` would represent capital A whereas either `"[a-z]"` or `"[A-Z]"` would match both lower and capital   |
| A or b   | `"[Ab]"` represents a character class and represents a single character Either capital A or lower b  |
| Space " "    | if you are looking for whitespace use " " and the `/c` option. (can be clubbed with the `/r` option for half regex half literal matches `/rc` )   |

### Script Syntax Quick Lookup
- The first parameter is the `FINDSTR` handle Eg. `/r`
- The second parameter is the delimiter
- The third parameter is the `FINDSTR`-compatible regex
- The fourth parameter is the STRING to extract substring from.


### What are Delimiters
They are used to separate strings into 'tokens'. Since the given string is split into individual sub-strings, then the pattern matching is done. Delimiters are  not part of the search hence ignored. You have to write the delimiter parameter. If "" is used as the delimiter (Meaning Nothing) then the whole string is treated as One String and there is no substring to extract from it. If you have a sentence then one possible delimiter can be WHITESPACE `" "`. If you have a string like `"https://www.yahoo.com/search?q=HELLO"` you may want to use "^=" as the delimiter is your looking for the sub-string `HELLO`. All characters that are escaped in batch scripts like `&` and `|` need to be escaped like `"^&"` and `"^|"` respectively for the script to work. You can specify more than one delimiters by combining them like - `"^& "` (contains the `&` character and space)

List of Delimiters that need escaping, not exhaustive:

| Character       | Syntax          |
| --------------- | --------------- |
| &    | "^&"    |
| \|   | "^\|"   |
| ^   | "^^"   |
| =   | "^="   |


### Output Examples  :newspaper:
- Example #1 ```extract.bat /r " " "^[Capital]" "Hello hollow oh so dear Mister Pierce"```

Output:
```
Hello
Mister
Pierce
```
- Example #2 ```extract.bat /r " " "^[LOWER]*$" "Hello hollow oh so dear Mister PierceX ------"```

Output:
```
hollow
oh
so
dear
------
```
- Example #3 ```extract.bat /r " " "[LOWER]" "Hello hollow oh so dear Mister PierceX ------"```

Output:
```
Hello
hollow
oh
so
dear
Mister
PierceX
------
```
- Example #4 ```extract.bat /r " " "[Capital]$" "Hello hollow oh so dear Mister PierceX ------"```

Output:
```
PierceX
```
- Example #5 ```extract.bat /c  "H"  " " "x x yH EL LO"```

Output:
```
x x y
 EL LO
```
- Example #6 ```extract.bat /e ";" "E" "HEEB;HXLP; EE;EEJO"```

Out of the Words HEEB, HXLP, EE, EEJO we are looking for the word ending (/e option used) 
with E.
Output:
```
 EE
```
Notice the leading space is preserved.

### Noob Heaven :hear_no_evil::hear_no_evil::hear_no_evil:
Simple usage in batch files.
- Example #1
```
set file_name="Seventh Son of a Seventh Son (2015 Remaster) [ZjphaXXEU9o]"
for /f "delims=" %%i in ('extract.bat /r " " "[[a-z]]" %file_name%') do set removable_part=%%i
CALL set file_name=%%filename:%removable_part%=%%
```
- Example #2
```
set file_name="Seventh Son of a Seventh Son (2015 Remaster) [ZjphaXXEU9o]"
for /f "delims=" %%i in ('extract.bat /r "()" "[1-2][0-9][0-9][0-9]" %file_name%') do set year=%%i
REM year of song is %year%
```
- Example #3
```
for /f "delims=" %%i in ('ver') do for /f "delims=" %%a in ('extract.bat /r "()[] " "^[0-9.]*$" "%%i"') do set ver=%%a
echo Windows Version is %ver%
```
- Example #4
```
set ipadr=1.1.1.1
for /f "tokens=*" %%i in ('ping -n %ipadr% ^| findstr /ir "Reply from" ^| find /i "ms"') do for /f "tokens=*" %%a in ('extract.bat /r "^<^>^= " "^[0-9]*ms$" "%i"') do echo %%a
REM 35ms
```
~<b>Known bugs:</b> It skips the leading spaces in strings,~

Praise The Lord !`✞` for helping me thru this Project
<br>(C) Readme . Rest in Peace `☮`
