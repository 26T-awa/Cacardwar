execute unless score #cacard.time cacard.isongoing matches 0 run tellraw @s {text:"    抱歉，现在的场地正在使用中，请稍后再试。"}

execute if score #cacard.time cacard.isongoing matches 0 run scoreboard players set #cacard.time cacard.isongoing 3
scoreboard players set #cacard.blueHealth cacard.health 20
scoreboard players set #cacard.redHealth cacard.health 20
bossbar set cacardwar:bluehealth value 20
bossbar set cacardwar:redhealth value 20
execute if score #cacard.time cacard.isongoing matches 3 run tag @s add cacard.bt1
execute if score #cacard.time cacard.isongoing matches 3 run tag @s add cacard.bt
