#R4合成金苹果
# reward = 0.3 × (1 + 血量溢出修正 + 饥饿抵消修正 + 恢复被禁用的槽位修正) 
tellraw @a[tag=cacard.inAImode,limit=1] {text:"§a§o调用Rule4"}

scoreboard players set #cacard.ai_reward_R4 cacard.point 0
scoreboard players set #cacard.ai_reward_base cacard.point 3000
scoreboard players set #cacard.ai_reward_power cacard.point 10000

#0/1 ==> -0.1(-1000)/+0.1(1000)
execute if score #cacard.ai_reward_arg1 cacard.point matches 0 run scoreboard players set #cacard.ai_reward_arg1 cacard.point -1000
execute if score #cacard.ai_reward_arg1 cacard.point matches 1 run scoreboard players set #cacard.ai_reward_arg1 cacard.point 1000

#0/1 ==> 0/+0.2(2000)
scoreboard players operation #cacard.ai_reward_arg2 cacard.point *= #20 cacard.point
scoreboard players operation #cacard.ai_reward_arg2 cacard.point *= #100 cacard.point

#N*0.05
scoreboard players operation #cacard.ai_reward_arg3 cacard.point *= #10000 cacard.point
scoreboard players operation #cacard.ai_reward_arg3 cacard.point /= #20 cacard.point

scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg1 cacard.point
scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg2 cacard.point
scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg3 cacard.point

execute store result score #cacard.ai_reward_R4 cacard.point run scoreboard players operation #cacard.ai_reward_base cacard.point *= #cacard.ai_reward_power cacard.point
execute store result storage cacardwar:ai pending_sample.reward[4] double 0.00000001 run scoreboard players get #cacard.ai_reward_R4 cacard.point