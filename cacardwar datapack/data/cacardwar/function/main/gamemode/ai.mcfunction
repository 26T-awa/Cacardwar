#AI训练模式
##1.卡组信息
execute if score #cacard.time cacard.time matches 1 run tag @a[scores={cacard.cardsetype=1}] add cacard.attack
execute if score #cacard.time cacard.time matches 1 run tag @a[scores={cacard.cardsetype=2}] add cacard.average
execute if score #cacard.time cacard.time matches 1 run tag @a[scores={cacard.cardsetype=3}] add cacard.resist
execute if score #cacard.time cacard.time matches 1 run tag @a[scores={cacard.cardsetype=4}] add cacard.summon
##2.先手永为蓝方
execute if score #cacard.time cacard.time matches 1 run title @a[tag=cacard.ingame] title {text:"§7- - -§a§lAI训练开始§r§7- - -"}
execute if score #cacard.time cacard.time matches 1 as @a[tag=cacard.inAImode,limit=1] run function cacardwar:main/clear_all_item
##3先后手信息显示
execute if score #cacard.time cacard.time matches 2 run scoreboard players set #cacard.blueHealth cacard.health 20
execute if score #cacard.time cacard.time matches 2 run scoreboard players set #cacard.redHealth cacard.health 20
execute if score #cacard.time cacard.time matches 2 run title @a[tag=cacard.inAImode,limit=1] subtitle {text:"你是先手"}
##4初始发牌
execute if score #cacard.time cacard.time matches 2 run scoreboard players add @a[tag=cacard.inAImode,limit=1] cacard.cardcount 4
###4.1发牌
loot give @a[tag=cacard.inAImode,tag=cacard.attack,scores={cacard.cardcount=1..}] loot cacardwar:attack
loot give @a[tag=cacard.inAImode,tag=cacard.average,scores={cacard.cardcount=1..}] loot cacardwar:average
loot give @a[tag=cacard.inAImode,tag=cacard.resist,scores={cacard.cardcount=1..}] loot cacardwar:resist
loot give @a[tag=cacard.inAImode,tag=cacard.summon,scores={cacard.cardcount=1..}] loot cacardwar:summon
execute as @a[scores={cacard.cardcount=1..}] at @s run playsound item.armor.equip_elytra master @s ^ ^ ^ 1.3 1
scoreboard players remove @a[scores={cacard.cardcount=1..}] cacard.cardcount 1
##5初始选择
execute if score #cacard.time cacard.time matches 10 run function cacardwar:ai/action/act_layer1
##6选择
execute if items entity @a[tag=cacard.inAImode,limit=1] weapon.offhand *[custom_data~{cacardwar:["ai_act_clear_slot"]}] as @a[tag=cacard.inAImode,limit=1] run function cacardwar:ai/action/act_layer2_1
execute if items entity @a[tag=cacard.inAImode,limit=1] weapon.offhand *[custom_data~{cacardwar:["ai_act_place"]}] as @a[tag=cacard.inAImode,limit=1] run function cacardwar:ai/action/act_layer2_2
execute if items entity @a[tag=cacard.inAImode,limit=1] weapon.offhand *[custom_data~{cacardwar:["ai_act_skip"]}] as @a[tag=cacard.inAImode,limit=1] run function cacardwar:ai/action/act_layer2_3
###6.1清空槽位选择触发
execute if items entity @a[tag=cacard.inAImode,limit=1,tag=cacard.ai_clean] weapon.offhand *[custom_data~{cacardwar:["slot"]}] as @a[tag=cacard.inAImode,limit=1] run function cacardwar:ai/action/act_layer3_1
###6.2放置卡牌选择触发
execute if items entity @a[tag=cacard.inAImode,limit=1,tag=cacard.ai_place] weapon.offhand *[custom_data~{cacardwar:["card"]}] as @a[tag=cacard.inAImode,limit=1] run function cacardwar:ai/action/act_layer3_2
###6.3卡牌选择后槽位选择
execute if items entity @a[tag=cacard.inAImode,limit=1,tag=cacard.ai_placed_card] weapon.offhand *[custom_data~{cacardwar:["slot"]}] as @a[tag=cacard.inAImode,limit=1] run function cacardwar:ai/action/act_layer3_3
###6.4卡片选择后返回
execute if items entity @a[tag=cacard.inAImode,limit=1,tag=cacard.ai_placed_card] weapon.offhand *[custom_data~{cacardwar:["ai_act_back"]}|custom_data~{cacardwar:["disabled_slot"]}] as @a[tag=cacard.inAImode,limit=1] at @e[tag=cacard.center] run item replace entity @s container.21 from block ~15 ~ ~9 container.0
execute if items entity @a[tag=cacard.inAImode,limit=1,tag=cacard.ai_placed_card] weapon.offhand *[custom_data~{cacardwar:["ai_act_back"]}|custom_data~{cacardwar:["disabled_slot"]}] as @a[tag=cacard.inAImode,limit=1] run function cacardwar:ai/action/act_layer1
###6.5返回
execute if items entity @a[tag=cacard.inAImode,limit=1] weapon.offhand *[custom_data~{cacardwar:["ai_act_back"]}|custom_data~{cacardwar:["disabled_slot"]}] as @a[tag=cacard.inAImode,limit=1] run function cacardwar:ai/action/act_layer1
##7物品保护
execute if score #cacard.time cacard.time matches 1 run data remove entity @e[tag=cacard.red5,limit=1] Item
execute as @e[tag=cacard.blue] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.blue0] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.red] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.red0] run data modify entity @s Fixed set value true
##8胜负判断
execute if score #cacard.time cacard.time matches 20.. if score #cacard.redHealth cacard.health matches ..0 run function cacardwar:ai/calculation/rule13 {arg1:0,arg2:0,arg3:0}
execute if score #cacard.time cacard.time matches 20.. if score #cacard.redHealth cacard.health matches ..0 run function cacardwar:ai/action/act_layer4
##9自动采集数据准许
execute as @a[tag=cacard.inAImode,limit=1,tag=!cacard.inAImode.auto] if items entity @s weapon.offhand *[custom_data~{cacardwar:["ai_auto","non-card"]}] run tag @s add cacard.inAImode.auto
execute as @a[tag=cacard.inAImode,limit=1,tag=cacard.inAImode.auto] unless items entity @s weapon.offhand *[custom_data~{cacardwar:["ai_auto","non-card"]}] run tag @s remove cacard.inAImode.auto
execute if entity @a[tag=cacard.inAImode.auto] run data modify storage cacardwar:ai pending_sample.source set value "ai"
execute unless entity @a[tag=cacard.inAImode.auto] run data modify storage cacardwar:ai pending_sample.source set value "human"