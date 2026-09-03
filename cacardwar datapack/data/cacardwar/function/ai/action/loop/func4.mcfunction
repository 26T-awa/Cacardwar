#function cacardwar:ai/action/loop/func4 with storage cacardwar:loop
#手动情况
$execute if items entity @s weapon.offhand *[custom_data~{cacardwar:["slot$(current)"]}] run scoreboard players operation #cacard.ai_place_slotID cacard.point = #cacard.loop cacard.time
$execute if score #cacard.ai_place_slotID cacard.point = #cacard.loop cacard.time at @e[tag=cacard.center] run item replace entity @e[tag=cacard.blue$(current),limit=1] contents from block ~15 ~ ~9 container.0
#自动情况
$execute if entity @a[tag=cacard.inAImode.auto] if score #cacard.ai_action_mask cacard.down matches 11..180 if score #cacard.ai_place_slotID cacard.point = #cacard.loop cacard.time run item replace entity @e[tag=cacard.blue$(current),limit=1] contents from block ~15 ~ ~9 container.0