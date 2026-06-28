function cacardwar:main/clear_item
clear @s *[custom_data={cacardwar:skip}]
execute at @s run playsound item.armor.equip_elytra master @s ~ ~ ~ 2 1 1
execute as @e[tag=cacard.blue] at @s run playsound block.note_block.harp master @a ~ ~ ~ 2 2 1
item replace entity @s hotbar.4 with barrier[custom_data={cacardwar:none},custom_name={text:"\u00a7c现在不是你的回合！"},enchantment_glint_override=true] 1
item replace entity @a[tag=cacard.blueTeam] hotbar.8 with lime_concrete[custom_data={cacardwar:skip},enchantment_glint_override=true,custom_name={text:"\u00a7a按F（或切换至副手位）跳过你的回合"}] 1
clear @a[tag=cacard.blueTeam] barrier[custom_data={cacardwar:none}]
loot give @a[tag=cacard.blueTeam,tag=cacard.attack] loot cacardwar:normal/attack
loot give @a[tag=cacard.blueTeam,tag=cacard.average] loot cacardwar:normal/average
loot give @a[tag=cacard.blueTeam,tag=cacard.resist] loot cacardwar:normal/resist
execute as @e[tag=cacard.red] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.blue] run data modify entity @s Fixed set value false