tag @s add cacard.show6
execute at @e[tag=cacard.center,limit=1] run tp @s ~18 ~4 ~-3 145 20
playsound item.armor.equip_elytra master @s
execute as @e[tag=cacardwar,type=minecraft:mannequin] run swing
tellraw @s {text:"\n5. 从不错过任何一次更新讯息！\n"}
tag @s remove cacard.show6