execute as @e[tag=cacard.center,limit=1] at @s run tp @a[tag=cacard.show,limit=1,sort=nearest] ~-5.6 ~0.2 ~ 90 10
execute as @a[tag=cacard.show] at @s run playsound minecraft:item.armor.equip_elytra master

tellraw @a[tag=cacard.show] {text:"\n3. 有关对局过程中的信息与操作，请参见此处。\n"}
execute as @a[tag=cacard.show] run schedule function cacardwar:main/others/newplayer5 100t