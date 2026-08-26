#R3召唤召唤物
# reward = 0.2 × (1 + 僵尸加成 + 商人加成 + 超级僵尸加成 + 稻草人加成 + 溢出补偿修正)
scoreboard players set #cacard.ai_reward_R3 cacard.point 0
scoreboard players set #cacard.ai_reward_base cacard.point 2000
scoreboard players set #cacard.ai_reward_power cacard.point 10000

#传入0/1 ==> 0/+0.05(500)
$scoreboard players set #cacard.ai_reward_arg1 cacard.point $(arg1)
scoreboard players operation #cacard.ai_reward_arg1 cacard.point *= #50 cacard.point
scoreboard players operation #cacard.ai_reward_arg1 cacard.point *= #10 cacard.point

#传入0/1 ==> 0/+0.02(200)
$scoreboard players set #cacard.ai_reward_arg2 cacard.point $(arg2)
scoreboard players operation #cacard.ai_reward_arg2 cacard.point *= #20 cacard.point
scoreboard players operation #cacard.ai_reward_arg2 cacard.point *= #10 cacard.point

#传入0/1 ==> 0/+0.20(2000)
$scoreboard players set #cacard.ai_reward_arg3 cacard.point $(arg3)
scoreboard players operation #cacard.ai_reward_arg3 cacard.point *= #20 cacard.point
scoreboard players operation #cacard.ai_reward_arg3 cacard.point *= #100 cacard.point

#传入0/1 ==> 0/+0.01(100)
$scoreboard players set #cacard.ai_reward_arg4 cacard.point $(arg4)
scoreboard players operation #cacard.ai_reward_arg4 cacard.point *= #100 cacard.point

#传入0/1/100 ==> 0/-0.1(1000)/-10(100000)
$scoreboard players set #cacard.ai_reward_arg5 cacard.point $(arg5)
scoreboard players operation #cacard.ai_reward_arg5 cacard.point *= #-1 cacard.point
scoreboard players operation #cacard.ai_reward_arg5 cacard.point *= #100 cacard.point
scoreboard players operation #cacard.ai_reward_arg5 cacard.point *= #10 cacard.point

scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg1 cacard.point
scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg2 cacard.point
scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg3 cacard.point
scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg4 cacard.point
scoreboard players operation #cacard.ai_reward_power cacard.point += #cacard.ai_reward_arg5 cacard.point

execute store result score #cacard.ai_reward_R3 cacard.point run scoreboard players operation #cacard.ai_reward_base cacard.point *= #cacard.ai_reward_power cacard.point
execute store result storage cacardwar:ai pending_sample.reward[3] double 0.00000001 run scoreboard players get #cacard.ai_reward_R3 cacard.point