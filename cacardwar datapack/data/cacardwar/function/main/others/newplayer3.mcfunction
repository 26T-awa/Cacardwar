tag @s add cacard.show3
execute as @e[tag=cacard.center,limit=1] at @s run tp @a[tag=cacard.show3,limit=1,sort=nearest] ~7 ~4 ~ 90 37
playsound minecraft:item.armor.equip_elytra master @s
execute as @e[tag=cacard.red5,limit=1] at @s run particle glow ~ ~2 ~ 0 1 0 0 5 normal @a[tag=cacard.show3] 
execute as @e[tag=cacard.blue5,limit=1] at @s run particle glow ~ ~2 ~ 0 1 0 0 5 normal @a[tag=cacard.show3] 
execute as @e[tag=cacard.red5,limit=1] at @s run particle end_rod ~ ~2 ~ 0 1 0 0 15 normal @a[tag=cacard.show3] 
execute as @e[tag=cacard.blue5,limit=1] at @s run particle end_rod ~ ~2 ~ 0 1 0 0 15 normal @a[tag=cacard.show3] 
title @s times 20 30 20
title @s title {text:""}
title @s subtitle {text:"§7- = §b§lCa§6§lcard§r§awar§7 = -"}
tellraw @s [{text:"\n2. 这里是主要的游戏场地，点击位于双方中部的物品展示框，获得牌牌大作战·信息书"},{text:"，从而开始一场对局！有关对局的一切信息，请参见此书。\n"}]
tag @s remove cacard.show3