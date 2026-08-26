#R1有效合成/使用
# reward = 0.3 × (1 + 消耗卡牌数 × 0.01 - 无关槽位卡牌数 × 0.02) 
scoreboard players set #cacard.ai_reward_R1 cacard.point 0
scoreboard players set #cacard.ai_reward_base cacard.point 3000
scoreboard players set #cacard.ai_reward_power cacard.point 10000

$scoreboard players set #cacard.ai_reward_arg1 cacard.point $(arg1)
scoreboard players operation #cacard.ai_reward_arg1 cacard.point *= #100 cacard.point

scoreboard players operation #cacard.ai_reward_arg2 cacard.point *= #10000 cacard.point
scoreboard players operation #cacard.ai_reward_arg2 cacard.point /= #50 cacard.point

scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg1 cacard.point
scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg2 cacard.point

execute store result score #cacard.ai_reward_R1 cacard.point run scoreboard players operation #cacard.ai_reward_base cacard.point *= #cacard.ai_reward_power cacard.point
execute store result storage cacardwar:ai pending_sample.reward[1] double 0.00000001 run scoreboard players get #cacard.ai_reward_R1 cacard.point