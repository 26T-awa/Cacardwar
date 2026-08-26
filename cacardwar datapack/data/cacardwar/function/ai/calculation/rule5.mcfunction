#R5合成金头颅
# reward = 0.05 
scoreboard players set #cacard.ai_reward_R5 cacard.point 0
scoreboard players set #cacard.ai_reward_base cacard.point 500
scoreboard players set #cacard.ai_reward_power cacard.point 10000

execute store result score #cacard.ai_reward_R5 cacard.point run scoreboard players operation #cacard.ai_reward_base cacard.point *= #cacard.ai_reward_power cacard.point
execute store result storage cacardwar:ai pending_sample.reward[5] double 0.00000001 run scoreboard players get #cacard.ai_reward_R5 cacard.point