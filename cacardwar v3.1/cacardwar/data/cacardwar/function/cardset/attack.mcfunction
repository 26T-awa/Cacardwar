tag @s remove cacard.average
tag @s remove cacard.resist
tag @s add cacard.attack
playsound minecraft:block.note_block.harp master @s ~ ~ ~ 2 0.3 1
tellraw @s {text:"\u00a7e你选择了\u00a7c进攻型卡组\u00a7e！"}

summon parrot ~ ~ ~ {CustomName:{text:"\u00a7av3.1"},NoAI:true,Silent:true,Invulnerable:true,Rotation:[-135.0f,0.0f]}