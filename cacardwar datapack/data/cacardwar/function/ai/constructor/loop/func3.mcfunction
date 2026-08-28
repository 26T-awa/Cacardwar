#function cacardwar:ai/constructor/loop/func3 with storage cacardwar:loop
$execute if entity @a[tag=cacard.inAImode,limit=1,tag=cacard.disabledSolt$(current)] if entity @e[tag=cacard.blue$(current),tag=cacard.disabled,limit=1] run data modify storage cacardwar:ai pending_sample.shield[0][$(current)] set value 0b
$execute if entity @e[tag=cacard.red$(current),tag=cacard.disabled,limit=1] run data modify storage cacardwar:ai pending_sample.shield[1][$(current)] set value 0b
