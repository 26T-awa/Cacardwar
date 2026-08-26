#R12清空有卡牌的卡槽
# reward = -0.3 
scoreboard players set #cacard.ai_reward_R12 cacard.point 0
scoreboard players set #cacard.ai_reward_base cacard.point -3000
scoreboard players set #cacard.ai_reward_power cacard.point 10000

execute store result score #cacard.ai_reward_R12 cacard.point run scoreboard players operation #cacard.ai_reward_base cacard.point *= #cacard.ai_reward_power cacard.point
execute store result storage cacardwar:ai pending_sample.reward[12] double 0.00000001 run scoreboard players get #cacard.ai_reward_R12 cacard.point