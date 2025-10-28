data remove storage xolibs:test compound
data modify storage xolibs:test compound set value {one:true, two:2, three:3.0, foo:'bar', '"list"':[Lorem, ipsum, dolor, sit, amet, consectetur, adipiscing, elit], "'\\:\\\'\"'\\::\\\'":"\"\\\"'::\\\"\"'"}
function xolibs:enumerate/compound {"storage": "xolibs:test compound"}