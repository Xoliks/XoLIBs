#>function xolibs:string/unescape {data: "<Storage NBT Path>"}
#
#>Description:
#   Removes a level of escape characters from a string
#
#>Inputs:
#   Storage NBT Path - "data"
#     Data Type: string
#     
#>Outputs:
#   Return - 
#     fail: Storage NBT Path does not exist
#     success: depends on input
#   Storage NBT Path - "data"
#     Data Type: depends on input
#
#>Example:
#   data modify storage my_storage:data my_data set value '"\'{foo:\\"bar\\"}\'"'
#   function xolibs:string/unescape {data: "my_storage:data my_data"}
#   data get storage my_storage:data my_data
#   ↳ "'{foo:\"bar\"}'"
#   function xolibs:string/unescape {data: "my_storage:data my_data"}
#   data get storage my_storage:data my_data
#   ↳ '{foo:"bar"}'
#   function xolibs:string/unescape {data: "my_storage:data my_data"}
#   data get storage my_storage:data my_data
#   ↳ {foo:"bar"}

scoreboard objectives add xolibs.temp dummy
scoreboard players reset string_unescape xolibs.temp
data remove storage xolibs:temp string_unescape

$execute unless data storage $(data) run return fail
$data modify storage xolibs:temp string_unescape.data set from storage $(data)

function xolibs:string/unescape/interpret with storage xolibs:temp string_unescape

$data modify storage $(data) set from storage xolibs:temp string_unescape.data

scoreboard players reset string_unescape xolibs.temp
data remove storage xolibs:temp string_unescape

$return run data get storage $(data)