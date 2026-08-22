# AI 训练模式 - 吸收：把玩家背包里的卡牌转入计分板手牌并清空背包
execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:iron_ingot"]}] 0
scoreboard players operation #cacard.aiHand_iron_ingot cacard.players += #cacard.aiAbsorb cacard.players
clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:iron_ingot"]}]
execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:gold_ingot"]}] 0
scoreboard players operation #cacard.aiHand_gold_ingot cacard.players += #cacard.aiAbsorb cacard.players
clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:gold_ingot"]}]
execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:diamond"]}] 0
scoreboard players operation #cacard.aiHand_diamond cacard.players += #cacard.aiAbsorb cacard.players
clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:diamond"]}]
execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:gunpowder"]}] 0
scoreboard players operation #cacard.aiHand_gunpowder cacard.players += #cacard.aiAbsorb cacard.players
clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:gunpowder"]}]
execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:stick"]}] 0
scoreboard players operation #cacard.aiHand_stick cacard.players += #cacard.aiAbsorb cacard.players
clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:stick"]}]
execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:log"]}] 0
scoreboard players operation #cacard.aiHand_log cacard.players += #cacard.aiAbsorb cacard.players
clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:log"]}]
execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:plank"]}] 0
scoreboard players operation #cacard.aiHand_plank cacard.players += #cacard.aiAbsorb cacard.players
clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:plank"]}]
execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:apple"]}] 0
scoreboard players operation #cacard.aiHand_apple cacard.players += #cacard.aiAbsorb cacard.players
clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:apple"]}]
execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:wheat"]}] 0
scoreboard players operation #cacard.aiHand_wheat cacard.players += #cacard.aiAbsorb cacard.players
clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:wheat"]}]
execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:another_two"]}] 0
scoreboard players operation #cacard.aiHand_another_two cacard.players += #cacard.aiAbsorb cacard.players
clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:another_two"]}]
execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:deal"]}] 0
scoreboard players operation #cacard.aiHand_deal cacard.players += #cacard.aiAbsorb cacard.players
clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:deal"]}]
execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:newly_wheat"]}] 0
scoreboard players operation #cacard.aiHand_newly_wheat cacard.players += #cacard.aiAbsorb cacard.players
clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:newly_wheat"]}]
execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:newly_bread"]}] 0
scoreboard players operation #cacard.aiHand_newly_bread cacard.players += #cacard.aiAbsorb cacard.players
clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:newly_bread"]}]
execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:rotten"]}] 0
scoreboard players operation #cacard.aiHand_rotten cacard.players += #cacard.aiAbsorb cacard.players
clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:rotten"]}]
execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:head"]}] 0
scoreboard players operation #cacard.aiHand_head cacard.players += #cacard.aiAbsorb cacard.players
clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:head"]}]
execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:head_zombie"]}] 0
scoreboard players operation #cacard.aiHand_head_zombie cacard.players += #cacard.aiAbsorb cacard.players
clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:head_zombie"]}]
execute store result score #cacard.aiAbsorb cacard.players run clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:mineral_clump"]}] 0
scoreboard players operation #cacard.aiHand_mineral_clump cacard.players += #cacard.aiAbsorb cacard.players
clear @a[tag=cacard.ai,limit=1] *[custom_model_data~{strings:["cacardwar:mineral_clump"]}]