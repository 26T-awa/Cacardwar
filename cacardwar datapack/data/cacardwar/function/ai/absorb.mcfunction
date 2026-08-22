# AI 训练模式 - 吸收：把玩家背包里的卡牌转入计分板手牌并清空背包
execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_data~{cacardwar:["iron_ingot"]}]
scoreboard players operation #cacard.aiHand_iron_ingot cacard.players += #cacard.aiAbsorb cacard.players

execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_data~{cacardwar:["gold_ingot"]}]
scoreboard players operation #cacard.aiHand_gold_ingot cacard.players += #cacard.aiAbsorb cacard.players

execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_data~{cacardwar:["diamond"]}]
scoreboard players operation #cacard.aiHand_diamond cacard.players += #cacard.aiAbsorb cacard.players

execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_data~{cacardwar:["gunpowder"]}]
scoreboard players operation #cacard.aiHand_gunpowder cacard.players += #cacard.aiAbsorb cacard.players

execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_data~{cacardwar:["stick"]}]
scoreboard players operation #cacard.aiHand_stick cacard.players += #cacard.aiAbsorb cacard.players

execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_data~{cacardwar:["log"]}]
scoreboard players operation #cacard.aiHand_log cacard.players += #cacard.aiAbsorb cacard.players

execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_data~{cacardwar:["plank"]}]
scoreboard players operation #cacard.aiHand_plank cacard.players += #cacard.aiAbsorb cacard.players

execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_data~{cacardwar:["apple"]}]
scoreboard players operation #cacard.aiHand_apple cacard.players += #cacard.aiAbsorb cacard.players

execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_data~{cacardwar:["wheat"]}]
scoreboard players operation #cacard.aiHand_wheat cacard.players += #cacard.aiAbsorb cacard.players

execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_data~{cacardwar:["another_two"]}]
scoreboard players operation #cacard.aiHand_another_two cacard.players += #cacard.aiAbsorb cacard.players

execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_data~{cacardwar:["deal"]}]
scoreboard players operation #cacard.aiHand_deal cacard.players += #cacard.aiAbsorb cacard.players

execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_data~{cacardwar:["newly_wheat"]}]
scoreboard players operation #cacard.aiHand_newly_wheat cacard.players += #cacard.aiAbsorb cacard.players

execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_data~{cacardwar:["newly_bread"]}]
scoreboard players operation #cacard.aiHand_newly_bread cacard.players += #cacard.aiAbsorb cacard.players

execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_data~{cacardwar:["rotten"]}]
scoreboard players operation #cacard.aiHand_rotten cacard.players += #cacard.aiAbsorb cacard.players

execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] player_head[custom_data~{cacardwar:["head"]}]
scoreboard players operation #cacard.aiHand_head cacard.players += #cacard.aiAbsorb cacard.players

execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_data~{cacardwar:["head_zombie"]}]
scoreboard players operation #cacard.aiHand_head_zombie cacard.players += #cacard.aiAbsorb cacard.players

execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_data~{cacardwar:["mineral_clump"]}]
scoreboard players operation #cacard.aiHand_mineral_clump cacard.players += #cacard.aiAbsorb cacard.players

