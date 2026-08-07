tag @s add cacard.show2
execute at @e[tag=cacard.center,limit=1] run tp @s ~23 ~14 ~ 90 47
playsound item.armor.equip_elytra master @s
title @s times 30 50 30
title @s title {text:"§7- - = §b§l牌§6§l牌§r§a大作战§7 = - -"}
title @s subtitle {text:"§a一个牌类小游戏数据包"}
tellraw @s [{text:"\n1. 简介：§l牌牌大作战§r是一个MC Java原版数据包。"},{text:"在牌牌大作战，你可以使用基于MC原版物品的§l卡牌§r"},{text:"§f，利用原版以及新颖的§l合成配方§r"},{text:"§f，§l进攻、防守、回复甚至召唤§r"},{text:"§f，与好友一起进行激情而愉快的决斗，§l取得成就、完成挑战§r"},{text:"§f。这是一个小游戏数据包。§r\n"}]
tag @s remove cacard.show2