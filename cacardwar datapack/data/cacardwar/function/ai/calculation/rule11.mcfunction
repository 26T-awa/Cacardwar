#R11回合结束，剩余卡牌
# reward = -0.05 × (1 + 剩余卡牌数规则) 
tellraw @a[tag=cacard.inAImode,limit=1] {text:"§a§o调用Rule11"}

scoreboard players set #cacard.ai_reward_R11 cacard.point 0
scoreboard players set #cacard.ai_reward_base cacard.point -500
scoreboard players set #cacard.ai_reward_power cacard.point 10000

#*0.5
execute if score #cacard.ai_reward_arg1 cacard.point matches 1..3 run scoreboard players operation #cacard.ai_reward_arg1 cacard.point *= #10000 cacard.point
execute if score #cacard.ai_reward_arg1 cacard.point matches 4..2368 run scoreboard players operation #cacard.ai_reward_arg1 cacard.point *= #8000 cacard.point

scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg1 cacard.point

execute store result score #cacard.ai_reward_R11 cacard.point run scoreboard players operation #cacard.ai_reward_base cacard.point *= #cacard.ai_reward_power cacard.point
execute store result storage cacardwar:ai pending_sample.reward[11] double 0.00000001 run scoreboard players get #cacard.ai_reward_R11 cacard.point