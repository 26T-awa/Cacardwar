#放置-记录并回收卡牌
scoreboard players display name cacard.info8 cacard.Info {text:"§eRecording..."}

execute unless entity @a[tag=cacard.inAImode.auto] at @e[tag=cacard.center] run item replace block ~15 ~ ~9 container.0 from entity @s weapon.offhand {function:"set_count",count:1}
execute if entity @a[tag=cacard.inAImode.auto] run scoreboard players operation #cacard.ai_action_mask cacard.up = #cacard.ai_action_mask cacard.down
execute if entity @a[tag=cacard.inAImode.auto] run scoreboard players remove #cacard.ai_action_mask cacard.up 1

scoreboard players set #cacard.ai_place_cardID cacard.point -1
execute if entity @a[tag=cacard.inAImode.auto] store result score #cacard.ai_place_cardID cacard.point run scoreboard players operation #cacard.ai_action_mask cacard.up /= #10 cacard.point
function cacardwar:main/others/loop_entry {min:1,max:18,bias:0,command:'function cacardwar:ai/action/loop/func3 with storage cacardwar:loop'}
tellraw @a[tag=cacard.inAImode,limit=1] [{text:"§o选择卡牌ID:"},{score:{objective:cacard.point,name:"#cacard.ai_place_cardID"}}]
#手动情况下归还卡牌
execute unless entity @a[tag=cacard.inAImode.auto] run item replace entity @s container.22 from entity @s weapon.offhand
execute unless entity @a[tag=cacard.inAImode.auto] run item replace entity @s weapon.offhand with air
#手动情况下引出下一步选择空卡槽
execute unless entity @a[tag=cacard.inAImode.auto] run tag @s[tag=cacard.inAImode,tag=!cacard.ai_placed_card,tag=cacard.ai_place] add cacard.ai_placed_card
execute unless entity @a[tag=cacard.inAImode.auto] run tag @s[tag=cacard.ai_placed_card] remove cacard.ai_place
execute unless entity @a[tag=cacard.inAImode.auto] run item replace entity @a[tag=cacard.inAImode,limit=1] container.25 with yellow_concrete[enchantment_glint_override=true,custom_name={text:"§e返回"},custom_data={cacardwar:["ai_act","ai_act_back","non-card"]},custom_model_data={strings:["cacardwar:ai_act_back"]},lore=[[{text:"§e按"},{keybind:"key.swapOffhand",color:"green",italic:false},{text:"§e返回"}]]]
#execute unless data entity @e[tag=cacard.blue0~9,limit=1] Item run item replace entity @a[tag=cacard.inAImode,limit=1] container.26~35 with lime_concrete[enchantment_glint_override=true,custom_name={text:"§a槽位0~9"},custom_data={cacardwar:["ai_act","slot0~9","non-card"]},custom_model_data={strings:["cacardwar:ai_act_slot0~9"]},lore=[[{text:"§a按"},{keybind:"key.swapOffhand",color:"green",italic:false},{text:"§a执行操作 §7- §a选择槽位0~9"}]]]
execute unless entity @a[tag=cacard.inAImode.auto] run function cacardwar:main/others/loop_entry {min:0,max:10,bias:26,command:'function cacardwar:ai/action/loop/func6 with storage cacardwar:loop'}
#execute if data entity @e[tag=cacard.blue0~9,limit=1] Item run item replace entity @a[tag=cacard.inAImode,limit=1] container.26~35 with red_concrete[enchantment_glint_override=true,custom_name={text:"§c§m槽位0~9"},custom_data={cacardwar:["ai_act","disabled_slot","non-card"]},custom_model_data={strings:["cacardwar:ai_act_dis_slot"]},lore=[{text:"§c无法选择此槽位！"}]]
execute unless entity @a[tag=cacard.inAImode.auto] run function cacardwar:main/others/loop_entry {min:0,max:10,bias:26,command:'function cacardwar:ai/action/loop/func7 with storage cacardwar:loop'}
#自动情况下直接执行下一步
execute if entity @a[tag=cacard.inAImode.auto] run function cacardwar:ai/action/act_layer3_3