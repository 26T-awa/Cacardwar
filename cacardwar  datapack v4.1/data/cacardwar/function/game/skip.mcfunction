function cacardwar:main/clear_item
$function cacardwar:main/operation/summoner {team:$(oppteam),oppteam:$(team)}

$scoreboard players remove @e[tag=cacard.$(oppteam)Zombie] cacard.summonleft 1
$scoreboard players remove @e[tag=cacard.$(oppteam)Trader] cacard.summonleft 1

clear @s *[custom_data={cacardwar:skip}]
$execute at @s run playsound item.armor.equip_elytra master @a[tag=cacard.$(team)Team] ~ ~ ~ 2 1 1
$execute as @e[tag=cacard.$(oppteam)5] at @s run playsound block.note_block.harp master @a[tag=!cacard.$(team)Team] ~ ~ ~ 2 2 1
item replace entity @s hotbar.4 with barrier[custom_data={cacardwar:none},custom_name={text:"\u00a7c现在不是你的回合！"},enchantment_glint_override=true] 1
$item replace entity @a[tag=cacard.$(oppteam)Team] hotbar.8 with lime_concrete[custom_data={cacardwar:skip},enchantment_glint_override=true,custom_name={text:"\u00a7a按F（或切换至副手位）跳过你的回合"}] 1
$clear @a[tag=cacard.$(oppteam)Team] barrier[custom_data={cacardwar:none}]
$scoreboard players add @a[tag=cacard.$(oppteam)Team] cacard.cardcount 5
$execute as @e[tag=cacard.$(team)] run data modify entity @s Fixed set value true
$execute as @e[tag=cacard.$(team)0] run data modify entity @s Fixed set value true
$execute as @e[tag=cacard.$(oppteam)] run data modify entity @s Fixed set value false
$execute as @e[tag=cacard.$(oppteam)0] run data modify entity @s Fixed set value false
$title @a[tag=cacard.$(oppteam)Team] actionbar {text:"\u00a7e现在是你的回合！"}