#清空/放置/跳过
clear @a[tag=cacard.inAImode,limit=1] *[custom_data~{cacardwar:["ai_act"]}]

item replace entity @a[tag=cacard.inAImode,limit=1] container.29 with barrier[enchantment_glint_override=true,custom_name={text:"§7操作 - §c清空"},custom_data={cacardwar:["ai_act","ai_act_clear_slot","non-card"]},custom_model_data={strings:["cacardwar:ai_act_clear_slot"]},lore=[]] 1
item replace entity @a[tag=cacard.inAImode,limit=1] container.31 with paper[enchantment_glint_override=true,custom_name={text:"§7操作 - §b放置卡牌"},custom_data={cacardwar:["ai_act","ai_act_place","non-card"]},custom_model_data={strings:["cacardwar:ai_act_place"]},lore=[]]
item replace entity @a[tag=cacard.inAImode,limit=1] container.33 with lime_concrete[enchantment_glint_override=true,custom_name={text:"§7操作 - §a跳过回合"},custom_data={cacardwar:["ai_act","ai_act_skip","non-card"]},custom_model_data={strings:["cacardwar:ai_act_skip"]},lore=[]]

function cacardwar:ai/constructor/cst_before

#- >清空L2_1 -> 选择槽位L3_1 -> 执行
#-> 放置L2_2 -> 选择卡牌L3_2 -> 选择槽位L3_3 -> 执行
#-> 跳过L2_3 -> 执行