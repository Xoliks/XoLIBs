#>function xolibs:string/concatenate {data: "<Storage NBT Path>"}
#
#>Description:
#   Concatenates a list of strings
#
#>Inputs:
#   Storage NBT Path - "data"
#     Data Type: string array
#     
#>Outputs:
#   Return - 
#     fail: Storage NBT Path does not exist or is wrong type
#     success: # of characters in output string
#   Storage NBT Path - "data"
#     Data Type: string
#
#>Example:
#   data modify storage my_storage:data my_data set value ["Lorem","Ipsum","Dolor"]
#   function xolibs:string/concatenate {data: "my_storage:data my_data"}
#   data get storage my_storage:data my_data
#   ↳ "LoremIpsumDolor"
#   data modify storage my_storage:data my_data set value ['A\\\\"\'\'\\\'', "B\\'\"\"\\\"'", 'C\\\\"\'\\"\\\'"']
#   function xolibs:string/concatenate {data: "my_storage:data my_data"}
#   data get storage my_storage:data my_data
#   ↳ '\\\\"\'\'\\\'\\\'""\\"\'\\\\"\'\\"\\\'"'

scoreboard objectives add xolibs.temp dummy
scoreboard players reset string_concatenate.test xolibs.temp
scoreboard players reset string_concatenate.count xolibs.temp
data remove storage xolibs:temp string_concatenate

$execute unless data storage $(data) run return fail
$data modify storage xolibs:temp string_concatenate.list set from storage $(data)

execute store success score string_concatenate.test xolibs.temp run data modify storage xolibs:temp string_concatenate.out set string storage xolibs:temp string_concatenate.list[-1]
execute if score string_concatenate.test xolibs.temp matches 0 run return fail
data remove storage xolibs:temp string_concatenate.list[-1]
function xolibs:string/escape {data: "xolibs:temp string_concatenate.out"}
data modify storage xolibs:temp string_concatenate.character set string storage xolibs:temp string_concatenate.out 0 1
data modify storage xolibs:temp string_concatenate.out set string storage xolibs:temp string_concatenate.out 1 -1

execute unless function xolibs:string/concatenate/choose run return fail

$data modify storage $(data) set from storage xolibs:temp string_concatenate.out

scoreboard players reset string_concatenate.test xolibs.temp
scoreboard players reset string_concatenate.count xolibs.temp
data remove storage xolibs:temp string_concatenate

$return run data get storage $(data)