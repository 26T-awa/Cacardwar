#R7获得饥饿效果
# reward = -0.2 × (1 - 获得途径修正)
scoreboard players set #cacard.ai_reward_R7 cacard.point 0
scoreboard players set #cacard.ai_reward_base cacard.point -2000
scoreboard players set #cacard.ai_reward_power cacard.point 10000

#传入0/1 ==> 0/1(10000)
$scoreboard players set #cacard.ai_reward_arg1 cacard.point $(arg1)
scoreboard players operation #cacard.ai_reward_arg1 cacard.point *= #10000 cacard.point

scoreboard players operation #cacard.ai_reward_power cacard.point -= #cacard.ai_reward_arg1 cacard.point

execute store result score #cacard.ai_reward_R7 cacard.point run scoreboard players operation #cacard.ai_reward_base cacard.point *= #cacard.ai_reward_power cacard.point
execute store result storage cacardwar:ai pending_sample.reward[7] double 0.00000001 run scoreboard players get #cacard.ai_reward_R7 cacard.point