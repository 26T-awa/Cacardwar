#跳过-记录数据
scoreboard players display name cacard.info8 cacard.Info {text:"§7Now's been selected [skip]."}

function cacardwar:ai/action/anti_squiz_item
clear @s *[custom_data~{cacardwar:["ai_act"]}]

#构建行动码、奖励，这里是跳过的特殊情况
data modify storage cacardwar:ai pending_sample.action set value 0s
data modify storage cacardwar:ai pending_sample.done set value 1b
#检测稻草人下一回合是否自然消失，触发Rule8
execute if entity @e[scores={cacard.summonleft=1},tag=cacard.summoner,tag=cacard.blueScarecrow] run function cacardwar:ai/calculation/rule8
#清除卡牌，触发规则Rule11
execute store result score #cacard.ai_reward_arg1 cacard.point run clear @a[tag=cacard.inAImode,limit=1] *[custom_data~{cacardwar:["card"]}]
function cacardwar:ai/calculation/rule11
#构建行动后特征向量
schedule function cacardwar:ai/constructor/cst_after 10t
#执行跳过，延时
function cacardwar:ai/action/skip_
