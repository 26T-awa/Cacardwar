#放置-卡牌选择
scoreboard players display name cacard.info8 cacard.Info {text:"§7Now's been selected [place]."}

clear @a[tag=cacard.inAImode,limit=1] *[custom_data~{cacardwar:["ai_act"]}]
tag @a[tag=cacard.inAImode,limit=1,tag=!cacard.ai_place] add cacard.ai_place

item replace entity @a container.30 with yellow_concrete[enchantment_glint_override=true,custom_name={text:"§e将卡牌移动到副手进行操作"},custom_data={cacardwar:["ai_act","card_place_info","non-card"]},custom_model_data={strings:["cacardwar:ai_act_card_place_info"]},lore=[]]
item replace entity @a container.31 with yellow_concrete[enchantment_glint_override=true,custom_name={text:"§e物品将会回收1*，并转移至此位置的上方一格"},custom_data={cacardwar:["ai_act","card_place_info","non-card"]},custom_model_data={strings:["cacardwar:ai_act_card_place_info"]},lore=[]]
item replace entity @a container.32 with yellow_concrete[enchantment_glint_override=true,custom_name={text:"§e随后，选择一个空槽位"},custom_data={cacardwar:["ai_act","card_place_info","non-card"]},custom_model_data={strings:["cacardwar:ai_act_card_place_info"]},lore=[]]
