tag @s add cacard.show7
execute at @e[tag=cacard.center,limit=1] run tp @s ~16 ~4 ~ 90 0
playsound item.armor.equip_elytra master @s
playsound minecraft:entity.player.levelup master @s
tellraw @s {translate:"\n6. 作者：%s_26T\n",with:[{hat:true,player:"_26T"}]}
title @s times 0 50 10
title @s title {text:"§a朋友，来一场豪赌吧！§r"}
title @s subtitle {text:"§a欢迎来到§b§l牌§6§l牌§r§a大作战，祝君好运 gl & hf§r"}
title @s actionbar {text:"§7§o赌博是不对的行为= ="}
effect give @s slow_falling 2 0 true
effect give @s speed 8 0 true
gamemode adventure @s
tag @s remove cacard.show7