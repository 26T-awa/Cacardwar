execute if entity @a[tag=cacard.blueTeam,tag=cacard.ready] if entity @a[tag=cacard.redTeam,tag=cacard.ready] run scoreboard players add #cacard.time cacard.time 1
execute unless entity @a[tag=cacard.blueTeam,tag=cacard.ready] run scoreboard players set #cacard.time cacard.time 0
execute unless entity @a[tag=cacard.redTeam,tag=cacard.ready] run scoreboard players set #cacard.time cacard.time 0
#1 == 红先 ; 0 == 蓝先
execute if score #cacard.time cacard.time matches 1 store result score #cacard.i cacard.random run random value 0..1
execute if score #cacard.time cacard.time matches 1 run title @a[tag=cacard.ingame] title {text:"\u00a77- - -\u00a7e\u00a7l游戏开始\u00a7r\u00a77- - -"}
execute if score #cacard.time cacard.time matches 2 run scoreboard players set #cacard.blueHealth cacard.health 20
execute if score #cacard.time cacard.time matches 2 run scoreboard players set #cacard.redHealth cacard.health 20
execute if score #cacard.time cacard.time matches 1 run clear @a[tag=cacard.ready] *[custom_data={cacardwar:iron_ingot}]
execute if score #cacard.time cacard.time matches 1 run clear @a[tag=cacard.ready] *[custom_data={cacardwar:gold_ingot}]
execute if score #cacard.time cacard.time matches 1 run clear @a[tag=cacard.ready] *[custom_data={cacardwar:diamond}]
execute if score #cacard.time cacard.time matches 1 run clear @a[tag=cacard.ready] *[custom_data={cacardwar:stick}]
execute if score #cacard.time cacard.time matches 1 run clear @a[tag=cacard.ready] *[custom_data={cacardwar:apple}]
execute if score #cacard.time cacard.time matches 1 run clear @a[tag=cacard.ready] *[custom_data={cacardwar:wheat}]
execute if score #cacard.time cacard.time matches 1 run clear @a[tag=cacard.ready] *[custom_data={cacardwar:another_two}]
execute if score #cacard.time cacard.time matches 1 run clear @a[tag=cacard.ready] *[custom_data={cacardwar:deal_with_gambler}]
execute if score #cacard.time cacard.time matches 1 run clear @a[tag=cacard.ready] *[custom_data={cacardwar:skip}]
execute if score #cacard.time cacard.time matches 1 run clear @a[tag=cacard.ready] *[custom_data={cacardwar:none}]
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 1 run title @a[tag=cacard.ready,tag=cacard.blueTeam] subtitle {text:"你是后手"}
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 1 run title @a[tag=cacard.ready,tag=cacard.redTeam] subtitle {text:"你是先手"}
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 0 run title @a[tag=cacard.ready,tag=cacard.blueTeam] subtitle {text:"你是先手"}
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 0 run title @a[tag=cacard.ready,tag=cacard.redTeam] subtitle {text:"你是后手"}
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 1 run loot give @a[tag=cacard.redTeam,tag=cacard.attack] loot cacardwar:first/attack
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 1 run loot give @a[tag=cacard.redTeam,tag=cacard.average] loot cacardwar:first/average
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 1 run loot give @a[tag=cacard.redTeam,tag=cacard.resist] loot cacardwar:first/resist
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 0 run loot give @a[tag=cacard.blueTeam,tag=cacard.attack] loot cacardwar:first/attack
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 0 run loot give @a[tag=cacard.blueTeam,tag=cacard.average] loot cacardwar:first/average
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 0 run loot give @a[tag=cacard.blueTeam,tag=cacard.resist] loot cacardwar:first/resist
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 1 run item replace entity @a[tag=cacard.redTeam] hotbar.8 with lime_concrete[custom_data={cacardwar:skip},enchantment_glint_override=true,custom_name={text:"\u00a7a按F（或切换至副手位）跳过你的回合"}] 1
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 1 run item replace entity @a[tag=cacard.blueTeam] hotbar.4 with barrier[custom_data={cacardwar:none},enchantment_glint_override=true,custom_name={text:"\u00a7c现在不是你的回合"}] 1
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 0 run item replace entity @a[tag=cacard.blueTeam] hotbar.8 with lime_concrete[custom_data={cacardwar:skip},enchantment_glint_override=true,custom_name={text:"\u00a7a按F（或切换至副手位）跳过你的回合"}] 1
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 0 run item replace entity @a[tag=cacard.redTeam] hotbar.4 with barrier[custom_data={cacardwar:none},enchantment_glint_override=true,custom_name={text:"\u00a7c现在不是你的回合"}] 1

execute as @a[nbt={equipment:{offhand:{id:"minecraft:lime_concrete",components:{"minecraft:custom_data":{cacardwar:skip}}}}},tag=cacard.blueTeam] run function cacardwar:game/blue_skip
execute as @a[nbt={equipment:{offhand:{id:"minecraft:lime_concrete",components:{"minecraft:custom_data":{cacardwar:skip}}}}},tag=cacard.redTeam] run function cacardwar:game/red_skip

execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 1 run execute as @e[tag=cacard.blue] run data modify entity @s Fixed set value true
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 0 run execute as @e[tag=cacard.red] run data modify entity @s Fixed set value true

#胜负判断
execute if score #cacard.redHealth cacard.health <= #cacard.j cacard.health run function cacardwar:game/blue_win
execute if score #cacard.blueHealth cacard.health <= #cacard.j cacard.health run function cacardwar:game/red_win

#清理物品
execute as @e[tag=cacard.blue] at @s run function cacardwar:main/kill_item
execute as @e[tag=cacard.red] at @s run function cacardwar:main/kill_item

#持盾特效
execute if entity @a[tag=cacard.blueTeam,tag=cacard.shield] at @e[tag=cacard.blue5] run particle enchanted_hit ~ ~2 ~ 0.5 0.3 0.5 0 1 normal @a[tag=cacard.ingame]
execute if entity @a[tag=cacard.redTeam,tag=cacard.shield] at @e[tag=cacard.red5] run particle enchanted_hit ~ ~2 ~ 0.5 0.3 0.5 0 1 normal @a[tag=cacard.ingame]