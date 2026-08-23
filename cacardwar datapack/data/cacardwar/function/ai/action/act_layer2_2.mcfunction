#放置-卡牌选择
clear @a[tag=cacard.inAImode,limit=1] *[custom_data~{cacardwar:["ai_act"]}]

item replace entity @a container.31 from entity @s weapon.offhand

