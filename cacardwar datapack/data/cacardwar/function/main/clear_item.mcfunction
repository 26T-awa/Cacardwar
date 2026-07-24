execute store result score @s cacard.leftcardcount run clear @s *[custom_data~{cacardwar:["card"]}]
execute if score @s cacard.leftcardcount matches 3.. run scoreboard players set @s cacard.leftcardcount 3
execute if score @s cacard.point matches 0..3 run scoreboard players set @s cacard.leftcardcount 0
execute at @e[tag=cacard.center,limit=1] run kill @e[type=item,distance=..64,nbt={Item:{components:{"minecraft:custom_data":{cacardwar:["card"]}}}}]