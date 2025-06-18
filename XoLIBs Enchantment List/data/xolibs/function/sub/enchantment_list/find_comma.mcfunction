scoreboard players add enchantment_list.index xolibs 1
data modify storage xolibs:enchantment_list temp.character set string storage xolibs:enchantment_list temp.string_copy 0 1
execute if data storage xolibs:enchantment_list temp{character:'}'} run return 0
execute if data storage xolibs:enchantment_list temp{character:','} run return 0
data modify storage xolibs:enchantment_list temp.string_copy set string storage xolibs:enchantment_list temp.string_copy 1
function xolibs:sub/enchantment_list/find_comma