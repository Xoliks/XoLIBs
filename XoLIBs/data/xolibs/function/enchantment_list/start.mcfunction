# turn an enchantments compound into a list of enchantments
# input is: minecraft:xolibs:enchantment_list in
# output is: minecraft:xolibs:enchantment_list out
# example input: {"minecraft:efficiency": 4, "minecraft:silk_touch": 1, "minecraft:unbreaking": 3}
# example output: [{lvl: "4", id: "minecraft:efficiency"}, {lvl: "1", id: "minecraft:silk_touch"}, {lvl: "3", id: "minecraft:unbreaking"}]

scoreboard objectives add xolibs dummy
function xolibs:enchantment_list/sub/listify with storage xolibs:enchantment_list