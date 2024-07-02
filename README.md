<p align="center"><img src="https://github.com/17SABT71M3/ffstr.bat/blob/475e50d4692955fa92a766266b24a0869b84a432/the_line.png"><img>
<br>✞ Live Guilt Free and Without Pressure<sup><a href="#abcd">#</a></sup></p>

NOTE: < FINDSTR REGEX > is different in operation from regular expected regex. therefore please test your inputs and regex using FINDSTR independently to confirm the output/efficacy
_________

<b>syntax</b>
<br>Findstr Syntax: 
`findstr </option> "[pattern]" "optional:filename"`
<br>Extract.bat Syntax:
`extract.bat </option> "delimiter" "[pattern]" "STRING"`
<br><b>limitation</b> Cannot work with a string containing double quotes `"`

### Why the `FINDSTR` handle is used
Using this extra parameter/option gives us the freedom to use the different `Findstr` handles such as `/c` and `/i`. Remember if `/c` is used in combination with `/r` like `/rc` then the matching is a mix of literal string and regex. This is particularly useful but you should know more about the workings of the `Findstr` Regex on that. (See: <a href="#findstr">testing using Findstr</a>)

### Regex Substitutes
This particular batch script has built-in substitutes for `findstr`'s REGEX certain short comings. in particular, capital or lower letters. `Findstr` has a particular way of functioning that is different from normal regexes there are certain shortcomings. Example-
```
C:\Users\Anil Bapna\Desktop>extract.bat /r " " "^[a-z]" "HELo hello"
HELo
hello
```
Despite the lower case of [a-z] the result output is both letters starting with Capital H and lower h.
`Findstr` operates differently with such regexes. There are substitutes built into this script for there to be a work around.
, namely
- `[CAPITAL]`
- `[lower]`

REGEX Notes -

| Character       | Remarks          |
| --------------- | --------------- |
| \    | "\\\\"    |
| [   | if `/r` is used bracket must be closed `]` to represent a valid character set inside it Eg. `"[abc]"`. But there are exceptions like: `"[]]"` is a valid pattern and will not return an error. If u want to specify a literal `[` character try escaping it: `\[`  |
| A   | `"[A]"` would represent capital A whereas either `"[a-z]"` or `"[A-Z]"` would match both lower and capital   |
| A or b   | `"[Ab]"` represents a character class and represents a single character Either capital A or lower b  |
| Space " "    | if you are looking for whitespace " " use the `/c` option. (can be clubbed with the `/r` option for half regex half literal matches `/rc` )   |

### Script Syntax Quick Lookup
- The first parameter is the `FINDSTR` handle Eg. `/r`
- The second parameter is the delimiter
- The third parameter is the `FINDSTR`-compatible regex
- The fourth parameter is the STRING to extract substring from.


### What are Delimiters
They are used to separate strings into 'tokens'. Since the given string is split into individual sub-strings, then the pattern matching is done. Delimiters are  not part of the search hence ignored. You have to write the delimiter parameter. If "" is used as the delimiter (Meaning Nothing) then the whole string is treated as One String and there is no substring to extract from it. If you have a sentence then one possible delimiter can be WHITESPACE `" "`. If you have a string like `"https://www.yahoo.com/search?q=HELLO"` you may want to use "^=" as the delimiter is your looking for the sub-string `HELLO`. All characters that are escaped in batch scripts like `&` and `|` need to be escaped like `"^&"` and `"^|"` respectively for the script to work. You can specify more than one delimiters by combining them like `"^& "` (contains the `&` character and space)

List of Delimiters that need escaping, not exhaustive:

| Character       | Syntax          |
| --------------- | --------------- |
| &    | "^&"    |
| \|   | "^\|"   |
| ^   | "^^"   |
| =   | "^="   |

<b>NOTE:</b>If you are using space " " as a delimiter in addition to another delimiter/s
please make sure to keep space at the end of the expression. For eg. `"() "` contains
the delimiters `(`  `)`  and whitespace " ".

### <a id="findstr"></a>Testing using `findstr`
Make your own tests using the appropriate handle/option to test whether your regex/pattern works to find your sub-string.
Examples -
```
echo sub-string|findstr /r "pattern"
echo sub-string|findstr /c:"literal_pattern"
echo sub-string|findstr /Ic:"Pattern"
```

### Output Examples  :newspaper:
- Example #1 ```extract.bat /r " " "^[CAPITAL]" "Hello hollow oh so dear Mister Pierce"```

Output:
```
Hello
Mister
Pierce
```
- Example #2 ```extract.bat /r " " "^[lower]*$" "Hello hollow oh so dear Mister PierceX ------"```

Output:
```
hollow
oh
so
dear
------
```
- Example #3 ```extract.bat /c  "H"  " " "x x yH EL LO"```
<br>Note: the delimiter here used is "H"

Output:
```
x x y
 EL LO
```
- Example #4 ```extract.bat /e ";" "E" "HEEB;HXLP; EE;EEJO"```
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
for /f "delims=" %%i in ('extract.bat /r " " "[[a-z]]" %file_name%') do set removable_part=%%i
CALL set file_name=%%filename:%removable_part%=%%
```
- Example #2
```
set file_name="Seventh Son of a Seventh Son (2015 Remaster) [ZjphaXXEU9o]"
for /f "delims=" %%i in ('extract.bat /r " ()" "[1-2][0-9][0-9][0-9]" %file_name%') do set year=%%i
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

<a id="abcd"><sup>#</a></sup>Praise The Lord !`✞` xxxfor helping me thru this Project
<br>(C) Readme . Rest in Peace `☮`
<br><b>Pray for me!!
