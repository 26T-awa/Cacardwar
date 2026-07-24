tag @s add cacard.show4
execute as @e[tag=cacard.center,limit=1] at @s run tp @a[tag=cacard.show4,limit=1,sort=nearest] ~-5.6 ~0.2 ~ 90 10
playsound minecraft:item.armor.equip_elytra master @s
tellraw @s {text:"\n3. 有关对局过程中的信息与操作，请参见此处。\n"}
tag @s remove cacard.show4