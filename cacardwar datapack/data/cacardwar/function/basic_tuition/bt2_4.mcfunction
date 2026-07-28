function cacardwar:main/clear_item
tellraw @s {text:"\n§aWELL DONE §72/4§n"}
playsound entity.player.levelup master @s ~ ~ ~ 0.8 2 0.8
tag @s remove cacard.bt2
scoreboard players set @s cacard.basicTuition 0
tag @s add cacard.bt3