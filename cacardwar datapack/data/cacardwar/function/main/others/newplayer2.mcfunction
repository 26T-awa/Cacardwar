execute as @e[tag=cacard.center,limit=1] at @s run tp @a[tag=cacard.show,limit=1,sort=nearest] ~23 ~14 ~ 90 47
execute as @a[tag=cacard.show] at @s run playsound minecraft:item.armor.equip_elytra master

title @a[tag=cacard.show] times 30 50 30
title @a[tag=cacard.show] title {text:"§7- - = §b§l牌§6§l牌§r§a大作战§7 = - -"}
title @a[tag=cacard.show] subtitle {text:"§a一个牌类小游戏数据包"}
tellraw @a[tag=cacard.show] {text:"\n1. 简介：§l牌牌大作战§r是一个MC Java原版数据包。在牌牌大作战，你可以使用 MC 基于原版物品的§l卡牌§r，利用原版以及新颖的§l合成配方§r，§l进攻、防守、回复甚至召唤§r，与好友一起进行激情而愉快的决斗，§l取得成就、完成挑战§r。这是一个小游戏数据包。\n"}
execute as @a[tag=cacard.show] run schedule function cacardwar:main/others/newplayer3 120t append
