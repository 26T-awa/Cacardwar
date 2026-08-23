# AI 训练模式 - 放置 iron_ingot（卡索引 0）到槽位 $(slot)，类型 $(type)：0=加牌(槽空) 1=改牌(槽有卡)
# 校验：手牌 >= 1
execute unless score #cacard.aiHand_iron_ingot cacard.players matches 1.. run return 0
# 加牌：槽必须为空
$execute if score #cacard.aiType cacard.players matches 0 unless items entity @e[tag=cacard.blue$(slot)] contents *[custom_data~{cacardwar:["card"]}] run item replace entity @e[tag=cacard.blue$(slot),limit=1] contents with iron_ingot[enchantment_glint_override=true,custom_name=[{"text":"§a卡牌 §7-- §f§l铁锭"}],custom_data={cacardwar:["iron_ingot","mineral","card","card1"],cacard.recipe1:1b,cacard.recipe3:1b,cacard.recipe4:1b,cacard.recipe9:1b,cacard.recipe10:1b,cacard.recipe12:1b,cacard.recipe15:1b},custom_model_data={strings:["cacardwar:iron_ingot"]},lore=[{"text":"§7§o手持并等待以展示参与的复杂配方。"}]]
# 改牌：槽必须有卡
$execute if score #cacard.aiType cacard.players matches 1 if items entity @e[tag=cacard.blue$(slot)] contents *[custom_data~{cacardwar:["card"]}] run item replace entity @e[tag=cacard.blue$(slot),limit=1] contents with iron_ingot[enchantment_glint_override=true,custom_name=[{"text":"§a卡牌 §7-- §f§l铁锭"}],custom_data={cacardwar:["iron_ingot","mineral","card","card1"],cacard.recipe1:1b,cacard.recipe3:1b,cacard.recipe4:1b,cacard.recipe9:1b,cacard.recipe10:1b,cacard.recipe12:1b,cacard.recipe15:1b},custom_model_data={strings:["cacardwar:iron_ingot"]},lore=[{"text":"§7§o手持并等待以展示参与的复杂配方。"}]]
# 放置成功 -> 手牌 -1
$execute if items entity @e[tag=cacard.blue$(slot)] contents *[custom_model_data~{strings:["cacardwar:iron_ingot"]}] run scoreboard players remove #cacard.aiHand_iron_ingot cacard.players 1
