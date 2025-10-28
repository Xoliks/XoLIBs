#iterate through characters until a colon is found
scoreboard players add character_index xolibs.temp 1
data modify storage xolibs:temp enumerate.string_loop set string storage xolibs:temp enumerate.string_loop 1
data modify storage xolibs:temp enumerate.character set string storage xolibs:temp enumerate.string_loop 0 1
execute if data storage xolibs:temp enumerate{"character":":"} run return 1
function xolibs:enumerate/compound_to_array/character_loop/quoteless_loop