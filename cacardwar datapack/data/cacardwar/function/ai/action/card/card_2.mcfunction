# AI 训练模式 - 放置 diamond（卡索引 2）到槽位 $(slot)，类型 $(type)：0=加牌(槽空) 1=改牌(槽有卡)
# 校验：手牌 >= 1
execute unless score #cacard.aiHand_diamond cacard.players matches 1.. run return 0
# 加牌：槽必须为空
$execute if score #cacard.aiType cacard.players matches 0 unless items entity @e[tag=cacard.blue$(slot)] contents *[custom_data~{cacardwar:["card"]}] run data modify entity @e[tag=cacard.blue$(slot),limit=1] Item set value {id:"minecraft:diamond",count:1,components:{enchantment_glint_override:true,custom_name:'[{"text":"§a卡牌 §7-- §b§l钻石"}]',custom_data:{cacardwar:["diamond","mineral","card"],cacard.recipe1:1b,cacard.recipe3:1b,cacard.recipe4:1b,cacard.recipe10:1b,cacard.recipe12:1b,cacard.recipe15:1b},custom_model_data:{strings:["cacardwar:diamond"]},lore:['{"text":"§7§o手持并等待以展示参与的复杂配方。"}']}}
# 改牌：槽必须有卡
$execute if score #cacard.aiType cacard.players matches 1 if items entity @e[tag=cacard.blue$(slot)] contents *[custom_data~{cacardwar:["card"]}] run data modify entity @e[tag=cacard.blue$(slot),limit=1] Item set value {id:"minecraft:diamond",count:1,components:{enchantment_glint_override:true,custom_name:'[{"text":"§a卡牌 §7-- §b§l钻石"}]',custom_data:{cacardwar:["diamond","mineral","card"],cacard.recipe1:1b,cacard.recipe3:1b,cacard.recipe4:1b,cacard.recipe10:1b,cacard.recipe12:1b,cacard.recipe15:1b},custom_model_data:{strings:["cacardwar:diamond"]},lore:['{"text":"§7§o手持并等待以展示参与的复杂配方。"}']}}
# 放置成功 -> 手牌 -1
$execute if items entity @e[tag=cacard.blue$(slot)] contents *[custom_data~{cacardwar:["cacardwar:diamond"]}] run scoreboard players remove #cacard.aiHand_diamond cacard.players 1
