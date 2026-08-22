# AI 训练模式 - 放置 head_zombie（卡索引 15）到槽位 $(slot)，类型 $(type)：0=加牌(槽空) 1=改牌(槽有卡)
# 校验：手牌 >= 1
execute unless score #cacard.aiHand_head_zombie cacard.players matches 1.. run return 0
# 加牌：槽必须为空
$execute if score #cacard.aiType cacard.players matches 0 unless items entity @e[tag=cacard.blue$(slot)] contents *[custom_data~{cacardwar:["card"]}] run item replace entity @e[tag=cacard.blue$(slot),limit=1] contents with zombie_head[enchantment_glint_override=true,custom_name=[{"text":"§a卡牌 §7-- §3§l僵尸头颅"}],custom_data={cacardwar:["head","head_zombie","card"]},custom_model_data={strings:["cacardwar:head_zombie"]},lore=[{"text":"§7§o手持并等待以展示参与的复杂配方。"}]]
# 改牌：槽必须有卡
$execute if score #cacard.aiType cacard.players matches 1 if items entity @e[tag=cacard.blue$(slot)] contents *[custom_data~{cacardwar:["card"]}] run item replace entity @e[tag=cacard.blue$(slot),limit=1] contents with zombie_head[enchantment_glint_override=true,custom_name=[{"text":"§a卡牌 §7-- §3§l僵尸头颅"}],custom_data={cacardwar:["head","head_zombie","card"]},custom_model_data={strings:["cacardwar:head_zombie"]},lore=[{"text":"§7§o手持并等待以展示参与的复杂配方。"}]]
# 放置成功 -> 手牌 -1
$execute if items entity @e[tag=cacard.blue$(slot)] contents *[custom_model_data~{strings:["cacardwar:head_zombie"]}] run scoreboard players remove #cacard.aiHand_head_zombie cacard.players 1
