#记录双方效果信息
#现在仅支持记录蓝方的信息，红方默认为无效果
#构建
data modify storage cacardwar:ai pending_sample.effect set value [[0.0,0.0,0.0],[0.0,0.0,0.0]]
execute if entity @a[tag=cacard.inAImode,limit=1,tag=cacard.hungry] run data modify storage cacardwar:ai pending_sample.effect[0][0] set value 1
execute if entity @a[tag=cacard.inAImode,limit=1,tag=cacard.godn_head_rege1] run data modify storage cacardwar:ai pending_sample.effect[0][1] set value 0.8333
execute if entity @a[tag=cacard.inAImode,limit=1,tag=cacard.godn_head_rege2] run data modify storage cacardwar:ai pending_sample.effect[0][1] set value 0.6
execute if entity @a[tag=cacard.inAImode,limit=1,tag=cacard.godn_head_rege3] run data modify storage cacardwar:ai pending_sample.effect[0][1] set value 0.3
execute if entity @a[tag=cacard.inAImode,limit=1,tag=cacard.bless_of_crow] run data modify storage cacardwar:ai pending_sample.effect[0][2] set value 1
