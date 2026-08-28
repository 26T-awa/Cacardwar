#R2合成护盾
# reward = 0.08 × (1 + 原护盾重复修正)
tellraw @a[tag=cacard.inAImode,limit=1] {text:"§a§o调用Rule2"}

scoreboard players set #cacard.ai_reward_R2 cacard.point 0
scoreboard players set #cacard.ai_reward_base cacard.point 800
scoreboard players set #cacard.ai_reward_power cacard.point 10000

#传入0/1 ==> 0/-10
$scoreboard players set #cacard.ai_reward_arg1 cacard.point $(arg1)
scoreboard players operation #cacard.ai_reward_arg1 cacard.point *= #10000 cacard.point
scoreboard players operation #cacard.ai_reward_arg1 cacard.point *= #10 cacard.point
scoreboard players operation #cacard.ai_reward_arg1 cacard.point *= #-1 cacard.point

scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg1 cacard.point

execute store result score #cacard.ai_reward_R2 cacard.point run scoreboard players operation #cacard.ai_reward_base cacard.point *= #cacard.ai_reward_power cacard.point
execute store result storage cacardwar:ai pending_sample.reward[2] double 0.00000001 run scoreboard players get #cacard.ai_reward_R2 cacard.point