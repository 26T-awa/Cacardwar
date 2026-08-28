#R9造成攻击
# reward = 0.1 × (1 + 伤害 × 0.5 + 斩杀线10修正 + 斩杀线5修正) 
tellraw @a[tag=cacard.inAImode,limit=1] {text:"§a§o调用Rule9"}

scoreboard players set #cacard.ai_reward_R9 cacard.point 0
scoreboard players set #cacard.ai_reward_base cacard.point 1000
scoreboard players set #cacard.ai_reward_power cacard.point 10000

#N*0.5
$scoreboard players set #cacard.ai_reward_arg1 cacard.point $(arg1)
scoreboard players operation #cacard.ai_reward_arg1 cacard.point *= #50 cacard.point
scoreboard players operation #cacard.ai_reward_arg1 cacard.point *= #100 cacard.point

#传入0/1 ==> 0/+0.2(2000)
$scoreboard players set #cacard.ai_reward_arg2 cacard.point $(arg2)
execute if score #cacard.ai_reward_arg2 cacard.point matches 0 run scoreboard players set #cacard.ai_reward_arg2 cacard.point 0
execute if score #cacard.ai_reward_arg2 cacard.point matches 1 run scoreboard players set #cacard.ai_reward_arg2 cacard.point 2000

#传入0/1 ==> 0/+0.3(3000)
$scoreboard players set #cacard.ai_reward_arg3 cacard.point $(arg3)
execute if score #cacard.ai_reward_arg3 cacard.point matches 0 run scoreboard players set #cacard.ai_reward_arg3 cacard.point 0
execute if score #cacard.ai_reward_arg3 cacard.point matches 1 run scoreboard players set #cacard.ai_reward_arg3 cacard.point 3000

scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg1 cacard.point
scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg2 cacard.point
scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg3 cacard.point

execute store result score #cacard.ai_reward_R9 cacard.point run scoreboard players operation #cacard.ai_reward_base cacard.point *= #cacard.ai_reward_power cacard.point
execute store result storage cacardwar:ai pending_sample.reward[9] double 0.00000001 run scoreboard players get #cacard.ai_reward_R9 cacard.point