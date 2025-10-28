# end this loop if there are no more enchantments
execute if data storage xolibs:enchantment_list temp{string:''} run return fail

# get the enchantment id
scoreboard players set enchantment_list.index xolibs 0
function xolibs:enchantment_list/sub/find_quotes
execute store result storage xolibs:enchantment_list temp.index_end int 1 run scoreboard players remove enchantment_list.index xolibs 1
function xolibs:enchantment_list/sub/get_id with storage xolibs:enchantment_list temp

data modify storage xolibs:enchantment_list temp.string set string storage xolibs:enchantment_list temp.string_copy 2
data modify storage xolibs:enchantment_list temp.string_copy set string storage xolibs:enchantment_list temp.string_copy 2

# get enchantment level
scoreboard players set enchantment_list.index xolibs 0
function xolibs:enchantment_list/sub/get_lvl with storage xolibs:enchantment_list temp.enchantment
function xolibs:enchantment_list/sub/find_quotes
data modify storage xolibs:enchantment_list temp.string set string storage xolibs:enchantment_list temp.string_copy 1
data modify storage xolibs:enchantment_list temp.string_copy set string storage xolibs:enchantment_list temp.string_copy 1

# append to list
data modify storage xolibs:enchantment_list out append from storage xolibs:enchantment_list temp.enchantment

# do it all again!
function xolibs:enchantment_list/sub/get_enchantments