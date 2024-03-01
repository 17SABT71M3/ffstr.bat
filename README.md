< FINDSTR REGEX > is different in operation from regular expected regex. therefore please test your inputs and regex using FINDSTR independently to confirm the output/efficacy

Let's delve into the workings of the regex itself:

```C:\Users\Anil Bapna\Desktop>extract.bat . "[a-z]" "HELo"```
- The first parameter is the delimiter
- The second parameter is the `FINDSTR`-compatible regex
- The Third parameter is the STRING to extract substring from.

This particular batch script has built-in substitutes for `finstr`'s certain short comings. For instance, you will find it difficult if u need to specify capital or lower letters. `Findstr` has a particular way of functioning that is different from normal regexes. Example-
```
C:\Users\Anil Bapna\Desktop>extract.bat . "^[a-z]" "HELo hello"
HELo
hello
```
`Findstr` operates differently with CAPITAL and LOWER Case regexes.
There are two substitutes defined in the batch script, namely
- `[Capital]`
- `[LOWER]`



### Delimiters
Delimiters are symbols that are not part of the search. They are used to separate strings into 'tokens'. The built-in and always on Delimiter is Space. However you still have to write something as the delimiter parameter. If you want to continue using space just write the delimiter as `"&"`.
Delimiters like `&` and `|` must always be escaped like `"^&"` and `"^|"` respectively.



### Noob section :hear_no_evil::hear_no_evil::hear_no_evil:
Simple usage in batch files.
- Example #1
```
set file_name="Seventh Son of a Seventh Son (2015 Remaster) [ZjphaXXEU9o]"
for /f "delims=" %%i in ('extract.bat "&" "[[a-z]]" %file_name%') do set removable_part=%%i
CALL set file_name=%%filename:%removable_part%=%%
```
- Example #2
```
set file_name="Seventh Son of a Seventh Son (2015 Remaster) [ZjphaXXEU9o]"
for /f "delims=" %%i in ('extract.bat "()" "[1-2][0-9][0-9][0-9]" %file_name%') do set year=%%i
REM year of song is %year%
```
- Example #3 ```extract.bat . "^[Capital]" "Hello hollow oh so dear Mister Pierce"```

Output:
```
Hello
Mister
Pierce
```


(C) Readme . Rest in Peace `☮`
