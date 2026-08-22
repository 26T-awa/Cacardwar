# AI 训练模式 - 放置 log（卡索引 5）到槽位 $(slot)，类型 $(type)：0=加牌(槽空) 1=改牌(槽有卡)
# 校验：手牌 >= 1
execute unless score #cacard.aiHand_log cacard.players matches 1.. run return 0
# 加牌：槽必须为空
$execute if score #cacard.aiType cacard.players matches 0 unless items entity @e[tag=cacard.blue$(slot)] contents *[custom_data~{cacardwar:["card"]}] run item replace entity @e[tag=cacard.blue$(slot),limit=1] contents with oak_log[enchantment_glint_override=true,custom_name=[{"text":"§a卡牌 §7-- §l原木"}],custom_data={cacardwar:["log","card"],cacard.recipe5:1b},custom_model_data={strings:["cacardwar:log"]},lore=[{"text":"§7§o手持并等待以展示参与的复杂配方。"}]]
# 改牌：槽必须有卡
$execute if score #cacard.aiType cacard.players matches 1 if items entity @e[tag=cacard.blue$(slot)] contents *[custom_data~{cacardwar:["card"]}] run item replace entity @e[tag=cacard.blue$(slot),limit=1] contents with oak_log[enchantment_glint_override=true,custom_name=[{"text":"§a卡牌 §7-- §l原木"}],custom_data={cacardwar:["log","card"],cacard.recipe5:1b},custom_model_data={strings:["cacardwar:log"]},lore=[{"text":"§7§o手持并等待以展示参与的复杂配方。"}]]
# 放置成功 -> 手牌 -1
$execute if items entity @e[tag=cacard.blue$(slot)] contents *[custom_model_data~{strings:["cacardwar:log"]}] run scoreboard players remove #cacard.aiHand_log cacard.players 1
