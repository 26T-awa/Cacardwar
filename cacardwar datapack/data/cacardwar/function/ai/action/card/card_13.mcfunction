# AI 训练模式 - 放置 rotten（卡索引 13）到槽位 $(slot)，类型 $(type)：0=加牌(槽空) 1=改牌(槽有卡)
# 校验：手牌 >= 1
execute unless score #cacard.aiHand_rotten cacard.players matches 1.. run return 0
# 加牌：槽必须为空
$execute if score #cacard.aiType cacard.players matches 0 unless items entity @e[tag=cacard.blue$(slot)] contents *[custom_data~{cacardwar:["card"]}] run item replace entity @e[tag=cacard.blue$(slot),limit=1] contents with rotten_flesh[enchantment_glint_override=true,custom_name=[{"text":"§a卡牌 §7-- §4§l腐肉"}],custom_data={cacardwar:["rotten","card"],cacard.recipe13:1b},custom_model_data={strings:["cacardwar:rotten"]},lore=[{"text":"§7§o手持并等待以展示参与的复杂配方。"}]]
# 改牌：槽必须有卡
$execute if score #cacard.aiType cacard.players matches 1 if items entity @e[tag=cacard.blue$(slot)] contents *[custom_data~{cacardwar:["card"]}] run item replace entity @e[tag=cacard.blue$(slot),limit=1] contents with rotten_flesh[enchantment_glint_override=true,custom_name=[{"text":"§a卡牌 §7-- §4§l腐肉"}],custom_data={cacardwar:["rotten","card"],cacard.recipe13:1b},custom_model_data={strings:["cacardwar:rotten"]},lore=[{"text":"§7§o手持并等待以展示参与的复杂配方。"}]]
# 放置成功 -> 手牌 -1
$execute if items entity @e[tag=cacard.blue$(slot)] contents *[custom_model_data~{strings:["cacardwar:rotten"]}] run scoreboard players remove #cacard.aiHand_rotten cacard.players 1
