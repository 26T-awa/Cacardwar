#function cacardwar:ai/game/loop/func3 with storage cacardwar:loop
$execute store result score #cacard.ai_action_mask cacard.players run data get storage cacardwar:ai action_mask[$(current)]
$execute if score #cacard.ai_action_mask cacard.players matches 0 run data modify storage cacardwar:ai matrix.o[$(current)] set value -999999999d

$execute unless score #cacard.ai_action_mask cacard.players matches 0 store result score #cacard.ai_action_mask cacard.point run data get storage cacardwar:ai matrix.o[$(current)] 10000
$execute if score #cacard.ai_action_mask cacard.time < #cacard.ai_action_mask cacard.point run data modify storage cacardwar:ai action.key set value $(current)
execute if score #cacard.ai_action_mask cacard.time < #cacard.ai_action_mask cacard.point store result storage cacardwar:ai action.value double 0.0001 run scoreboard players get #cacard.ai_action_mask cacard.point
execute if score #cacard.ai_action_mask cacard.time < #cacard.ai_action_mask cacard.point run scoreboard players operation #cacard.ai_action_mask cacard.time > #cacard.ai_action_mask cacard.point