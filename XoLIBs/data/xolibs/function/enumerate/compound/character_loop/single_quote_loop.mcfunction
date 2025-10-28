#iterate through characters until a single quote is found, watch out for escaped characters
scoreboard players add character_index xolibs.temp 1
data modify storage xolibs:temp enumerate.string_loop set string storage xolibs:temp enumerate.string_loop 1
data modify storage xolibs:temp enumerate.character set string storage xolibs:temp enumerate.string_loop 0 1
execute if data storage xolibs:temp enumerate{"character":"'"} if function xolibs:enumerate/compound/character_loop/backslash_test run return run scoreboard players add character_index xolibs.temp 1

execute if data storage xolibs:temp enumerate{"character":'\\'} run scoreboard players add backslash_count xolibs.temp 1
execute unless data storage xolibs:temp enumerate{"character":'\\'} run scoreboard players reset backslash_count xolibs.temp

function xolibs:enumerate/compound/character_loop/single_quote_loop