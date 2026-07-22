execute as @e[tag=cacard.center,limit=1] at @s run tp @a[tag=cacard.show,limit=1,sort=nearest] ~7 ~4 ~ 90 37
execute as @a[tag=cacard.show] at @s run playsound minecraft:item.armor.equip_elytra master
execute as @e[tag=cacard.red5,limit=1] at @s run particle glow ~ ~2 ~ 0 1 0 0 5 normal @a[tag=cacard.show] 
execute as @e[tag=cacard.blue5,limit=1] at @s run particle glow ~ ~2 ~ 0 1 0 0 5 normal @a[tag=cacard.show] 
execute as @e[tag=cacard.red5,limit=1] at @s run particle end_rod ~ ~2 ~ 0 1 0 0 15 normal @a[tag=cacard.show] 
execute as @e[tag=cacard.blue5,limit=1] at @s run particle end_rod ~ ~2 ~ 0 1 0 0 15 normal @a[tag=cacard.show] 
title @a[tag=cacard.show] times 20 30 20
title @a[tag=cacard.show] title {text:""}
title @a[tag=cacard.show] subtitle {text:"§7- = §b§lCa§6§lcard§r§awar§7 = -"}
tellraw @a[tag=cacard.show] {text:"\n2. 这里是主要的游戏场地，点击位于双方中部的物品展示框，获得牌牌大作战·信息书，从而开始一场对局！有关对局的一切信息，请参见此书。\n"}
execute as @a[tag=cacard.show] run schedule function cacardwar:main/others/newplayer4 100t append