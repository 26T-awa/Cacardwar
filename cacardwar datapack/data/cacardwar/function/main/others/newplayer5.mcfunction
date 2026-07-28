tag @s add cacard.show5
execute at @e[tag=cacard.center,limit=1] run tp @s ~-4.5 ~8 ~ -90 60
playsound minecraft:item.armor.equip_elytra master @s
tellraw @s {text:"\n4. 作为观众，你也可以在此处一同感受对局的激情。\n"}
tag @s remove cacard.show5