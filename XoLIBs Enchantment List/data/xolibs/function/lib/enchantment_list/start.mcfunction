# turn an enchantments compound into a list of enchantments
# input is: minecraft:xolibs:enchantment_list in
# output is: minecraft:xolibs:enchantment_list out
# example input: {"minecraft:fire_protection": 3, "minecraft:aqua_affinity": 1, "minecraft:fortune": 1}
# example output: 

scoreboard objectives add xolibs dummy
function xolibs:sub/enchantment_list/listify with storage xolibs:enchantment_list