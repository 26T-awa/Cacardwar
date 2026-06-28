function cacardwar:main/clear_item
function cacardwar:main/red/summoner
scoreboard players remove @e[tag=cacard.redZombie] cacard.summonleft 1
scoreboard players remove @e[tag=cacard.redTrader] cacard.summonleft 1
clear @s *[custom_data={cacardwar:skip}]
execute at @s run playsound item.armor.equip_elytra master @a[tag=cacard.blueTeam] ~ ~ ~ 2 1 1
execute as @e[tag=cacard.red5] at @s run playsound block.note_block.harp master @a[tag=!cacard.blueTeam] ~ ~ ~ 2 2 1
item replace entity @s hotbar.4 with barrier[custom_data={cacardwar:none},custom_name={text:"\u00a7c现在不是你的回合！"},enchantment_glint_override=true] 1
item replace entity @a[tag=cacard.redTeam] hotbar.8 with lime_concrete[custom_data={cacardwar:skip},enchantment_glint_override=true,custom_name={text:"\u00a7a按F（或切换至副手位）跳过你的回合"}] 1
clear @a[tag=cacard.redTeam] barrier[custom_data={cacardwar:none}]
scoreboard players add @a[tag=cacard.redTeam] cacard.cardcount 5
execute as @e[tag=cacard.blue] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.blue0] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.red] run data modify entity @s Fixed set value false
execute as @e[tag=cacard.red0] run data modify entity @s Fixed set value false
title @a[tag=cacard.redTeam] actionbar {text:"\u00a7e现在是你的回合！"}