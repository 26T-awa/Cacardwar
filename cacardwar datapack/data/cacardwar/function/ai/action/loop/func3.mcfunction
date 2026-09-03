#function cacardwar:ai/action/loop/func3 with storage cacardwar:loop
#手动情况
$execute unless entity @a[tag=cacard.inAImode.auto] if items entity @s weapon.offhand *[custom_data~{cacardwar:["card$(current)"]}] run scoreboard players operation #cacard.ai_place_cardID cacard.point = #cacard.loop cacard.time
$execute unless entity @a[tag=cacard.inAImode.auto] if score #cacard.ai_place_cardID cacard.point matches 1..17 if score #cacard.ai_place_cardID cacard.point = #cacard.loop cacard.time run clear @a[tag=cacard.inAImode,limit=1] *[custom_data~{cacardwar:["card$(current)"]}] 1
#自动情况
$execute if entity @a[tag=cacard.inAImode.auto] if score #cacard.ai_action_mask cacard.down matches 11..180 if score #cacard.ai_place_cardID cacard.point = #cacard.loop cacard.time at @e[tag=cacard.center] run item replace block ~15 ~ ~9 container.0 from block ~15 ~ ~9 container.$(current)
$execute if entity @a[tag=cacard.inAImode.auto] if score #cacard.ai_action_mask cacard.down matches 11..180 if score #cacard.ai_place_cardID cacard.point = #cacard.loop cacard.time run clear @a[tag=cacard.inAImode,limit=1] *[custom_data~{cacardwar:["card$(current)"]}] 1