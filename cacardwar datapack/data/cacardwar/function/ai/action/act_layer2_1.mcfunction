#清空-槽位选择
clear @a[tag=cacard.inAImode,limit=1] *[custom_data~{cacardwar:["ai_act"]}]
tag @a[tag=cacard.inAImode,limit=1,tag=!cacard.ai_clean] add cacard.ai_clean

#execute if data entity @e[tag=cacard.blue0~9,limit=1] Item run item replace entity @a[tag=cacard.inAImode,limit=1] inventory.0~9 with lime_concrete[enchantment_glint_override=true,custom_name={text:"§a槽位0~9"},custom_data={cacardwar:["ai_act","slot0~9","slot","non-card"]},custom_model_data={strings:["cacardwar:ai_act_slot0~9"]},lore=[[{text:"§a按"},{keybind:"key.swapOffhand",color:"green",italic:false},{text:"§a执行操作 §7- §a选择槽位0~9"}]]]
function cacardwar:main/others/loop_entry {min:0,max:10,bias:26,command:'function cacardwar:ai/action/loop/func1 with storage cacardwar:loop'}

#execute unless data entity @e[tag=cacard.blue0~9,limit=1] Item run item replace entity @a[tag=cacard.inAImode,limit=1] inventory.0~9 with red_concrete[enchantment_glint_override=true,custom_name={text:"§c§m槽位0~9"},custom_data={cacardwar:["ai_act","disabled_slot","non-card"]},custom_model_data={strings:["cacardwar:ai_act_dis_slot"]},lore=[{text:"§c无法选择此槽位！"}]]
function cacardwar:main/others/loop_entry {min:0,max:10,bias:26,command:'function cacardwar:ai/action/loop/func2 with storage cacardwar:loop'}
