gamerule commandBlockOutput false

scoreboard objectives add cacard.health dummy
scoreboard players add #cacard.redHealth cacard.health 0
scoreboard players add #cacard.blueHealth cacard.health 0
scoreboard players set #cacard.i cacard.health 2
scoreboard players set #cacard.i cacard.time 24000
scoreboard players set #cacard.j cacard.health 0
scoreboard players set #cacard.k cacard.health 20
scoreboard objectives add cacard.time dummy
scoreboard players add #cacard.time cacard.time 0
scoreboard objectives add cacard.random dummy
scoreboard objectives add cacard.wincount dummy {text:"\u00a76胜场数"}
scoreboard objectives add cacard.winstrike dummy {text:"\u00a76连胜场数"}
scoreboard objectives add cacard.shield.swordcount dummy
scoreboard objectives add cacard.shield.firecount dummy
scoreboard objectives add cacard.summonleft dummy
scoreboard objectives add cacard.up custom:jump
scoreboard objectives add cacard.down custom:sneak_time

execute at @e[tag=cacard.center] run effect give @a[distance=..30,tag=cacard.ingame] saturation 1 255 true
execute at @e[tag=cacard.center] as @a[distance=..30,tag=cacard.ingame] at @s unless block ~ ~-1 ~ amethyst_block run scoreboard players set @s cacard.up 0
execute at @e[tag=cacard.center] as @a[distance=..30,tag=cacard.ingame] at @s unless block ~ ~-1 ~ iron_block run scoreboard players set @s cacard.down 0
scoreboard players add @e[tag=cacard.tosummon,type=zombie] cacard.summonleft 2
scoreboard players add @e[tag=cacard.tosummon,type=wandering_trader] cacard.summonleft 4
tag @e[tag=cacard.tosummon] remove cacard.tosummon
tag @a[scores={cacard.shield.firecount=..0}] remove cacard.shield_fire
tag @a[scores={cacard.shield.swordcount=..0}] remove cacard.shield_sword
kill @e[scores={cacard.summonleft=..0},tag=cacard.summoner]

bossbar add cacardwar:bluehealth ""
bossbar add cacardwar:redhealth ""
execute if entity @a[tag=cacard.blueTeam,tag=cacard.ingame] run bossbar set cacardwar:bluehealth name [{text:"\u00a7b蓝方生命值:"},{score:{name:"#cacard.blueHealth",objective:cacard.health},color:light_purple}]
execute if entity @a[tag=cacard.redTeam,tag=cacard.ingame] run bossbar set cacardwar:redhealth name [{text:"\u00a76红方生命值:"},{score:{name:"#cacard.redHealth",objective:cacard.health},color:light_purple}]
execute unless entity @a[tag=cacard.blueTeam] run bossbar set cacardwar:bluehealth name [{text:"\u00a7e等待玩家…"}]
execute unless entity @a[tag=cacard.redTeam] run bossbar set cacardwar:redhealth name [{text:"\u00a7e等待玩家…"}]
bossbar set cacardwar:bluehealth max 20
bossbar set cacardwar:redhealth max 20
bossbar set cacardwar:bluehealth color blue
bossbar set cacardwar:redhealth color red
bossbar set cacardwar:bluehealth style notched_20
bossbar set cacardwar:redhealth style notched_20
execute at @e[tag=cacard.center] run title @a[distance=..8,gamemode=creative] actionbar {text:"\u00a7e※您当前正处于\u00a7l创造模式\u00a7r\u00a7e！※\u00a7r"}
execute at @e[tag=cacard.center] as @a[distance=..18,tag=cacard.ingame] at @s if block ~ ~-1 ~ amethyst_block if score @s cacard.up matches 1.. run tp @s ~ ~7 ~
execute at @e[tag=cacard.center] as @a[distance=..18,tag=cacard.ingame] at @s if block ~ ~-1 ~ iron_block if score @s cacard.down matches 1.. run tp @s ~ ~-7 ~
execute at @e[tag=cacard.center] run tag @a[distance=..18,tag=!cacard.ingame] add cacard.ingame
execute at @e[tag=cacard.center] run tag @a[distance=24..,tag=cacard.ingame] remove cacard.ingame
advancement grant @a[tag=cacard.ingame,advancements={cacardwar:root=false}] only cacardwar:root
bossbar set cacardwar:bluehealth players @a[tag=cacard.ingame]
bossbar set cacardwar:redhealth players @a[tag=cacard.ingame]

execute if score #cacard.blueHealth cacard.health > #cacard.k cacard.health run scoreboard players set #cacard.blueHealth cacard.health 20
execute store result bossbar cacardwar:bluehealth value run scoreboard players get #cacard.blueHealth cacard.health
execute if score #cacard.blueHealth cacard.health <= #cacard.j cacard.health run bossbar set cacardwar:bluehealth value 0

execute if score #cacard.redHealth cacard.health > #cacard.k cacard.health run scoreboard players set #cacard.redHealth cacard.health 20
execute store result bossbar cacardwar:redhealth value run scoreboard players get #cacard.redHealth cacard.health
execute if score #cacard.redHealth cacard.health <= #cacard.j cacard.health run bossbar set cacardwar:bluehealth value 0