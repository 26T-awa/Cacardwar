# AI 训练模式 - 发牌：清空潜影盒 -> 按 #cacard.aiDeck 发 #cacard.aiDraw 张 -> 计数进手牌 -> 清空盒子
execute if score @a[tag=cacard.blueTeam,limit=1] cacard.cardcount matches 0 run return run function cacardwar:ai/count_hand

execute if entity @a[tag=cacard.attack,scores={cacard.cardcount=1..}] run loot insert -5 -59 -77 loot cacardwar:attack
execute if entity @a[tag=cacard.average,scores={cacard.cardcount=1..}] run loot insert -5 -59 -77 loot cacardwar:average
execute if entity @a[tag=cacard.resist,scores={cacard.cardcount=1..}] run loot insert -5 -59 -77 loot cacardwar:resist
execute if entity @a[tag=cacard.summon,scores={cacard.cardcount=1..}] run loot insert -5 -59 -77 loot cacardwar:summon
execute as @a[scores={cacard.cardcount=1..}] at @s run playsound item.armor.equip_elytra master @s ^ ^ ^ 1.3 1
scoreboard players remove @a[scores={cacard.cardcount=1..}] cacard.cardcount 1

execute if score @a[tag=cacard.blueTeam,limit=1] cacard.cardcount matches 1.. run return run function cacardwar:ai/draw
