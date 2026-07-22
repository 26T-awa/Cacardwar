#僵尸
$execute as @e[tag=cacard.$(team)Zombie] at @s run particle block{block_state:redstone_block} ^ ^1.8 ^0.8 0.2 0.2 0.2 0 16 normal @a[tag=cacard.ingame]
$execute as @e[tag=cacard.$(team)Zombie] at @s run playsound entity.zombie.break_wooden_door master @a[tag=cacard.ingame] ~ ~ ~ 1.2 1 1
$execute as @e[tag=cacard.$(team)Zombie] at @s run playsound entity.zombie.ambient master @a[tag=cacard.ingame] ~ ~ ~ 1 1.3 1
$execute as @e[tag=cacard.$(team)Zombie] unless entity @e[tag=cacard.$(oppteam)Scarecrow] run scoreboard players remove #cacard.$(oppteam)Health cacard.health 4
$execute as @e[tag=cacard.$(team)Zombie] if entity @e[tag=cacard.$(oppteam)Scarecrow] run playsound minecraft:block.grass.break master @a[tag=cacard.ingame] ~ ~ ~ 0.9 0.7 0.8
$execute as @e[tag=cacard.$(team)Zombie] if entity @e[tag=cacard.$(oppteam)Scarecrow] run kill @e[tag=cacard.$(oppteam)Scarecrow,limit=1]

#商人
$execute as @e[tag=cacard.$(team)Trader] at @s run particle happy_villager ^ ^1.8 ^0.8 0.2 0.2 0.2 0 16 normal @a[tag=cacard.ingame]
$execute as @e[tag=cacard.$(team)Trader] at @s run playsound entity.wandering_trader.trade master @a[tag=cacard.ingame] ~ ~ ~ 1 0.8 1
$execute as @e[tag=cacard.$(team)Trader] run scoreboard players add @a[tag=cacard.$(team)Team] cacard.cardcount 4

#超级僵尸
$execute as @e[tag=cacard.$(team)SuperZombie] at @s run particle block{block_state:redstone_block} ^ ^1.8 ^0.8 0.2 0.2 0.2 0 16 normal @a[tag=cacard.ingame]
$execute as @e[tag=cacard.$(team)SuperZombie] at @s run particle flame ^ ^1.8 ^0.8 0.2 0.2 0.2 0 8 normal @a[tag=cacard.ingame]
$execute as @e[tag=cacard.$(team)SuperZombie] at @s run playsound entity.zombie.break_wooden_door master @a[tag=cacard.ingame] ~ ~ ~ 1.2 1 1
$execute as @e[tag=cacard.$(team)SuperZombie] at @s run playsound entity.entity.donkey.death master @a[tag=cacard.ingame] ~ ~ ~ 0.2 0.3
$execute as @e[tag=cacard.$(team)SuperZombie] at @s run playsound entity.zombie.ambient master @a[tag=cacard.ingame] ~ ~ ~ 1 1.3 1
$execute as @e[tag=cacard.$(team)SuperZombie] unless entity @e[tag=cacard.$(oppteam)Scarecrow] run scoreboard players remove #cacard.$(oppteam)Health cacard.health 5
$execute as @e[tag=cacard.$(team)SuperZombie] if entity @e[tag=cacard.$(oppteam)Scarecrow] run playsound minecraft:block.grass.break master @a[tag=cacard.ingame] ~ ~ ~ 0.9 0.7 0.8
$execute as @e[tag=cacard.$(team)SuperZombie] if entity @e[tag=cacard.$(oppteam)Scarecrow] run kill @e[tag=cacard.$(oppteam)Scarecrow,limit=1,sort=nearest]