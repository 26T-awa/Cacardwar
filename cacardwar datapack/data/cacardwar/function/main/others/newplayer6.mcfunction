execute as @e[tag=cacard.center,limit=1] at @s run tp @a[tag=cacard.show,limit=1,sort=nearest] ~18 ~4 ~-3 145 20
execute as @a[tag=cacard.show] at @s run playsound minecraft:item.armor.equip_elytra master

tellraw @a[tag=cacard.show] {text:"\n5. 从不错过任何一次更新讯息！\n"}
execute as @a[tag=cacard.show] run schedule function cacardwar:main/others/newplayer7 100t append