data modify storage my_storage:data my_compound set value {one:1,two:2}
function xolibs:compound/to_array {compound: "my_storage:data my_compound"}
data get storage xolibs:temp compound_to_array