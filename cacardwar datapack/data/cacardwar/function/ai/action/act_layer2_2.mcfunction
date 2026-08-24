#放置-卡牌选择
clear @a[tag=cacard.inAImode,limit=1] *[custom_data~{cacardwar:["ai_act"]}]

item replace entity @a container.31 with yellow_concrete[enchantment_glint_override=true,custom_name={text:"§e将卡牌移动到副手进行操作"},custom_data={cacardwar:["ai_act","card_place_info","non-card"]},custom_model_data={strings:["cacardwar:ai_act_card_place_info"]},lore=[{text:"§e将卡牌移动到副手进行操作"}]]
