#记录双方生命值信息
#构建
data modify storage cacardwar:ai pending_sample.health set value [0.0,0.0]
execute store result storage cacardwar:ai pending_sample.health[0] double 0.05 run scoreboard players get #cacard.blueHealth cacard.health
execute store result storage cacardwar:ai pending_sample.health[1] double 0.05 run scoreboard players get #cacard.redHealth cacard.health
