#>function xolibs:string/escape {data: "<Storage NBT Path>"}
#
#>Description:
#   Converts input data to escaped string
#
#>Inputs:
#   Storage NBT Path - "data"
#     Data Type: any
#     
#>Outputs:
#   Return - 
#     fail: Storage NBT Path does not exist
#     success: # of characters in output string
#   Storage NBT Path - "data"
#     Data Type: string
#
#>Example:
#   data modify storage my_storage:data my_data set value {foo:"bar"}
#   function xolibs:compound/to_array {data: "my_storage:data my_data"}
#   data get storage my_storage:data my_data
#   ↳ '{foo:"bar"}'
#   function xolibs:compound/to_array {data: "my_storage:data my_data"}
#   data get storage my_storage:data my_data
#   ↳ "'{foo:\"bar\"}'"
#   function xolibs:compound/to_array {data: "my_storage:data my_data"}
#   data get storage my_storage:data my_data
#   ↳ '"\'{foo:\\"bar\\"}\'"'

scoreboard objectives add xolibs.temp dummy
scoreboard players reset string_escape xolibs.temp
scoreboard players set constant_2 xolibs.temp 2
data remove storage xolibs:temp string_escape

$execute unless data storage $(data) run return fail
$data modify storage xolibs:temp string_escape.data set from storage $(data)

execute store success score string_escape xolibs.temp run data modify storage xolibs:temp string_escape.string set string storage xolibs:temp string_escape.data
execute if score string_escape xolibs.temp matches 1.. run execute summon item_display run function xolibs:string/escape/string
execute if score string_escape xolibs.temp matches 0 run execute summon item_display run function xolibs:string/escape/data

$data modify storage $(data) set from storage xolibs:temp string_escape.out

scoreboard players reset string_escape xolibs.temp
data remove storage xolibs:temp string_escape

$return run data get storage $(data)