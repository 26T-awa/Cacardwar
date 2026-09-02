#function cacardwar:ai/game/loop/func1 with storage cacardwar:loop
$execute store result score #cacard.ai_action_mask cacard.players run data get storage cacardwar:ai pending_sample.before[7][0][$(current)]
$execute if score #cacard.ai_action_mask cacard.players matches 1 store result score #cacard.ai_action_mask cacard.point run data get storage cacardwar:ai pending_sample.before[6][0][$(current)]
execute if score #cacard.ai_action_mask cacard.players matches 1 unless score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_mask append value 1b
execute if score #cacard.ai_action_mask cacard.players matches 1 if score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_mask append value 0b
execute if score #cacard.ai_action_mask cacard.players matches 0 run data modify storage cacardwar:ai action_mask append value 0b