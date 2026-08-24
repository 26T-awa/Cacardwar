#记录双方卡组信息
#现在仅支持记录蓝方的卡组，红方卡组默认为均衡型，2
#构建
data modify storage cacardwar:ai pending_sample.cardset set value [0,2]
execute store result storage cacardwar:ai pending_sample.cardset[0] short 1 run scoreboard players get @a[tag=cacard.inAImode,limit=1] cacard.cardsetype
