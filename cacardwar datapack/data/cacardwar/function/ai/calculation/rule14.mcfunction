#R14本回合失败
# reward = -1.0 × (1 + 对手生命值4修正 + 对手生命值10修正 + 对手生命值20修正)  
tellraw @a[tag=cacard.inAImode,limit=1] {text:"§a§o调用Rule14"}

scoreboard players set #cacard.ai_reward_R14 cacard.point 0
scoreboard players set #cacard.ai_reward_base cacard.point -10000
scoreboard players set #cacard.ai_reward_power cacard.point 10000

#传入0/1 ==> 0/-0.12(-1200)
$scoreboard players set #cacard.ai_reward_arg1 cacard.point $(arg1)
execute if score #cacard.ai_reward_arg1 cacard.point matches 0 run scoreboard players set #cacard.ai_reward_arg1 cacard.point 0
execute if score #cacard.ai_reward_arg1 cacard.point matches 1 run scoreboard players set #cacard.ai_reward_arg1 cacard.point -1200

#传入0/1 ==> 0/-0.08(-800)
$scoreboard players set #cacard.ai_reward_arg2 cacard.point $(arg2)
execute if score #cacard.ai_reward_arg2 cacard.point matches 0 run scoreboard players set #cacard.ai_reward_arg2 cacard.point 0
execute if score #cacard.ai_reward_arg2 cacard.point matches 1 run scoreboard players set #cacard.ai_reward_arg2 cacard.point -800

#传入0/1 ==> 0/+0.50(5000)
$scoreboard players set #cacard.ai_reward_arg3 cacard.point $(arg3)
execute if score #cacard.ai_reward_arg3 cacard.point matches 0 run scoreboard players set #cacard.ai_reward_arg3 cacard.point 0
execute if score #cacard.ai_reward_arg3 cacard.point matches 1 run scoreboard players set #cacard.ai_reward_arg3 cacard.point 5000

scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg1 cacard.point
scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg2 cacard.point
scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg3 cacard.point

execute store result score #cacard.ai_reward_R14 cacard.point run scoreboard players operation #cacard.ai_reward_base cacard.point *= #cacard.ai_reward_power cacard.point
execute store result storage cacardwar:ai pending_sample.reward[14] double 0.00000001 run scoreboard players get #cacard.ai_reward_R14 cacard.point