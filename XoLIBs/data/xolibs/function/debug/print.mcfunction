#>function xolibs:debug/print {data: "<Storage NBT Path>"}
#
#>Description:
#   Prints data from storage to chat, click to copy NBT
#
#>Inputs:
#   Storage NBT Path - "data"
#     Data Type: any
#     
#>Outputs:
#   Return - 
#     fail: Storage NBT Path does not exist
#
#>Example:
##   data modify storage my_storage:data my_data set value {foo:"bar"}
##   function xolibs:debug/print {data: "my_storage:data my_data"}
##   ↳ my_storage:data my_data
##   ↳ {foo:"bar"}

scoreboard objectives add xolibs.temp dummy
scoreboard players reset debug_print xolibs.temp
data remove storage xolibs:temp debug_print

$execute unless data storage $(data) run return fail
$data modify storage xolibs:temp debug_print.data set from storage $(data)
data modify storage xolibs:temp debug_print.escaped set from storage xolibs:temp debug_print.data

function xolibs:string/escape {data: "xolibs:temp debug_print.escaped"}
function xolibs:string/escape {data: "xolibs:temp debug_print.escaped"}

$tellraw @a {text:"$(data)",color:"white"}
function xolibs:debug/print/tellraw with storage xolibs:temp debug_print

data remove storage xolibs:temp debug_print