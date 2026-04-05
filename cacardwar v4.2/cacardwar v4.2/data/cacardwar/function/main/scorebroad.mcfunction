gamerule commandBlockOutput false

#召唤物初始生命值
scoreboard players add @e[tag=cacard.tosummon,type=zombie] cacard.summonleft 2
scoreboard players add @e[tag=cacard.tosummon,type=wandering_trader] cacard.summonleft 4

#基本计分板
scoreboard objectives add cacard.point dummy
scoreboard objectives add cacard.leftcardcount dummy

scoreboard objectives add cacard.cardcount dummy
scoreboard objectives add cacard.health dummy
scoreboard objectives add cacard.shield.count dummy
scoreboard objectives add cacard.shieldtype dummy
#盾状态0无盾；1仅铁；2仅金；3仅钻石；4铁金；5铁钻；6金钻；7All
scoreboard objectives add cacard.summonleft dummy
scoreboard players add #cacard.redHealth cacard.health 0
scoreboard players add #cacard.blueHealth cacard.health 0
scoreboard players set #cacard.i cacard.health 2
scoreboard players set #cacard.i cacard.time 24000
scoreboard players set #cacard.j cacard.time 20
scoreboard players set #cacard.k cacard.time 60
scoreboard players set #cacard.j cacard.health 0
scoreboard players set #cacard.k cacard.health 20
scoreboard objectives add cacard.time dummy
scoreboard objectives add cacard.isongoing dummy
scoreboard objectives add cacard.players dummy
execute store result score #cacard.time cacard.players run execute if entity @a[tag=cacard.ready]
scoreboard players add #cacard.time cacard.time 0
scoreboard objectives add cacard.cardsetype dummy
scoreboard objectives add cacard.Info dummy {text:"\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战  \u00a76信息栏\u00a7r"}
scoreboard objectives add cacard.random dummy
scoreboard objectives add cacard.wincount dummy {text:"\u00a76胜场数"}
scoreboard objectives add cacard.winstrike dummy {text:"\u00a76连胜场数"}

scoreboard objectives add cacard.up custom:jump
scoreboard objectives add cacard.down custom:sneak_time

execute at @e[tag=cacard.center] run effect give @a[distance=..30,tag=cacard.ingame] saturation 1 255 true
execute at @e[tag=cacard.center] as @a[distance=..30,tag=cacard.ingame] at @s unless block ~ ~-1 ~ amethyst_block run scoreboard players set @s cacard.up 0
execute at @e[tag=cacard.center] as @a[distance=..30,tag=cacard.ingame] at @s unless block ~ ~-1 ~ iron_block run scoreboard players set @s cacard.down 0

tag @e[tag=cacard.tosummon] remove cacard.tosummon
tag @a[scores={cacard.shield.count=..-1}] remove cacard.shield_fire
tag @a[scores={cacard.shield.count=..-1}] remove cacard.shield_sword
kill @e[scores={cacard.summonleft=..0},tag=cacard.summoner]

scoreboard players operation #cacard.timeCheck cacard.time = #cacard.time cacard.time
scoreboard players operation #cacard.timeCheck cacard.time %= #cacard.j cacard.time
execute if score #cacard.timeCheck cacard.time matches 0 run function cacardwar:main/info with storage cacardwar:cardsetinfo

team add CacardwarPlayers
team modify CacardwarPlayers color white
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
team join CacardwarPlayers @a[tag=cacard.ingame]
team leave @a[tag=!cacard.ingame]
scoreboard objectives setdisplay sidebar.team.white cacard.Info
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run function cacardwar:main/info with storage cacardwar:cardsetinfo
execute if score #cacard.time cacard.isongoing matches 2 run function cacardwar:main/info with storage cacardwar:cardsetinfo

execute if score #cacard.blueHealth cacard.health > #cacard.k cacard.health run scoreboard players set #cacard.blueHealth cacard.health 20
execute store result bossbar cacardwar:bluehealth value run scoreboard players get #cacard.blueHealth cacard.health
execute if score #cacard.blueHealth cacard.health <= #cacard.j cacard.health run bossbar set cacardwar:bluehealth value 0

execute if score #cacard.redHealth cacard.health > #cacard.k cacard.health run scoreboard players set #cacard.redHealth cacard.health 20
execute store result bossbar cacardwar:redhealth value run scoreboard players get #cacard.redHealth cacard.health
execute if score #cacard.redHealth cacard.health <= #cacard.j cacard.health run bossbar set cacardwar:bluehealth value 0