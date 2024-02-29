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
