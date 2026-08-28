#1.离场/入场
##1.1信息显示
execute at @e[tag=cacard.center] run title @a[distance=..8,gamemode=creative] actionbar {text:"§e※您当前正处于§l创造模式§r§e！※§r"}
execute at @e[tag=cacard.center] positioned ~4.5 ~3 ~ as @a[distance=..16,tag=cacard.ingame] at @s if block ~ ~-1 ~ amethyst_block if score @s cacard.up matches 1.. run tp @s ~ ~7 ~
execute at @e[tag=cacard.center] positioned ~4.5 ~3 ~ as @a[distance=..16,tag=cacard.ingame] at @s if block ~ ~-1 ~ iron_block if score @s cacard.down matches 1.. run tp @s ~ ~-7 ~
execute at @e[tag=cacard.center] positioned ~4.5 ~3 ~ run tag @a[distance=..16,tag=!cacard.ingame] add cacard.ingame
execute at @e[tag=cacard.center] positioned ~4.5 ~3 ~ run tag @a[distance=18..,tag=cacard.ingame] remove cacard.ingame
advancement grant @a[tag=cacard.ingame,advancements={cacardwar:root=false}] only cacardwar:root
##1.2场地电梯
execute at @e[tag=cacard.center] positioned ~4.5 ~3 ~ run effect give @a[distance=..16,tag=cacard.ingame] saturation 1 255 true
execute at @e[tag=cacard.center] positioned ~4.5 ~3 ~ as @a[distance=..16,tag=cacard.ingame] at @s unless block ~ ~-1 ~ amethyst_block run scoreboard players set @s cacard.up 0
execute at @e[tag=cacard.center] positioned ~4.5 ~3 ~ as @a[distance=..16,tag=cacard.ingame] at @s unless block ~ ~-1 ~ iron_block run scoreboard players set @s cacard.down 0

#2.计时
##2.1每秒更新旁栏
scoreboard players operation #cacard.timeCheck cacard.time = #cacard.time cacard.time
scoreboard players operation #cacard.timeCheck cacard.time %= #cacard.j cacard.time
execute if score #cacard.timeCheck cacard.time matches 0 run function cacardwar:main/info
##2.2游戏刻步进条件
execute store result score #cacard.time cacard.players run execute if entity @a[tag=cacard.ready]
execute if score #cacard.time cacard.isongoing matches 0 unless score #cacard.time cacard.players matches 2 run scoreboard players set #cacard.time cacard.time 0
###2.2.1经典对局
execute if score #cacard.time cacard.isongoing matches 0 if score #cacard.time cacard.players matches 2 run scoreboard players set #cacard.time cacard.isongoing 1
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 run scoreboard players add #cacard.time cacard.time 1
###2.2.2AI训练模式
execute if score #cacard.time cacard.isongoing matches 0 if entity @a[tag=cacard.inAImode,tag=cacard.ready,tag=cacard.blueTeam,limit=1] run scoreboard players set #cacard.time cacard.isongoing 5
execute if score #cacard.time cacard.isongoing matches 5 if entity @a[tag=cacard.inAImode,limit=1] run scoreboard players add #cacard.time cacard.time 1

#3.更新顶栏血量
##3.1蓝方
execute if score #cacard.blueHealth cacard.health > #cacard.k cacard.health run scoreboard players set #cacard.blueHealth cacard.health 20
execute store result bossbar cacardwar:bluehealth value run scoreboard players get #cacard.blueHealth cacard.health
execute if score #cacard.blueHealth cacard.health <= #cacard.j cacard.health run bossbar set cacardwar:bluehealth value 0
##3.2红方
execute if score #cacard.redHealth cacard.health > #cacard.k cacard.health run scoreboard players set #cacard.redHealth cacard.health 20
execute store result bossbar cacardwar:redhealth value run scoreboard players get #cacard.redHealth cacard.health
execute if score #cacard.redHealth cacard.health <= #cacard.j cacard.health run bossbar set cacardwar:redhealth value 0

#4.对局模式
$execute if score #cacard.time cacard.isongoing matches 1..2 run function cacardwar:main/gamemode/classic {seed:$(seed)}
execute if score #cacard.time cacard.isongoing matches 3..4 run function cacardwar:main/gamemode/basic_tuition
execute if score #cacard.time cacard.isongoing matches 5 run function cacardwar:main/gamemode/ai

#5.召唤物生成
##5.1召唤物初始生命值
scoreboard players add @e[type=zombie,tag=cacard.tosummon,tag=cacard.Zombie] cacard.summonleft 2
scoreboard players add @e[type=wandering_trader,tag=cacard.tosummon,tag=cacard.Trader] cacard.summonleft 4
scoreboard players add @e[type=husk,tag=cacard.tosummon,tag=cacard.SuperZombie] cacard.summonleft 2
scoreboard players add @e[type=armor_stand,tag=cacard.tosummon,tag=cacard.Scarecrow] cacard.summonleft 2
##5.2召唤物生成与清除
tag @e[tag=cacard.tosummon] remove cacard.tosummon
execute as @e[scores={cacard.summonleft=..0},tag=cacard.summoner,tag=!cacard.Scarecrow] at @s run particle poof ~ ~ ~ 0.2 0.5 0.2 0.1 16 normal @a[tag=cacard.ingame]
execute as @e[scores={cacard.summonleft=..0},tag=cacard.summoner] at @s run tp @s ~ -100 ~
kill @e[scores={cacard.summonleft=..0},tag=cacard.summoner]

#6.效果粒子
$execute if score #cacard.timeCheck cacard.time matches 10 run function cacardwar:main/particle {particle1:"$(particle1)",particle2:"$(particle2)",particle3:"$(particle3)"}

#7.局外玩家模型
##7.1注视
execute as @e[type=mannequin,tag=cacardwar,limit=1] at @s facing entity @a[distance=..6] feet run tp @s ~ ~ ~ ~ ~
execute as @e[type=parrot,tag=cacardwar,limit=1] at @s facing entity @a[distance=..4] feet run tp @s ~ ~ ~ ~ ~

#8.乌鸦的赐福
#8.1物品转变
execute as @a[tag=cacard.ready,tag=cacard.bless_of_crow] if items entity @s container.* wheat[custom_data~{"cacardwar":["wheat"]}] run particle happy_villager ~ ~ ~ 0.2 0.8 0.2 0 8 normal @a[tag=cacard.ready]
execute as @a[tag=cacard.ready,tag=cacard.bless_of_crow] if items entity @s container.* wheat[custom_data~{"cacardwar":["wheat"]}] run give @s wheat[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §a§l新生的小麦"}],custom_data={cacardwar:["newly_wheat","card","card12"],cacard.recipe6:true},custom_model_data={strings:["cacardwar:newly_wheat"]},lore=[{text:"§7§o手持并等待以展示参与的复杂配方。"}]] 1
execute as @a[tag=cacard.ready,tag=cacard.bless_of_crow] if items entity @s container.* wheat[custom_data~{"cacardwar":["wheat"]}] run clear @s wheat[custom_data~{"cacardwar":["wheat"]}] 1

#9.入场动画
scoreboard players add @a[tag=cacard.newPlayer,scores={cacard.newPlayer=0..600}] cacard.newPlayer 1
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=20}] at @s run function cacardwar:new_player/new_player2
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=140}] at @s run function cacardwar:new_player/new_player3
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=240}] at @s run function cacardwar:new_player/new_player4
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=340}] at @s run function cacardwar:new_player/new_player5
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=440}] at @s run function cacardwar:new_player/new_player6
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=540}] at @s run function cacardwar:new_player/new_player7
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=600}] at @s run function cacardwar:new_player/new_player8
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=21}] at @s run playsound item.armor.equip_elytra master @s
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=141}] at @s run playsound item.armor.equip_elytra master @s
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=241}] at @s run playsound item.armor.equip_elytra master @s
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=341}] at @s run playsound item.armor.equip_elytra master @s
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=441}] at @s run playsound item.armor.equip_elytra master @s
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=541}] at @s run playsound item.armor.equip_elytra master @s
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=-1}] at @s run playsound item.armor.equip_elytra master @s
scoreboard players reset @a[scores={cacard.newPlayer=..-1}] cacard.newPlayer

