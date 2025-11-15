data modify storage xolibs:temp string_escape.list append from storage xolibs:temp string_escape.string
loot replace entity @s contents loot {pools:[{rolls:1,entries:[{type:"minecraft:item",name:"test_instance_block",functions:[{function:"minecraft:set_name",entity:"this",name:{storage:"xolibs:temp",nbt:"string_escape.list"},target:"custom_name"}]}]}]}
data modify storage xolibs:temp string_escape.out set string entity @s item.components."minecraft:custom_name" 1 -1
kill @s