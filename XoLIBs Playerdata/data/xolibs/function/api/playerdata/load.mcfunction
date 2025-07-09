# This pack was inspired by Cloudwolf's PDB pack
# This load function is the only function that must be called to load a player's data
# just run it as the entity you want the storage for, and it will handle everything else
# the player specific data is in: storage xolibs:playerdata player
# do not overwrite the UUID in the player's data

# loads the current player's player-specific data into a modifiable storage location

# tests if the player's data is already loaded, if it is, then do nothing
data remove storage xolibs:playerdata temp
data modify storage xolibs:playerdata temp.test.UUID set from storage xolibs:playerdata player.UUID
execute unless function xolibs:sub/playerdata/test run return fail

# saves the currently loaded data to permenant storage
data modify storage xolibs:playerdata temp.save.UUID0 set from storage xolibs:playerdata player.UUID[0]
data modify storage xolibs:playerdata temp.save.UUID1 set from storage xolibs:playerdata player.UUID[1]
data modify storage xolibs:playerdata temp.save.UUID2 set from storage xolibs:playerdata player.UUID[2]
data modify storage xolibs:playerdata temp.save.UUID3 set from storage xolibs:playerdata player.UUID[3]
function xolibs:sub/playerdata/save with storage xolibs:playerdata temp.save

# load this player's data from permanant storage
data modify storage xolibs:playerdata temp.load.UUID0 set from storage xolibs:playerdata temp.test.UUID[0]
data modify storage xolibs:playerdata temp.load.UUID1 set from storage xolibs:playerdata temp.test.UUID[1]
data modify storage xolibs:playerdata temp.load.UUID2 set from storage xolibs:playerdata temp.test.UUID[2]
data modify storage xolibs:playerdata temp.load.UUID3 set from storage xolibs:playerdata temp.test.UUID[3]
function xolibs:sub/playerdata/get with storage xolibs:playerdata temp.load

# save this player's UUID in storage
data modify storage xolibs:playerdata player.UUID set from storage xolibs:playerdata temp.test.UUID