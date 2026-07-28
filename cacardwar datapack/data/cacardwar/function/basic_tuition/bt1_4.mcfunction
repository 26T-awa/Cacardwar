tellraw @s {text:"\n§aWELL DONE §71/4§r\n"}
playsound entity.player.levelup master @s ~ ~ ~ 0.8 2 0.8
tag @s remove cacard.bt1
scoreboard players set @s cacard.basicTuition 0
tag @s add cacard.bt2