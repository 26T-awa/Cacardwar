# AI 训练模式 - 放置 newly_bread（卡索引 12）到槽位 $(slot)，类型 $(type)：0=加牌(槽空) 1=改牌(槽有卡)
# 校验：手牌 >= 1
execute unless score #cacard.aiHand_newly_bread cacard.players matches 1.. run return 0
# 加牌：槽必须为空
$execute if score #cacard.aiType cacard.players matches 0 unless items entity @e[tag=cacard.blue$(slot)] contents *[custom_data~{cacardwar:["card"]}] run data modify entity @e[tag=cacard.blue$(slot),limit=1] Item set value {id:"minecraft:bread",count:1,components:{enchantment_glint_override:true,custom_name:'[{"text":"§a卡牌 §7-- §6§l新生的面包"}]',custom_data:{cacardwar:["newly_bread","card"]},custom_model_data:{strings:["cacardwar:newly_bread"]},lore:['{"text":"§7§o手持并等待以展示参与的复杂配方。"}']}}
# 改牌：槽必须有卡
$execute if score #cacard.aiType cacard.players matches 1 if items entity @e[tag=cacard.blue$(slot)] contents *[custom_data~{cacardwar:["card"]}] run data modify entity @e[tag=cacard.blue$(slot),limit=1] Item set value {id:"minecraft:bread",count:1,components:{enchantment_glint_override:true,custom_name:'[{"text":"§a卡牌 §7-- §6§l新生的面包"}]',custom_data:{cacardwar:["newly_bread","card"]},custom_model_data:{strings:["cacardwar:newly_bread"]},lore:['{"text":"§7§o手持并等待以展示参与的复杂配方。"}']}}
# 放置成功 -> 手牌 -1
$execute if items entity @e[tag=cacard.blue$(slot)] contents *[custom_data~{cacardwar:["cacardwar:newly_bread"]}] run scoreboard players remove #cacard.aiHand_newly_bread cacard.players 1
