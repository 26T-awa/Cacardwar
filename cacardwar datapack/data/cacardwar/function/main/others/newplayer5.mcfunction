execute as @e[tag=cacard.center,limit=1] at @s run tp @a[tag=cacard.show,limit=1,sort=nearest] ~-4.5 ~8 ~ -90 60
execute as @a[tag=cacard.show] at @s run playsound minecraft:item.armor.equip_elytra master

tellraw @a[tag=cacard.show] {text:"\n4. 作为观众，你也可以在此处一同感受对局的激情。\n"}
execute as @a[tag=cacard.show] run schedule function cacardwar:main/others/newplayer6 100t append