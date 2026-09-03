#function cacardwar:ai/action/loop/func5 with storage cacardwar:loop
#手动情况
$execute unless entity @a[tag=cacard.inAImode.auto] if items entity @s weapon.offhand *[custom_data~{cacardwar:["slot$(current)"]}] run scoreboard players operation #cacard.ai_clean_slotID cacard.point = #cacard.loop cacard.time
$execute unless entity @a[tag=cacard.inAImode.auto] if score #cacard.ai_clean_slotID cacard.point = #cacard.loop cacard.time if score #cacard.ai_clean_slotID cacard.point matches 0 run item replace entity @a[tag=cacard.inAImode,limit=1] container.23 from entity @e[tag=cacard.blue$(current),limit=1] contents
$execute unless entity @a[tag=cacard.inAImode.auto] if score #cacard.ai_clean_slotID cacard.point = #cacard.loop cacard.time run data remove entity @e[tag=cacard.blue$(current),limit=1] Item
#自动情况
$execute if entity @a[tag=cacard.inAImode.auto] if score #cacard.ai_action_mask cacard.down matches 1..10 if score #cacard.ai_clean_slotID cacard.point = #cacard.loop cacard.time run data remove entity @e[tag=cacard.blue$(current),limit=1] Item