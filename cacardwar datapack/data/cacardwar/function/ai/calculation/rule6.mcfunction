#R6合成镐
# reward = 0.04 × (1 + 钻石镐修正 + 偷取加成修正)
tellraw @a[tag=cacard.inAImode,limit=1] {text:"§a§o调用Rule6"}

scoreboard players set #cacard.ai_reward_R6 cacard.point 0
scoreboard players set #cacard.ai_reward_base cacard.point 400
scoreboard players set #cacard.ai_reward_power cacard.point 10000

#传入0/1 ==> 0/+1(10000)
$scoreboard players set #cacard.ai_reward_arg1 cacard.point $(arg1)
scoreboard players operation #cacard.ai_reward_arg1 cacard.point *= #10000 cacard.point

#传入0/1 ==> -10(-100000)/+0.02(200)
$scoreboard players set #cacard.ai_reward_arg2 cacard.point $(arg2)
execute if score #cacard.ai_reward_arg2 cacard.point matches 0 run scoreboard players set #cacard.ai_reward_arg2 cacard.point -100000
execute if score #cacard.ai_reward_arg2 cacard.point matches 1 run scoreboard players set #cacard.ai_reward_arg2 cacard.point 200

scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg1 cacard.point
scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg2 cacard.point

execute store result score #cacard.ai_reward_R6 cacard.point run scoreboard players operation #cacard.ai_reward_base cacard.point *= #cacard.ai_reward_power cacard.point
execute store result storage cacardwar:ai pending_sample.reward[6] double 0.00000001 run scoreboard players get #cacard.ai_reward_R6 cacard.point