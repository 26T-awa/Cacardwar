#R12清空有卡牌的卡槽
# reward = -0.3 * ( 1 - 清空/取出备用槽物品修正 )
tellraw @a[tag=cacard.inAImode,limit=1] {text:"§a§o调用Rule12"}

scoreboard players set #cacard.ai_reward_R12 cacard.point 0
scoreboard players set #cacard.ai_reward_base cacard.point -3000
scoreboard players set #cacard.ai_reward_power cacard.point 10000

#传入0/1 ==> 0/0.8(8000)
$scoreboard players set #cacard.ai_reward_arg1 cacard.point $(arg1)
execute if score #cacard.ai_reward_arg1 cacard.point matches 0 run scoreboard players set #cacard.ai_reward_arg1 cacard.point 0
execute if score #cacard.ai_reward_arg1 cacard.point matches 1 run scoreboard players set #cacard.ai_reward_arg1 cacard.point 8000

scoreboard players operation #cacard.ai_reward_power cacard.point -= #cacard.ai_reward_arg1 cacard.point

execute store result score #cacard.ai_reward_R12 cacard.point run scoreboard players operation #cacard.ai_reward_base cacard.point *= #cacard.ai_reward_power cacard.point
execute store result storage cacardwar:ai pending_sample.reward[12] double 0.00000001 run scoreboard players get #cacard.ai_reward_R12 cacard.point