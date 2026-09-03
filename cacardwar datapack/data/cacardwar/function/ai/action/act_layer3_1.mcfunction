#清空-记录并清空槽位
scoreboard players display name cacard.info8 cacard.Info {text:"§eRecording..."}

scoreboard players set #cacard.ai_clean_slotID cacard.point -1
execute if entity @a[tag=cacard.inAImode.auto] if score #cacard.ai_action_mask cacard.down matches 1..10 run scoreboard players operation #cacard.ai_clean_slotID cacard.point = #cacard.ai_action_mask cacard.down
execute if entity @a[tag=cacard.inAImode.auto] if score #cacard.ai_action_mask cacard.down matches 1..10 run scoreboard players remove #cacard.ai_clean_slotID cacard.point 1
execute if entity @a[tag=cacard.inAImode.auto] if score #cacard.ai_action_mask cacard.down matches 1..10 if score #cacard.ai_clean_slotID cacard.point matches 0 run item replace entity @a[tag=cacard.inAImode,limit=1] container.23 from entity @e[tag=cacard.blue0,limit=1] contents

function cacardwar:main/others/loop_entry {min:0,max:10,bias:0,command:'function cacardwar:ai/action/loop/func5 with storage cacardwar:loop'}
tellraw @a[tag=cacard.inAImode,limit=1] [{text:"§o选择槽位ID:"},{score:{objective:cacard.point,name:"#cacard.ai_clean_slotID"}}]
#触发规则Rule12
execute if score #cacard.ai_clean_slotID cacard.point matches 1..9 run function cacardwar:ai/calculation/rule12 {arg1:0}
execute if score #cacard.ai_clean_slotID cacard.point matches 0 run function cacardwar:ai/calculation/rule12 {arg1:1}
#计算action
scoreboard players set #cacard.ai_clean cacard.point 1
execute store result storage cacardwar:ai pending_sample.action short 1 run scoreboard players operation #cacard.ai_clean cacard.point += #cacard.ai_clean_slotID cacard.point
tellraw @a[tag=cacard.inAImode,limit=1] [{text:"§oaction计算结果:"},{score:{objective:cacard.point,name:"#cacard.ai_clean"}}]
execute unless entity @a[tag=cacard.inAImode.auto] run item replace entity @s weapon.offhand with air
#下一轮
schedule function cacardwar:ai/constructor/cst_after 10t
schedule function cacardwar:ai/action/act_layer1 12t
