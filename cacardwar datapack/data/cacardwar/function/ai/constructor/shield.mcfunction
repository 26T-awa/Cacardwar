#记录双方护盾信息
#现在仅支持记录蓝方的信息，红方默认为无护盾
#构建
data modify storage cacardwar:ai pending_sample.shield set value [[0b,0b,0b],[0b,0b,0b]]
execute if entity @a[tag=cacard.inAImode,limit=1,scores={cacard.shieldtype=0}] run data modify storage cacardwar:ai pending_sample.shield[0] set value [0b,0b,0b]
execute if entity @a[tag=cacard.inAImode,limit=1,scores={cacard.shieldtype=1}] run data modify storage cacardwar:ai pending_sample.shield[0] set value [1b,0b,0b]
execute if entity @a[tag=cacard.inAImode,limit=1,scores={cacard.shieldtype=2}] run data modify storage cacardwar:ai pending_sample.shield[0] set value [0b,1b,0b]
execute if entity @a[tag=cacard.inAImode,limit=1,scores={cacard.shieldtype=3}] run data modify storage cacardwar:ai pending_sample.shield[0] set value [0b,0b,1b]
execute if entity @a[tag=cacard.inAImode,limit=1,scores={cacard.shieldtype=4}] run data modify storage cacardwar:ai pending_sample.shield[0] set value [1b,1b,0b]
execute if entity @a[tag=cacard.inAImode,limit=1,scores={cacard.shieldtype=5}] run data modify storage cacardwar:ai pending_sample.shield[0] set value [1b,0b,1b]
execute if entity @a[tag=cacard.inAImode,limit=1,scores={cacard.shieldtype=6}] run data modify storage cacardwar:ai pending_sample.shield[0] set value [0b,1b,1b]
execute if entity @a[tag=cacard.inAImode,limit=1,scores={cacard.shieldtype=7}] run data modify storage cacardwar:ai pending_sample.shield[0] set value [1b,1b,1b]
