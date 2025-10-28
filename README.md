# XoLIBs
My own personal collection of datapack libraries

I have personally never liked the IN&OUT storage or scoreboard locations that most libraries require, even worse is passing in data via macro, so this pack uses functions differently from other libraries

**Function input types**
[Command Context](https://minecraft.wiki/w/Command_context) - Things like command's location and entity.
(Storage NBT Path)[https://minecraft.wiki/w/NBT_path] - Paths are input as macros. Block and Entity NBT Paths cannot be used. The data at that Storage NBT Path is used as input for the function, similar to passing in a pointer refrence in C. The data at that location must be formatted in a specific way, resulting in implicit Data Types for these functions. Storage NBT Paths come in the form of `<namespace>:<storage> <NBT Path>`. The root of a Storage cannot be used.

**Function output types**
Return - Returns an int, the output must be taken using `execute store`.
Mutator - Takes in at least one Storage NBT Path as input, the output will overwrite that refrence Storage NBT Path. This results in the function being "performed on" the data at that Storage NBT Path.
