< FINDSTR REGEX > is different in operation from regular expected regex. therefore please test your inputs and regex using FINDSTR independently to confirm the output/efficacy

Let's delve into the workings of the regex itself:

```C:\Users\Anil Bapna\Desktop>extract.bat . "[a-z]" "HELo"```
- The first parameter is the delimiter
- The second parameter is the `FINDSTR`-compatible regex
- The Third parameter is the STRING to extract substring from.

