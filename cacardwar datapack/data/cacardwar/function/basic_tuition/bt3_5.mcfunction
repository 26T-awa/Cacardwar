function cacardwar:main/clear_item
tellraw @s {text:"\n§aWELL DONE §73/4§n"}
playsound block.note_block.harp master @s ~ ~ ~ 0.8 2 0.8
tag @s remove cacard.bt3
scoreboard players set @s cacard.basicTuition 0
tag @s add cacard.bt4