tag @s add cacard.show6
execute as @e[tag=cacard.center,limit=1] at @s run tp @a[tag=cacard.show6,limit=1,sort=nearest] ~18 ~4 ~-3 145 20
playsound minecraft:item.armor.equip_elytra master @s
tellraw @s {text:"\n5. 从不错过任何一次更新讯息！\n"}
tag @s remove cacard.show6