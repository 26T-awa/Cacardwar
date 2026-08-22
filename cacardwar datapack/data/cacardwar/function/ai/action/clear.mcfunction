# AI 训练模式 - 动作 1~10：清空槽位（槽位卡牌回收进手牌）
# 槽位 = action-1
scoreboard players operation #cacard.aiSlot cacard.players = #cacard.aiDecode cacard.players
scoreboard players remove #cacard.aiSlot cacard.players 1
# ===== 回收槽位卡牌进手牌 =====
execute if score #cacard.aiSlot cacard.players matches 0 if items entity @e[tag=cacard.blue0] contents *[custom_data~{cacardwar:["iron_ingot"]}] run scoreboard players add #cacard.aiHand_iron_ingot cacard.players 1
execute if score #cacard.aiSlot cacard.players matches 0 if items entity @e[tag=cacard.blue0] contents *[custom_data~{cacardwar:["gold_ingot"]}] run scoreboard players add #cacard.aiHand_gold_ingot cacard.players 1
execute if score #cacard.aiSlot cacard.players matches 0 if items entity @e[tag=cacard.blue0] contents *[custom_data~{cacardwar:["diamond"]}] run scoreboard players add #cacard.aiHand_diamond cacard.players 1
execute if score #cacard.aiSlot cacard.players matches 0 if items entity @e[tag=cacard.blue0] contents *[custom_data~{cacardwar:["gunpowder"]}] run scoreboard players add #cacard.aiHand_gunpowder cacard.players 1
execute if score #cacard.aiSlot cacard.players matches 0 if items entity @e[tag=cacard.blue0] contents *[custom_data~{cacardwar:["stick"]}] run scoreboard players add #cacard.aiHand_stick cacard.players 1
execute if score #cacard.aiSlot cacard.players matches 0 if items entity @e[tag=cacard.blue0] contents *[custom_data~{cacardwar:["log"]}] run scoreboard players add #cacard.aiHand_log cacard.players 1
execute if score #cacard.aiSlot cacard.players matches 0 if items entity @e[tag=cacard.blue0] contents *[custom_data~{cacardwar:["plank"]}] run scoreboard players add #cacard.aiHand_plank cacard.players 1
execute if score #cacard.aiSlot cacard.players matches 0 if items entity @e[tag=cacard.blue0] contents *[custom_data~{cacardwar:["apple"]}] run scoreboard players add #cacard.aiHand_apple cacard.players 1
execute if score #cacard.aiSlot cacard.players matches 0 if items entity @e[tag=cacard.blue0] contents *[custom_data~{cacardwar:["wheat"]}] run scoreboard players add #cacard.aiHand_wheat cacard.players 1
execute if score #cacard.aiSlot cacard.players matches 0 if items entity @e[tag=cacard.blue0] contents *[custom_data~{cacardwar:["another_two"]}] run scoreboard players add #cacard.aiHand_another_two cacard.players 1
execute if score #cacard.aiSlot cacard.players matches 0 if items entity @e[tag=cacard.blue0] contents *[custom_data~{cacardwar:["deal"]}] run scoreboard players add #cacard.aiHand_deal cacard.players 1
execute if score #cacard.aiSlot cacard.players matches 0 if items entity @e[tag=cacard.blue0] contents *[custom_data~{cacardwar:["newly_wheat"]}] run scoreboard players add #cacard.aiHand_newly_wheat cacard.players 1
execute if score #cacard.aiSlot cacard.players matches 0 if items entity @e[tag=cacard.blue0] contents *[custom_data~{cacardwar:["newly_bread"]}] run scoreboard players add #cacard.aiHand_newly_bread cacard.players 1
execute if score #cacard.aiSlot cacard.players matches 0 if items entity @e[tag=cacard.blue0] contents *[custom_data~{cacardwar:["rotten"]}] run scoreboard players add #cacard.aiHand_rotten cacard.players 1
execute if score #cacard.aiSlot cacard.players matches 0 if items entity @e[tag=cacard.blue0] contents *[custom_data~{cacardwar:["head"]}] run scoreboard players add #cacard.aiHand_head cacard.players 1
execute if score #cacard.aiSlot cacard.players matches 0 if items entity @e[tag=cacard.blue0] contents *[custom_data~{cacardwar:["head_zombie"]}] run scoreboard players add #cacard.aiHand_head_zombie cacard.players 1
execute if score #cacard.aiSlot cacard.players matches 0 if items entity @e[tag=cacard.blue0] contents *[custom_data~{cacardwar:["mineral_clump"]}] run scoreboard players add #cacard.aiHand_mineral_clump cacard.players 1
execute if score #cacard.aiSlot cacard.players matches 0 run data remove entity @e[tag=cacard.blue0,limit=1] Item
# ===== 标记待结算（2 tick 后写样本）=====
scoreboard players set #cacard.aiResolve cacard.players 2
