scoreboard objectives add xolibs.temp dummy
scoreboard players reset * xolibs.temp
scoreboard players set constant_2 xolibs.temp 2
data remove storage xolibs:temp enumerate

$data modify storage xolibs:temp enumerate.in set from storage $(storage)
function xolibs:enumerate/compound/key_loop
#$data remove storage $(storage)
$data modify storage $(storage) set from storage xolibs:temp enumerate.out

scoreboard players reset * xolibs.temp