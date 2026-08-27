#AI训练模式
##1卡组信息
execute if score #cacard.time cacard.time matches 1 run tag @a[scores={cacard.cardsetype=1}] add cacard.attack
execute if score #cacard.time cacard.time matches 1 run tag @a[scores={cacard.cardsetype=2}] add cacard.average
execute if score #cacard.time cacard.time matches 1 run tag @a[scores={cacard.cardsetype=3}] add cacard.resist
execute if score #cacard.time cacard.time matches 1 run tag @a[scores={cacard.cardsetype=4}] add cacard.summon
##2.先手永为蓝方
execute if score #cacard.time cacard.time matches 1 run title @a[tag=cacard.ingame] title {text:"§7- - -§a§lAI训练开始§r§7- - -"}
execute if score #cacard.time cacard.time matches 1 as @a[tag=cacard.inAImode,limit=1] run function cacardwar:main/clear_all_item
##4.3先后手信息显示
execute if score #cacard.time cacard.time matches 2 run scoreboard players set #cacard.blueHealth cacard.health 20
execute if score #cacard.time cacard.time matches 2 run scoreboard players set #cacard.redHealth cacard.health 20
execute if score #cacard.time cacard.time matches 2 run title @a[tag=cacard.inAImode,limit=1] subtitle {text:"你是先手"}
##4.4初始发牌
execute if score #cacard.time cacard.time matches 2 run scoreboard players add @a[tag=cacard.inAImode,limit=1] cacard.cardcount 4
###4.4.1发牌
loot give @a[tag=cacard.inAImode,tag=cacard.attack,scores={cacard.cardcount=1..}] loot cacardwar:attack
loot give @a[tag=cacard.inAImode,tag=cacard.average,scores={cacard.cardcount=1..}] loot cacardwar:average
loot give @a[tag=cacard.inAImode,tag=cacard.resist,scores={cacard.cardcount=1..}] loot cacardwar:resist
loot give @a[tag=cacard.inAImode,tag=cacard.summon,scores={cacard.cardcount=1..}] loot cacardwar:summon
execute if score #cacard.time cacard.time matches 7 run function cacardwar:main/others/loop_entry {min:1,max:18,bias:0,command:'function cacardwar:main/gamemode/loop/func1 with storage cacardwar:loop'}
execute as @a[scores={cacard.cardcount=1..}] at @s run playsound item.armor.equip_elytra master @s ^ ^ ^ 1.3 1
scoreboard players remove @a[scores={cacard.cardcount=1..}] cacard.cardcount 1
##4.5对局信息
execute if score #cacard.time cacard.time matches 10 run function cacardwar:ai/action/act_layer1
execute if items entity @a[tag=cacard.inAImode,limit=1] weapon.offhand *[custom_data~{cacardwar:["ai_act_clear_slot"]}] as @a[tag=cacard.inAImode,limit=1] run function cacardwar:ai/action/act_layer2_1
execute if items entity @a[tag=cacard.inAImode,limit=1] weapon.offhand *[custom_data~{cacardwar:["ai_act_place"]}] as @a[tag=cacard.inAImode,limit=1] run function cacardwar:ai/action/act_layer2_2
execute if items entity @a[tag=cacard.inAImode,limit=1] weapon.offhand *[custom_data~{cacardwar:["ai_act_skip"]}] as @a[tag=cacard.inAImode,limit=1] run function cacardwar:ai/action/act_layer2_3
##4.6清空槽位选择触发
execute if items entity @a[tag=cacard.inAImode,limit=1,tag=cacard.ai_clean] weapon.offhand *[custom_data~{cacardwar:["slot"]}] as @a[tag=cacard.inAImode,limit=1] run function cacardwar:ai/action/act_layer3_1
##4.7卡牌选择后槽位选择
execute if items entity @a[tag=cacard.inAImode,limit=1,tag=cacard.ai_place] weapon.offhand *[custom_data~{cacardwar:["card"]}] as @a[tag=cacard.inAImode,limit=1] run function cacardwar:ai/action/act_layer3_2
##4.8物品保护
execute as @e[tag=cacard.blue] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.blue0] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.red] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.red0] run data modify entity @s Fixed set value true
