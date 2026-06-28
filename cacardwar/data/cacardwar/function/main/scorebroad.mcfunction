gamerule commandBlockOutput false

scoreboard objectives add cacard.health dummy
scoreboard players add #cacard.redHealth cacard.health 0
scoreboard players add #cacard.blueHealth cacard.health 0
scoreboard players set #cacard.i cacard.health 2
scoreboard players set #cacard.j cacard.health 0
scoreboard players set #cacard.k cacard.health 20
scoreboard objectives add cacard.time dummy
scoreboard players add #cacard.time cacard.time 0
scoreboard objectives add cacard.random dummy

bossbar add cacardwar:bluehealth [{text:"\u00a7b蓝方生命值:"},{score:{name:"#cacard.blueHealth",objective:cacard.health},color:light_purple}]
bossbar add cacardwar:redhealth [{text:"\u00a76红方生命值:"},{score:{name:"#cacard.redHealth",objective:cacard.health},color:light_purple}]
bossbar set cacardwar:bluehealth name [{text:"\u00a7b蓝方生命值:"},{score:{name:"#cacard.blueHealth",objective:cacard.health},color:light_purple}]
bossbar set cacardwar:redhealth name [{text:"\u00a76红方生命值:"},{score:{name:"#cacard.redHealth",objective:cacard.health},color:light_purple}]
bossbar set cacardwar:bluehealth max 20
bossbar set cacardwar:redhealth max 20
bossbar set cacardwar:bluehealth color blue
bossbar set cacardwar:redhealth color red
bossbar set cacardwar:bluehealth style notched_20
bossbar set cacardwar:redhealth style notched_20
execute at @e[tag=cacard.blue8] run tag @a[distance=..12,tag=!cacard.ingame] add cacard.ingame
execute at @e[tag=cacard.red8] run tag @a[distance=..12,tag=!cacard.ingame] add cacard.ingame
execute at @e[tag=cacard.blue8] run tag @a[distance=12..,tag=cacard.ingame] remove cacard.ingame
execute at @e[tag=cacard.red8] run tag @a[distance=12..,tag=cacard.ingame] remove cacard.ingame
bossbar set cacardwar:bluehealth players @a[tag=cacard.ingame]
bossbar set cacardwar:redhealth players @a[tag=cacard.ingame]
execute if score #cacard.blueHealth cacard.health > #cacard.k cacard.health run scoreboard players set #cacard.blueHealth cacard.health 20
execute if score #cacard.blueHealth cacard.health matches 20 run bossbar set cacardwar:bluehealth value 20
execute if score #cacard.blueHealth cacard.health matches 19 run bossbar set cacardwar:bluehealth value 19
execute if score #cacard.blueHealth cacard.health matches 18 run bossbar set cacardwar:bluehealth value 18
execute if score #cacard.blueHealth cacard.health matches 17 run bossbar set cacardwar:bluehealth value 17
execute if score #cacard.blueHealth cacard.health matches 16 run bossbar set cacardwar:bluehealth value 16
execute if score #cacard.blueHealth cacard.health matches 15 run bossbar set cacardwar:bluehealth value 15
execute if score #cacard.blueHealth cacard.health matches 14 run bossbar set cacardwar:bluehealth value 14
execute if score #cacard.blueHealth cacard.health matches 13 run bossbar set cacardwar:bluehealth value 13
execute if score #cacard.blueHealth cacard.health matches 12 run bossbar set cacardwar:bluehealth value 12
execute if score #cacard.blueHealth cacard.health matches 11 run bossbar set cacardwar:bluehealth value 11
execute if score #cacard.blueHealth cacard.health matches 10 run bossbar set cacardwar:bluehealth value 10
execute if score #cacard.blueHealth cacard.health matches 9 run bossbar set cacardwar:bluehealth value 9
execute if score #cacard.blueHealth cacard.health matches 8 run bossbar set cacardwar:bluehealth value 8
execute if score #cacard.blueHealth cacard.health matches 7 run bossbar set cacardwar:bluehealth value 7
execute if score #cacard.blueHealth cacard.health matches 6 run bossbar set cacardwar:bluehealth value 6
execute if score #cacard.blueHealth cacard.health matches 5 run bossbar set cacardwar:bluehealth value 5
execute if score #cacard.blueHealth cacard.health matches 4 run bossbar set cacardwar:bluehealth value 4
execute if score #cacard.blueHealth cacard.health matches 3 run bossbar set cacardwar:bluehealth value 3
execute if score #cacard.blueHealth cacard.health matches 2 run bossbar set cacardwar:bluehealth value 2
execute if score #cacard.blueHealth cacard.health matches 1 run bossbar set cacardwar:bluehealth value 1
execute if score #cacard.blueHealth cacard.health <= #cacard.j cacard.health run bossbar set cacardwar:bluehealth value 0

execute if score #cacard.redHealth cacard.health > #cacard.k cacard.health run scoreboard players set #cacard.redHealth cacard.health 20
execute if score #cacard.redHealth cacard.health matches 20 run bossbar set cacardwar:redhealth value 20
execute if score #cacard.redHealth cacard.health matches 19 run bossbar set cacardwar:redhealth value 19
execute if score #cacard.redHealth cacard.health matches 18 run bossbar set cacardwar:redhealth value 18
execute if score #cacard.redHealth cacard.health matches 17 run bossbar set cacardwar:redhealth value 17
execute if score #cacard.redHealth cacard.health matches 16 run bossbar set cacardwar:redhealth value 16
execute if score #cacard.redHealth cacard.health matches 15 run bossbar set cacardwar:redhealth value 15
execute if score #cacard.redHealth cacard.health matches 14 run bossbar set cacardwar:redhealth value 14
execute if score #cacard.redHealth cacard.health matches 13 run bossbar set cacardwar:redhealth value 13
execute if score #cacard.redHealth cacard.health matches 12 run bossbar set cacardwar:redhealth value 12
execute if score #cacard.redHealth cacard.health matches 11 run bossbar set cacardwar:redhealth value 11
execute if score #cacard.redHealth cacard.health matches 10 run bossbar set cacardwar:redhealth value 10
execute if score #cacard.redHealth cacard.health matches 9 run bossbar set cacardwar:redhealth value 9
execute if score #cacard.redHealth cacard.health matches 8 run bossbar set cacardwar:redhealth value 8
execute if score #cacard.redHealth cacard.health matches 7 run bossbar set cacardwar:redhealth value 7
execute if score #cacard.redHealth cacard.health matches 6 run bossbar set cacardwar:redhealth value 6
execute if score #cacard.redHealth cacard.health matches 5 run bossbar set cacardwar:redhealth value 5
execute if score #cacard.redHealth cacard.health matches 4 run bossbar set cacardwar:redhealth value 4
execute if score #cacard.redHealth cacard.health matches 3 run bossbar set cacardwar:redhealth value 3
execute if score #cacard.redHealth cacard.health matches 2 run bossbar set cacardwar:redhealth value 2
execute if score #cacard.redHealth cacard.health matches 1 run bossbar set cacardwar:redhealth value 1
execute if score #cacard.redHealth cacard.health <= #cacard.j cacard.health run bossbar set cacardwar:bluehealth value 0