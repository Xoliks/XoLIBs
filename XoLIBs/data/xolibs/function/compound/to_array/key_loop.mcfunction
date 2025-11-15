#setup data
execute summon item_display run function xolibs:compound/to_array/escape_data

#quit if there's no more data
execute if data storage xolibs:temp compound.to_array{"string":"{}"} run return 1

data modify storage xolibs:temp compound.to_array.string set string storage xolibs:temp compound.to_array.string 1
data modify storage xolibs:temp compound.to_array.string_loop set from storage xolibs:temp compound.to_array.string

#find the colon at the end of the key
data modify storage xolibs:temp compound.to_array.character set string storage xolibs:temp compound.to_array.string 0 1
function xolibs:compound/to_array/character_loop/choose
execute store result storage xolibs:temp compound.to_array.character_index int 1 run scoreboard players get character_index xolibs.temp

#get the key from the character index, and the value from the key. Error if the key is invalid
function xolibs:compound/to_array/get_key with storage xolibs:temp compound.to_array
function xolibs:compound/to_array/get_value with storage xolibs:temp compound.to_array.compound
execute unless data storage xolibs:temp compound.to_array.compound.value run return fail
data modify storage xolibs:temp compound.to_array.out append from storage xolibs:temp compound.to_array.compound

#clean up
scoreboard players reset character_index xolibs.temp
scoreboard players reset backslash_count xolibs.temp
data remove storage xolibs:temp compound.to_array.compound

#loop
function xolibs:compound/to_array/key_loop