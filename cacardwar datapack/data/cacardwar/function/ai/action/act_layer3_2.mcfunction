#放置-记录并回收卡牌
scoreboard players display name cacard.info8 cacard.Info {text:"§eRecording..."}

item replace block -5 -59 -77 container.13 from entity @s weapon.offhand {function:"set_count",count:1}

scoreboard players set #cacard.ai_place_cardID cacard.point -1
function cacardwar:main/others/loop_entry {min:1,max:18,bias:0,command:'function cacardwar:ai/action/loop/func3 with storage cacardwar:loop'}
tellraw @a[tag=cacard.inAImode,limit=1] [{text:"§o选择卡牌ID:"},{score:{objective:cacard.point,name:"#cacard.ai_place_cardID"}}]
#归还卡牌
item replace entity @s container.22 from entity @s weapon.offhand
item replace entity @s weapon.offhand with air
#引出下一步选择空卡槽
tag @s[tag=cacard.inAImode,tag=!cacard.ai_placed_card,tag=cacard.ai_place] add cacard.ai_placed_card
tag @s[tag=cacard.ai_placed_card] remove cacard.ai_place
item replace entity @a[tag=cacard.inAImode,limit=1] container.25 with yellow_concrete[enchantment_glint_override=true,custom_name={text:"§e返回"},custom_data={cacardwar:["ai_act","ai_act_back","non-card"]},custom_model_data={strings:["cacardwar:ai_act_back"]},lore=[[{text:"§e按"},{keybind:"key.swapOffhand",color:"green",italic:false},{text:"§e返回"}]]]
#execute unless data entity @e[tag=cacard.blue0~9,limit=1] Item run item replace entity @a[tag=cacard.inAImode,limit=1] container.26~35 with lime_concrete[enchantment_glint_override=true,custom_name={text:"§a槽位0~9"},custom_data={cacardwar:["ai_act","slot0~9","non-card"]},custom_model_data={strings:["cacardwar:ai_act_slot0~9"]},lore=[[{text:"§a按"},{keybind:"key.swapOffhand",color:"green",italic:false},{text:"§a执行操作 §7- §a选择槽位0~9"}]]]
function cacardwar:main/others/loop_entry {min:0,max:10,bias:26,command:'function cacardwar:ai/action/loop/func6 with storage cacardwar:loop'}
#execute if data entity @e[tag=cacard.blue0~9,limit=1] Item run item replace entity @a[tag=cacard.inAImode,limit=1] container.26~35 with red_concrete[enchantment_glint_override=true,custom_name={text:"§c§m槽位0~9"},custom_data={cacardwar:["ai_act","disabled_slot","non-card"]},custom_model_data={strings:["cacardwar:ai_act_dis_slot"]},lore=[{text:"§c无法选择此槽位！"}]]
function cacardwar:main/others/loop_entry {min:0,max:10,bias:26,command:'function cacardwar:ai/action/loop/func7 with storage cacardwar:loop'}
