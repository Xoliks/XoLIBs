#setup data
execute summon item_display run function xolibs:enumerate/compound/escape_data

#quit if there's no more data
execute if data storage xolibs:temp enumerate{"string":"{}"} run return 1

data modify storage xolibs:temp enumerate.string set string storage xolibs:temp enumerate.string 1
data modify storage xolibs:temp enumerate.string_loop set from storage xolibs:temp enumerate.string

#find the colon at the end of the key
data modify storage xolibs:temp enumerate.character set string storage xolibs:temp enumerate.string 0 1
function xolibs:enumerate/compound/character_loop/choose
execute store result storage xolibs:temp enumerate.character_index int 1 run scoreboard players get character_index xolibs.temp

#get the key from the character index, and the value from the key. Error if the key is invalid
function xolibs:enumerate/compound/get_key with storage xolibs:temp enumerate
function xolibs:enumerate/compound/get_value with storage xolibs:temp enumerate.compound
execute unless data storage xolibs:temp enumerate.compound.value run return fail
data modify storage xolibs:temp enumerate.out append from storage xolibs:temp enumerate.compound

#clean up
scoreboard players reset character_index xolibs.temp
scoreboard players reset backslash_count xolibs.temp
data remove storage xolibs:temp enumerate.compound

#loop
function xolibs:enumerate/compound/key_loop