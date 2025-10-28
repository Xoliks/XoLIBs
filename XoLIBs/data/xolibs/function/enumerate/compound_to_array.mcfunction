# xolibs:enumerate/compound_to_array
#
#>Description:
#   Enumerates a compound NBT tag, converting it in-place into a list of its child tags.
#   This is a mutable function; it modifies the input data structure directly.
#
#>Inputs:
#   Storage NBT Path - "compound"
#     Data Type: compound
#     
#>Outputs:
#   Return - 
#     fail: fatal ERROR
#     int: # of entries in output list
#   Storage NBT Path - "compound"
#     Data Type: key value pair array
#
#>Example:
#   data modify storage my_storage:data my_compound set value {one:1,two:2}
#   function xolibs:enumerate/compound_to_array {compound: "my_storage:data my_compound"}
#   data get storage my_storage:data my_compound
#   ↳ [{key:"one",value:1},{key:"two",value:2}]

scoreboard objectives add xolibs.temp dummy
scoreboard players reset * xolibs.temp
scoreboard players set constant_2 xolibs.temp 2
data remove storage xolibs:temp enumerate

$execute unless data storage $(compound){} run return fail
$data modify storage xolibs:temp enumerate.in set from storage $(compound)
function xolibs:enumerate/compound_to_array/key_loop
$data modify storage $(compound) set from storage xolibs:temp enumerate.out

scoreboard players reset * xolibs.temp
data remove storage xolibs:temp enumerate

$return run execute if data storage $(compound)[]