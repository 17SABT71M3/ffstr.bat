< FINDSTR REGEX > is different in operation from regular expected regex. therefore please test your inputs and regex using FINDSTR independently to confirm the output/efficacy

Let's delve into the workings of the regex itself:

```C:\Users\Anil Bapna\Desktop>extract.bat . "[a-z]" "HELo"```
- The first parameter is the `FINDSTR` handle Eg. `/r`
- The second parameter is the delimiter
- The third parameter is the `FINDSTR`-compatible regex
- The fourth parameter is the STRING to extract substring from.

This particular batch script has built-in substitutes for `finstr`'s certain short comings. For instance, you will find it difficult if u need to specify capital or lower letters. `Findstr` has a particular way of functioning that is different from normal regexes. Example-
```
C:\Users\Anil Bapna\Desktop>extract.bat /r . "^[a-z]" "HELo hello"
HELo
hello
```
`Findstr` operates differently with CAPITAL and LOWER Case regexes.
There are two substitutes defined in the batch script, namely
- `[Capital]`
- `[LOWER]`



### Delimiters
Delimiters are symbols that are not part of the search. They are used to separate strings into 'tokens'. You have to write something as the delimiter parameter. If you want to continue using space write the delimiter as `" "`.
Delimiters like `&` and `|` must always be escaped like `"^&"` and `"^|"` respectively.

### Wi-ki  :newspaper:
- Example #1 ```extract.bat /r " " "^[Capital]" "Hello hollow oh so dear Mister Pierce"```

Output:
```
Hello
Mister
Pierce
```
- Example #2 ```extract.bat /r " " "^[^Capital]*$" "Hello hollow oh so dear Mister PierceX ------"```

Output:
```
hollow
oh
so
dear
------
```
- Example #3 ```extract.bat /r " " "[^Capital]" "Hello hollow oh so dear Mister PierceX ------"```

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
- Example #5 ```extract.bat /c:  "H"  " " "x x yH EL LO"```

Output:
```
x x y
 EL LO
```

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
~<b>Known bugs:</b> It skips the leading spaces in strings,~

Praise The Lord !`✞` for helping me thru this Project
<br>(C) Readme . Rest in Peace `☮`
