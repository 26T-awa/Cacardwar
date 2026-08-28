
execute at @e[tag=cacard.center,limit=1] run kill @e[type=item,distance=..64,nbt={Item:{components:{"minecraft:custom_data":{cacardwar:["card"]}}}}]

scoreboard players remove @e[tag=cacard.blueZombie] cacard.summonleft 1
scoreboard players remove @e[tag=cacard.blueTrader] cacard.summonleft 1
scoreboard players remove @e[tag=cacard.blueSuperZombie] cacard.summonleft 1
scoreboard players remove @e[tag=cacard.blueScarecrow] cacard.summonleft 1

function cacardwar:operation/turn/summoner {team:blue,oppteam:red}
function cacardwar:operation/turn/regenerating {team:blue,oppteam:red}

scoreboard players add @a[tag=cacard.blueTeam] cacard.cardcount 5
give @a[tag=cacard.blueTeam,scores={cacard.mineral_clump=1..}] resin_clump[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §e§l矿物质"}],custom_data={cacardwar:["mineral_clump","mineral","card","card17"],cacard.recipe1:true,cacard.recipe3:true,cacard.recipe4:true,cacard.recipe12:true},custom_model_data={strings:["cacardwar:mineral"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]] 4
scoreboard players remove @a[tag=cacard.blueTeam,scores={cacard.mineral_clump=1..}] cacard.mineral_clump 1

schedule function cacardwar:ai/constructor/cst_before 8t
