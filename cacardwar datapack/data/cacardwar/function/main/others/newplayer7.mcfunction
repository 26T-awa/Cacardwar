execute as @e[tag=cacard.center,limit=1] at @s run tp @a[tag=cacard.show,limit=1,sort=nearest] ~16 ~4 ~ 90 0
execute as @a[tag=cacard.show] at @s run playsound minecraft:item.armor.equip_elytra master
execute as @a[tag=cacard.show] at @s run playsound minecraft:entity.player.levelup master
tellraw @a[tag=cacard.show] {text:"\n6. 作者：_26T\n"}
title @a[tag=cacard.show] times 0 50 10
title @a[tag=cacard.show] title {text:"§a朋友，来一场豪赌吧！§r"}
title @a[tag=cacard.show] subtitle {text:"§a祝君好运 gl & hf§r"}
title @a[tag=cacard.show] actionbar {text:"§7§o赌博是不对的行为= ="}
effect give @a[tag=cacard.show] slow_falling 2 0 true
effect give @a[tag=cacard.show] speed 5 0 true
gamemode adventure @a[tag=cacard.show]
execute as @a[tag=cacard.show] run schedule function cacardwar:main/others/newplayer8 60t append