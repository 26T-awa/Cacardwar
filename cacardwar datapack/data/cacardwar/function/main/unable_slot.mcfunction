execute if entity @a[tag=cacard.blueTeam,tag=cacard.unabledSolt0] run tag @e[tag=cacard.blue0] add cacard.unabled
execute if entity @a[tag=cacard.blueTeam,tag=cacard.unabledSolt1] run tag @e[tag=cacard.blue1] add cacard.unabled
execute if entity @a[tag=cacard.blueTeam,tag=cacard.unabledSolt2] run tag @e[tag=cacard.blue2] add cacard.unabled
execute if entity @a[tag=cacard.blueTeam,tag=cacard.unabledSolt3] run tag @e[tag=cacard.blue3] add cacard.unabled
execute if entity @a[tag=cacard.blueTeam,tag=cacard.unabledSolt4] run tag @e[tag=cacard.blue4] add cacard.unabled
execute if entity @a[tag=cacard.blueTeam,tag=cacard.unabledSolt5] run tag @e[tag=cacard.blue5] add cacard.unabled
execute if entity @a[tag=cacard.blueTeam,tag=cacard.unabledSolt6] run tag @e[tag=cacard.blue6] add cacard.unabled
execute if entity @a[tag=cacard.blueTeam,tag=cacard.unabledSolt7] run tag @e[tag=cacard.blue7] add cacard.unabled
execute if entity @a[tag=cacard.blueTeam,tag=cacard.unabledSolt8] run tag @e[tag=cacard.blue8] add cacard.unabled
execute if entity @a[tag=cacard.blueTeam,tag=cacard.unabledSolt9] run tag @e[tag=cacard.blue9] add cacard.unabled

execute if entity @a[tag=cacard.redTeam,tag=cacard.unabledSolt0] run tag @e[tag=cacard.red0] add cacard.unabled
execute if entity @a[tag=cacard.redTeam,tag=cacard.unabledSolt1] run tag @e[tag=cacard.red1] add cacard.unabled
execute if entity @a[tag=cacard.redTeam,tag=cacard.unabledSolt2] run tag @e[tag=cacard.red2] add cacard.unabled
execute if entity @a[tag=cacard.redTeam,tag=cacard.unabledSolt3] run tag @e[tag=cacard.red3] add cacard.unabled
execute if entity @a[tag=cacard.redTeam,tag=cacard.unabledSolt4] run tag @e[tag=cacard.red4] add cacard.unabled
execute if entity @a[tag=cacard.redTeam,tag=cacard.unabledSolt5] run tag @e[tag=cacard.red5] add cacard.unabled
execute if entity @a[tag=cacard.redTeam,tag=cacard.unabledSolt6] run tag @e[tag=cacard.red6] add cacard.unabled
execute if entity @a[tag=cacard.redTeam,tag=cacard.unabledSolt7] run tag @e[tag=cacard.red7] add cacard.unabled
execute if entity @a[tag=cacard.redTeam,tag=cacard.unabledSolt8] run tag @e[tag=cacard.red8] add cacard.unabled
execute if entity @a[tag=cacard.redTeam,tag=cacard.unabledSolt9] run tag @e[tag=cacard.red9] add cacard.unabled

execute as @e[tag=cacard.unabled] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.unabled] run data modify entity @s Item set value {id:barrier,components:{custom_data:{cacardwar:["non-card"]},custom_name:{text:"\u00a7c此槽位已被禁用！"}}}