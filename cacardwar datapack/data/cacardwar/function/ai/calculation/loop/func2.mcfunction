#function cacardwar:ai/calculation/loop/func2 with storage cacardwar:loop
$scoreboard players operation #cacard.ai_reward cacard.point += #cacard.ai_reward_R$(current) cacard.point
execute if score #cacard.loop cacard.time matches 14 store result storage cacardwar:ai pending_sample.reward[0] double 0.00000001 run scoreboard players get #cacard.ai_reward cacard.point