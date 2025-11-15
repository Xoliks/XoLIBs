#>function xolibs:compound/to_array {compound: "<Storage NBT Path>"}
#
#>Description:
#   compounds a compound NBT tag, converting it in-place into a list of its child tags.
#   This is a mutable function; it modifies the input data structure directly.
#
#>Inputs:
#   Storage NBT Path - "compound"
#     Data Type: compound
#     
#>Outputs:
#   Return - 
#     fail: Storage NBT Path is the wrong type, or a key could not be determined
#     success: # of entries in output list
#   Storage NBT Path - "compound"
#     Data Type: key value pair array
#
#>Example:
#   data modify storage my_storage:data my_compound set value {one:1,two:2}
#   function xolibs:compound/to_array {compound: "my_storage:data my_compound"}
#   data get storage my_storage:data my_compound
#   ↳ [{key:"one",value:1},{key:"two",value:2}]

scoreboard objectives add xolibs.temp dummy
scoreboard players reset character_index xolibs.temp
scoreboard players reset backslash_count xolibs.temp
scoreboard players set constant_2 xolibs.temp 2
data remove storage xolibs:temp compound.to_array

$execute unless data storage $(compound){} run return fail
$data modify storage xolibs:temp compound.to_array.in set from storage $(compound)
function xolibs:compound/to_array/key_loop
$data modify storage $(compound) set from storage xolibs:temp compound.to_array.out

#scoreboard players reset character_index xolibs.temp
#scoreboard players reset backslash_count xolibs.temp
#data remove storage xolibs:temp compound.to_array

$return run execute if data storage $(compound)[]