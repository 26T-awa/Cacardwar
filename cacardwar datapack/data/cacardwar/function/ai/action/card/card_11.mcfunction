# AI 训练模式 - 放置 newly_wheat（卡索引 11）到槽位 $(slot)，类型 $(type)：0=加牌(槽空) 1=改牌(槽有卡)
# 校验：手牌 >= 1
execute unless score #cacard.aiHand_newly_wheat cacard.players matches 1.. run return 0
# 加牌：槽必须为空
$execute if score #cacard.aiType cacard.players matches 0 unless items entity @e[tag=cacard.blue$(slot)] contents *[custom_data~{cacardwar:["card"]}] run data modify entity @e[tag=cacard.blue$(slot),limit=1] Item set value {id:"minecraft:wheat",count:1,components:{enchantment_glint_override:true,custom_name:'[{"text":"§a卡牌 §7-- §a§l新生的小麦"}]',custom_data:{cacardwar:["newly_wheat","card"]},custom_model_data:{strings:["cacardwar:newly_wheat"]},lore:['{"text":"§7§o手持并等待以展示参与的复杂配方。"}']}}
# 改牌：槽必须有卡
$execute if score #cacard.aiType cacard.players matches 1 if items entity @e[tag=cacard.blue$(slot)] contents *[custom_data~{cacardwar:["card"]}] run data modify entity @e[tag=cacard.blue$(slot),limit=1] Item set value {id:"minecraft:wheat",count:1,components:{enchantment_glint_override:true,custom_name:'[{"text":"§a卡牌 §7-- §a§l新生的小麦"}]',custom_data:{cacardwar:["newly_wheat","card"]},custom_model_data:{strings:["cacardwar:newly_wheat"]},lore:['{"text":"§7§o手持并等待以展示参与的复杂配方。"}']}}
# 放置成功 -> 手牌 -1
$execute if items entity @e[tag=cacard.blue$(slot)] contents *[custom_data~{cacardwar:["cacardwar:newly_wheat"]}] run scoreboard players remove #cacard.aiHand_newly_wheat cacard.players 1
