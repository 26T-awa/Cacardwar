function cacardwar:main/clear_item
$function cacardwar:operation/turn/summoner {team:$(oppteam),oppteam:$(team)}
$function cacardwar:operation/turn/regenerating {team:$(oppteam),oppteam:$(team)}

$scoreboard players remove @e[tag=cacard.$(oppteam)Zombie] cacard.summonleft 1
$scoreboard players remove @e[tag=cacard.$(oppteam)Trader] cacard.summonleft 1
$scoreboard players remove @e[tag=cacard.$(oppteam)SuperZombie] cacard.summonleft 1
$scoreboard players remove @e[tag=cacard.$(oppteam)Scarecrow] cacard.summonleft 1
#稻草人自然消失
execute as @e[scores={cacard.summonleft=..0},tag=cacard.summoner,tag=cacard.blueScarecrow] at @s run function cacardwar:operation/bless_of_crow {team:blue,oppteam:red,teamcolor:aqua,teamtext:"b蓝"}
execute as @e[scores={cacard.summonleft=..0},tag=cacard.summoner,tag=cacard.redScarecrow] at @s run function cacardwar:operation/bless_of_crow {team:red,oppteam:blue,teamcolor:gold,teamtext:"6红"}

$execute if score #cacard.$(team)Health cacard.health > #cacard.$(oppteam)Health cacard.health run scoreboard players add @a[tag=cacard.$(team)Team] cacard.point 7
$execute if score #cacard.$(team)Health cacard.health < #cacard.$(oppteam)Health cacard.health run scoreboard players add @a[tag=cacard.$(oppteam)Team] cacard.point 7
scoreboard players operation @a[tag=cacard.ready] cacard.point *= #cacard.i cacard.health
scoreboard players operation @a[tag=cacard.ready] cacard.point *= #cacard.j cacard.time
scoreboard players operation @a[tag=cacard.ready] cacard.point /= #cacard.k cacard.time

scoreboard players operation @a[tag=cacard.blueTeam] cacard.point += #cacard.blueHealth cacard.health
scoreboard players operation @a[tag=cacard.redTeam] cacard.point += #cacard.redHealth cacard.health

execute if entity @e[tag=cacard.blue0,nbt=!{Item:{}}] run scoreboard players add @a[tag=cacard.blueTeam] cacard.point 1
execute if entity @e[tag=cacard.red0,nbt=!{Item:{}}] run scoreboard players add @a[tag=cacard.redTeam] cacard.point 1

clear @s *[custom_data={cacardwar:["skip","non-card"]}]
item replace entity @s hotbar.4 with barrier[custom_data={cacardwar:["none","non-card"]},custom_name={text:"§c现在不是你的回合"},enchantment_glint_override=true] 1

$execute as @a[tag=cacard.$(oppteam)Team] run function cacardwar:main/clear_all_item
$item replace entity @a[tag=cacard.$(oppteam)Team] hotbar.8 with lime_concrete[custom_data={cacardwar:["skip","non-card"]},enchantment_glint_override=true,custom_name={text:"§a按F（或切换至副手位）跳过你的回合"}] 1
$scoreboard players add @a[tag=cacard.$(oppteam)Team] cacard.cardcount 5
$give @a[tag=cacard.$(oppteam)Team,scores={cacard.mineral_clump=1..}] resin_clump[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §e§l矿物质"}],custom_data={cacardwar:["mineral_clump","mineral","card","card17"],cacard.recipe1:true,cacard.recipe3:true,cacard.recipe4:true,cacard.recipe12:true},custom_model_data={strings:["cacardwar:mineral"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]] 4
$scoreboard players remove @a[tag=cacard.$(oppteam)Team,scores={cacard.mineral_clump=1..}] cacard.mineral_clump 1

$execute as @e[tag=cacard.$(team)] run data modify entity @s Fixed set value true
$execute as @e[tag=cacard.$(team)0] run data modify entity @s Fixed set value true
$execute as @e[tag=cacard.$(oppteam),tag=!cacard.disabled] run data modify entity @s Fixed set value false
$execute as @e[tag=cacard.$(oppteam)0,tag=!cacard.disabled] run data modify entity @s Fixed set value false
$title @a[tag=cacard.$(oppteam)Team] actionbar {text:"§e现在是你的回合！"}

playsound block.stone_button.click_off master @a[tag=cacard.ingame] ~ ~ ~ 1 1.2 1
$execute at @e[tag=cacard.$(oppteam)5] run playsound block.note_block.harp master @a[tag=cacard.ingame] ~ ~ ~ 1 2 1