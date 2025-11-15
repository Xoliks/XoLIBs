loot replace entity @s contents loot {pools:[{rolls:1,entries:[{type:"minecraft:item",name:"test_instance_block",functions:[{function:"minecraft:set_name",entity:"this",name:{storage:"xolibs:temp",nbt:"compound.to_array.in"},target:"custom_name"}]}]}]}
data modify storage xolibs:temp compound.to_array.string set from entity @s item.components."minecraft:custom_name"
kill @s