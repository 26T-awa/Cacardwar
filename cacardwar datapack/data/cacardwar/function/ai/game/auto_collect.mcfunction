#自动采集
execute if entity @a[tag=cacard.inAImode.auto] run function cacardwar:ai/game/cal
execute store result score #cacard.ai_action_mask cacard.down run data get storage cacardwar:ai action.key 1

#tellraw @a ["执行动作:",{score:{name:"#cacard.ai_action_mask",objective:"cacard.down"}}]
execute if score #cacard.ai_action_mask cacard.down matches 0 run function cacardwar:ai/action/act_layer2_3
execute if score #cacard.ai_action_mask cacard.down matches 1..10 run function cacardwar:ai/action/act_layer3_1
execute if score #cacard.ai_action_mask cacard.down matches 11..180 run function cacardwar:ai/action/act_layer3_2

scoreboard players set #cacard.ai_action_mask cacard.down -1
