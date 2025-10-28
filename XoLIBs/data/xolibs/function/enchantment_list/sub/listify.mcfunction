data remove storage xolibs:enchantment_list out

$data modify storage xolibs:enchantment_list temp.string set value '$(in)'
data modify storage xolibs:enchantment_list temp.string set string storage xolibs:enchantment_list temp.string 2

data modify storage xolibs:enchantment_list temp.string_copy set from storage xolibs:enchantment_list temp.string
function xolibs:enchantment_list/sub/get_enchantments

data remove storage xolibs:enchantment_list temp
scoreboard players reset enchantment_list.index xolibs