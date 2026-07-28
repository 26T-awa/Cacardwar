tag @s add cacard.show7
execute at @e[tag=cacard.center,limit=1] run tp @s ~16 ~4 ~ 90 0
playsound minecraft:item.armor.equip_elytra master @s
playsound minecraft:entity.player.levelup master @s
tellraw @s {text:"\n6. 作者：_26T\n"}
title @s times 0 50 10
title @s title {text:"§a朋友，来一场豪赌吧！§r"}
title @s subtitle {text:"§a祝君好运 gl & hf§r"}
title @s actionbar {text:"§7§o赌博是不对的行为= ="}
effect give @s slow_falling 2 0 true
effect give @s speed 8 0 true
gamemode adventure @s
tag @s remove cacard.show7