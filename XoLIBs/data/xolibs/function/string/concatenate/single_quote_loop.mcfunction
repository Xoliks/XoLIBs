#determine the format of the string
execute store success score string_concatenate.test xolibs.temp run data modify storage xolibs:temp string_concatenate.entry set string storage xolibs:temp string_concatenate.list[-1]
execute if score string_concatenate.test xolibs.temp matches 0 run return fail
data remove storage xolibs:temp string_concatenate.list[-1]

#convert escape sequences to the correct format
function xolibs:string/escape {data: "xolibs:temp string_concatenate.entry"}
data modify storage xolibs:temp string_concatenate.character set string storage xolibs:temp string_concatenate.entry 0 1
execute if data storage xolibs:temp string_concatenate{character:'"'} run data modify storage xolibs:temp string_concatenate.entry set string storage xolibs:temp string_concatenate.entry 0 -1
execute if data storage xolibs:temp string_concatenate{character:'"'} run function xolibs:string/concatenate/add_double_quote with storage xolibs:temp string_concatenate
execute if data storage xolibs:temp string_concatenate{character:'"'} run function xolibs:string/escape {data: "xolibs:temp string_concatenate.entry"}
data modify storage xolibs:temp string_concatenate.entry set string storage xolibs:temp string_concatenate.entry 1 -1

#combine strings
function xolibs:string/concatenate/single_quote_combine with storage xolibs:temp string_concatenate
execute if data storage xolibs:temp string_concatenate{character:'"'} run data modify storage xolibs:temp string_concatenate.out set string storage xolibs:temp string_concatenate.out 1

#quit if list is empty
execute unless data storage xolibs:temp string_concatenate.list[-1] run return 1

#loop again
function xolibs:string/escape {data: "xolibs:temp string_concatenate.out"}
data modify storage xolibs:temp string_concatenate.character set string storage xolibs:temp string_concatenate.out 0 1
data modify storage xolibs:temp string_concatenate.out set string storage xolibs:temp string_concatenate.out 1 -1

execute if data storage xolibs:temp string_concatenate{character:'"'} run return run function xolibs:string/concatenate/double_quote_loop
execute if data storage xolibs:temp string_concatenate{character:"'"} run return run function xolibs:string/concatenate/single_quote_loop
return fail