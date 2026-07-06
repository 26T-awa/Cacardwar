execute if entity @a[tag=cacard.blueTeam,tag=cacard.disabledSolt0] run tag @e[tag=cacard.blue0] add cacard.disabled
execute if entity @a[tag=cacard.blueTeam,tag=cacard.disabledSolt1] run tag @e[tag=cacard.blue1] add cacard.disabled
execute if entity @a[tag=cacard.blueTeam,tag=cacard.disabledSolt2] run tag @e[tag=cacard.blue2] add cacard.disabled
execute if entity @a[tag=cacard.blueTeam,tag=cacard.disabledSolt3] run tag @e[tag=cacard.blue3] add cacard.disabled
execute if entity @a[tag=cacard.blueTeam,tag=cacard.disabledSolt4] run tag @e[tag=cacard.blue4] add cacard.disabled
execute if entity @a[tag=cacard.blueTeam,tag=cacard.disabledSolt5] run tag @e[tag=cacard.blue5] add cacard.disabled
execute if entity @a[tag=cacard.blueTeam,tag=cacard.disabledSolt6] run tag @e[tag=cacard.blue6] add cacard.disabled
execute if entity @a[tag=cacard.blueTeam,tag=cacard.disabledSolt7] run tag @e[tag=cacard.blue7] add cacard.disabled
execute if entity @a[tag=cacard.blueTeam,tag=cacard.disabledSolt8] run tag @e[tag=cacard.blue8] add cacard.disabled
execute if entity @a[tag=cacard.blueTeam,tag=cacard.disabledSolt9] run tag @e[tag=cacard.blue9] add cacard.disabled

execute if entity @a[tag=cacard.redTeam,tag=cacard.disabledSolt0] run tag @e[tag=cacard.red0] add cacard.disabled
execute if entity @a[tag=cacard.redTeam,tag=cacard.disabledSolt1] run tag @e[tag=cacard.red1] add cacard.disabled
execute if entity @a[tag=cacard.redTeam,tag=cacard.disabledSolt2] run tag @e[tag=cacard.red2] add cacard.disabled
execute if entity @a[tag=cacard.redTeam,tag=cacard.disabledSolt3] run tag @e[tag=cacard.red3] add cacard.disabled
execute if entity @a[tag=cacard.redTeam,tag=cacard.disabledSolt4] run tag @e[tag=cacard.red4] add cacard.disabled
execute if entity @a[tag=cacard.redTeam,tag=cacard.disabledSolt5] run tag @e[tag=cacard.red5] add cacard.disabled
execute if entity @a[tag=cacard.redTeam,tag=cacard.disabledSolt6] run tag @e[tag=cacard.red6] add cacard.disabled
execute if entity @a[tag=cacard.redTeam,tag=cacard.disabledSolt7] run tag @e[tag=cacard.red7] add cacard.disabled
execute if entity @a[tag=cacard.redTeam,tag=cacard.disabledSolt8] run tag @e[tag=cacard.red8] add cacard.disabled
execute if entity @a[tag=cacard.redTeam,tag=cacard.disabledSolt9] run tag @e[tag=cacard.red9] add cacard.disabled

execute as @e[tag=cacard.disabled] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.disabled] run data modify entity @s Item set value {id:barrier,components:{custom_data:{cacardwar:["non-card"]},custom_name:{text:"§c此槽位已被禁用！"}}}