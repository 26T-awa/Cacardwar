#放置-记录卡槽
scoreboard players display name cacard.info8 cacard.Info {text:"§7Recorded and §eRecording..."}
execute if entity @a[tag=cacard.inAImode.auto] run scoreboard players operation #cacard.ai_action_mask cacard.up = #cacard.ai_action_mask cacard.down
execute if entity @a[tag=cacard.inAImode.auto] run scoreboard players remove #cacard.ai_action_mask cacard.up 1

scoreboard players set #cacard.ai_place_slotID cacard.point -1
execute if entity @a[tag=cacard.inAImode.auto] store result score #cacard.ai_place_slotID cacard.point run scoreboard players operation #cacard.ai_action_mask cacard.up %= #10 cacard.point
function cacardwar:main/others/loop_entry {min:0,max:10,bias:0,command:'function cacardwar:ai/action/loop/func4 with storage cacardwar:loop'}
tellraw @a[tag=cacard.inAImode,limit=1] [{text:"§o选择槽位:"},{score:{objective:cacard.point,name:"#cacard.ai_place_slotID"}}]
clear @s *[custom_data~{cacardwar:["slot"]}]
#计算放置卡牌的action = 11+(X−1)×10+Y
scoreboard players set #cacard.ai_place cacard.point 11
scoreboard players remove #cacard.ai_place_cardID cacard.point 1
scoreboard players operation #cacard.ai_place_cardID cacard.point *= #10 cacard.point
execute store result score #cacard.ai_place cacard.players run scoreboard players operation #cacard.ai_place_cardID cacard.point += #cacard.ai_place_slotID cacard.point
execute store result storage cacardwar:ai pending_sample.action short 1 run scoreboard players operation #cacard.ai_place cacard.point += #cacard.ai_place cacard.players
tellraw @a[tag=cacard.inAImode,limit=1] [{text:"§oaction计算结果:"},{score:{objective:cacard.point,name:"#cacard.ai_place"}}]
#下一轮
schedule function cacardwar:ai/constructor/cst_after 10t
schedule function cacardwar:ai/action/act_layer1 12t