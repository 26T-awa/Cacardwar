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
execute if score #cacard.timeCheck cacard.time matches 0 run function cacardwar:main/info with storage cacardwar:cardsetinfo
##2.2中断
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 run scoreboard players add #cacard.time cacard.time 1
execute if score #cacard.time cacard.isongoing matches 0 if score #cacard.time cacard.players matches 2 run scoreboard players set #cacard.time cacard.isongoing 1
execute if score #cacard.time cacard.isongoing matches 0 if score #cacard.time cacard.players matches 0..1 run scoreboard players set #cacard.time cacard.time 0

#3.更新顶栏血量
##3.1蓝方
execute if score #cacard.blueHealth cacard.health > #cacard.k cacard.health run scoreboard players set #cacard.blueHealth cacard.health 20
execute store result bossbar cacardwar:bluehealth value run scoreboard players get #cacard.blueHealth cacard.health
execute if score #cacard.blueHealth cacard.health <= #cacard.j cacard.health run bossbar set cacardwar:bluehealth value 0
##3.2红方
execute if score #cacard.redHealth cacard.health > #cacard.k cacard.health run scoreboard players set #cacard.redHealth cacard.health 20
execute store result bossbar cacardwar:redhealth value run scoreboard players get #cacard.redHealth cacard.health
execute if score #cacard.redHealth cacard.health <= #cacard.j cacard.health run bossbar set cacardwar:redhealth value 0

#4.标准对局
##4.1卡组信息
execute if score #cacard.time cacard.time matches 1 run tag @a[scores={cacard.cardsetype=1}] add cacard.attack
execute if score #cacard.time cacard.time matches 1 run tag @a[scores={cacard.cardsetype=2}] add cacard.average
execute if score #cacard.time cacard.time matches 1 run tag @a[scores={cacard.cardsetype=3}] add cacard.resist
execute if score #cacard.time cacard.time matches 1 run tag @a[scores={cacard.cardsetype=4}] add cacard.summon
##4.2抽取先后手,1 == 红先 , 0 == 蓝先
$execute if score #cacard.time cacard.time matches 1 store result score #cacard.time cacard.gameSeed run random value 1..2147483647 $(seed)
execute if score #cacard.time cacard.time matches 1 run scoreboard players operation @a[tag=cacard.ready] cacard.gameSeed = #cacard.time cacard.gameSeed
$execute if score #cacard.time cacard.time matches 1 store result score #cacard.i cacard.random run random value 0..1 $(seed)
execute if score #cacard.time cacard.time matches 1 run title @a[tag=cacard.ingame] title {text:"§7- - -§e§l游戏开始§r§7- - -"}
execute if score #cacard.time cacard.time matches 1 run title @a[tag=cacard.ingame,tag=!cacard.ready,scores={cacard.showRate=0}] actionbar {text:"§e※§a/trigger cacard.showRate§e可显示当前双方胜率§o（仅供参考）§r§e※"}
execute if score #cacard.time cacard.time matches 1 as @a[tag=cacard.ready] run function cacardwar:main/clear_all_item
##4.3先后手信息显示
execute if score #cacard.time cacard.time matches 2 run scoreboard players set #cacard.blueHealth cacard.health 20
execute if score #cacard.time cacard.time matches 2 run scoreboard players set #cacard.redHealth cacard.health 20
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 1 run title @a[tag=cacard.ready,tag=cacard.blueTeam] subtitle {text:"你是后手"}
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 1 run title @a[tag=cacard.ready,tag=cacard.redTeam] subtitle {text:"你是先手"}
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 0 run title @a[tag=cacard.ready,tag=cacard.blueTeam] subtitle {text:"你是先手"}
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 0 run title @a[tag=cacard.ready,tag=cacard.redTeam] subtitle {text:"你是后手"}
##4.4初始发牌
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 1 run scoreboard players add @a[tag=cacard.redTeam] cacard.cardcount 4
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 0 run scoreboard players add @a[tag=cacard.blueTeam] cacard.cardcount 4
###4.4.1发牌
loot give @a[tag=cacard.attack,scores={cacard.cardcount=1..}] loot cacardwar:attack
loot give @a[tag=cacard.average,scores={cacard.cardcount=1..}] loot cacardwar:average
loot give @a[tag=cacard.resist,scores={cacard.cardcount=1..}] loot cacardwar:resist
loot give @a[tag=cacard.summon,scores={cacard.cardcount=1..}] loot cacardwar:summon
execute as @a[scores={cacard.cardcount=1..}] at @s run playsound item.armor.equip_elytra master @s ^ ^ ^ 1.3 1
scoreboard players remove @a[scores={cacard.cardcount=1..}] cacard.cardcount 1
##4.5对局信息物品
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 1 run item replace entity @a[tag=cacard.redTeam] hotbar.8 with lime_concrete[custom_data={cacardwar:["skip","non-card"]},enchantment_glint_override=true,custom_name={text:"§a按F（或切换至副手位）跳过你的回合"}] 1
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 1 run item replace entity @a[tag=cacard.blueTeam] hotbar.4 with barrier[custom_data={cacardwar:["none","non-card"]},enchantment_glint_override=true,custom_name={text:"§c现在不是你的回合"}] 1
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 0 run item replace entity @a[tag=cacard.blueTeam] hotbar.8 with lime_concrete[custom_data={cacardwar:["skip","non-card"]},enchantment_glint_override=true,custom_name={text:"§a按F（或切换至副手位）跳过你的回合"}] 1
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 0 run item replace entity @a[tag=cacard.redTeam] hotbar.4 with barrier[custom_data={cacardwar:["none","non-card"]},enchantment_glint_override=true,custom_name={text:"§c现在不是你的回合"}] 1
##4.6跳过回合
execute if items entity @a[tag=cacard.blueTeam] weapon.offhand lime_concrete[custom_data~{cacardwar:["skip"]}] as @a[tag=cacard.blueTeam] run function cacardwar:main/skip {team:blue,oppteam:red}
execute if items entity @a[tag=cacard.redTeam] weapon.offhand lime_concrete[custom_data~{cacardwar:["skip"]}] as @a[tag=cacard.redTeam] run function cacardwar:main/skip {team:red,oppteam:blue}
#execute as @a[nbt={equipment:{offhand:{id:"minecraft:lime_concrete",components:{"minecraft:custom_data":{cacardwar:["skip"]}}}}},tag=cacard.blueTeam] run function cacardwar:main/skip {team:blue,oppteam:red}
#execute as @a[nbt={equipment:{offhand:{id:"minecraft:lime_concrete",components:{"minecraft:custom_data":{cacardwar:["skip"]}}}}},tag=cacard.redTeam] run function cacardwar:main/skip {team:red,oppteam:blue}
##4.7物品保护
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 1 run execute as @e[tag=cacard.blue] run data modify entity @s Fixed set value true
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 1 run execute as @e[tag=cacard.blue0] run data modify entity @s Fixed set value true
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 0 run execute as @e[tag=cacard.red] run data modify entity @s Fixed set value true
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 0 run execute as @e[tag=cacard.red0] run data modify entity @s Fixed set value true
##4.8移除物品惩罚
execute as @e[tag=cacard.blue] at @s run function cacardwar:main/kill_item
execute as @e[tag=cacard.red] at @s run function cacardwar:main/kill_item
##4.9对局中断处理
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run function cacardwar:main/info with storage cacardwar:cardsetinfo
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run title @a[tag=cacard.ingame,tag=!cacard.ready] actionbar [{text:"§6※§c§l对局中断！"},{text:"§6※"}]
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run title @a[tag=cacard.ready] actionbar [{text:"§6※§c§l对局中断！§r§6这通常源于您的对手现处于离线状态。"},{text:"§6您可以选择§c重置游戏§6或§a等待对手上线§6。※"}]
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run clear @a lime_concrete[custom_data={cacardwar:["skip"]}]
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 as @a[tag=cacard.ready] if items entity @s hotbar.8 *[custom_data~{cacardwar:["stop","non-card"]}] run item replace entity @s hotbar.8 with lime_concrete[custom_data={cacardwar:["skip","non-card"]},enchantment_glint_override=true,custom_name={text:"§a按F（或切换至副手位）跳过你的回合"}] 1
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run item replace entity @a[tag=cacard.ready] hotbar.8 with red_concrete[custom_data={cacardwar:["stop","non-card"]},enchantment_glint_override=true,custom_name={text:"§c对局中断！"},lore=[{text:"§6这通常源于您的对手现处于离线状态。"},{text:"§6您可以选择§c重置游戏§6或§a等待对手上线§6。"},{text:"§c§l请不要移动此物品的位置！"}]] 1
##4.10评分
execute as @a[tag=cacard.ready] run scoreboard players operation @s cacard.point -= @s cacard.leftcardcount
scoreboard players set @a[tag=cacard.ready] cacard.leftcardcount 0
execute if score #cacard.time cacard.isongoing matches 1 run title @a[tag=cacard.ingame,scores={cacard.showRate=1..}] actionbar [{score:{name:"@a[tag=cacard.blueTeam]",objective:"cacard.point"},color:"aqua"},{text:"§r : "},{score:{name:"@a[tag=cacard.redTeam]",objective:"cacard.point"},color:"gold"}]
##4.11胜负判断
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.redHealth cacard.health <= #cacard.j cacard.health run function cacardwar:main/win {team:blue,oppteam:red,fcolors:[5294056,2217976,2669309],text1:"b",text2:"蓝",color:aqua}
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.blueHealth cacard.health <= #cacard.j cacard.health run function cacardwar:main/win {team:red,oppteam:blue,fcolors:[15244368,16289825,16101403],text1:"6",text2:"红",color:gold}
execute if score #cacard.time cacard.isongoing matches 2 run function cacardwar:main/info with storage cacardwar:cardsetinfo
##4.12中途退出后重进许可
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] if score @s cacard.gameSeed = #cacard.time cacard.gameSeed run title @s actionbar [{text:"§e※游戏仍在进行中，继续游戏※"}]
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run title @s actionbar [{text:"§c※上局游戏已结束※"}]
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run function cacardwar:main/clear_all_item
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run scoreboard players set @s cacard.cardcount 0
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run scoreboard players set @s cacard.shieldtype 0
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run scoreboard players set @s cacard.point 0
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run scoreboard players set @s cacard.gameSeed -1
execute as @a[tag=cacard.ready,scores={cacard.gameSeed=-1}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run function cacardwar:main/remove_all_tag
scoreboard players set @a[scores={cacard.gameSeed=..-1}] cacard.gameSeed 0
scoreboard players set @a[scores={cacard.joinGame=1}] cacard.joinGame 0

#5.召唤物生成
##5.1召唤物初始生命值
scoreboard players add @e[type=zombie,tag=cacard.tosummon,tag=cacard.Zombie] cacard.summonleft 2
scoreboard players add @e[type=wandering_trader,tag=cacard.tosummon,tag=cacard.Trader] cacard.summonleft 4
scoreboard players add @e[type=husk,tag=cacard.tosummon,tag=cacard.SuperZombie] cacard.summonleft 2
scoreboard players add @e[type=armor_stand,tag=cacard.tosummon,tag=cacard.Scarecrow] cacard.summonleft 2
##5.2召唤物生成与清除
tag @e[tag=cacard.tosummon] remove cacard.tosummon
###5.2.1稻草人自然消失
execute as @e[scores={cacard.summonleft=..0},tag=cacard.summoner,tag=cacard.blueScarecrow] at @s run function cacardwar:operation/bless_of_crow {team:blue,oppteam:red,teamcolor:aqua,teamtext:"b蓝"}
execute as @e[scores={cacard.summonleft=..0},tag=cacard.summoner,tag=cacard.redScarecrow] at @s run function cacardwar:operation/bless_of_crow {team:red,oppteam:blue,teamcolor:gold,teamtext:"6红"}
###~5.2.1
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
execute as @a[tag=cacard.ready,tag=cacard.bless_of_crow] if items entity @s container.* wheat[custom_data~{"cacardwar":["wheat"]}] run give @s wheat[enchantment_glint_override=true,custom_name=[{text:"§a卡牌 §7-- §a§l新生的小麦"}],custom_data={cacardwar:["newly_wheat","card"]},custom_model_data={strings:["cacardwar:newly_wheat"]}] 1
execute as @a[tag=cacard.ready,tag=cacard.bless_of_crow] if items entity @s container.* wheat[custom_data~{"cacardwar":["wheat"]}] run clear @s wheat[custom_data~{"cacardwar":["wheat"]}] 1

#9.入场动画
scoreboard players add @a[tag=cacard.newPlayer,scores={cacard.newPlayer=0..600}] cacard.newPlayer 1
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=20}] at @s run function cacardwar:main/others/newplayer2
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=140}] at @s run function cacardwar:main/others/newplayer3
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=240}] at @s run function cacardwar:main/others/newplayer4
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=340}] at @s run function cacardwar:main/others/newplayer5
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=440}] at @s run function cacardwar:main/others/newplayer6
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=540}] at @s run function cacardwar:main/others/newplayer7
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=600}] at @s run function cacardwar:main/others/newplayer8
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=21}] at @s run playsound item.armor.equip_elytra master @s
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=141}] at @s run playsound item.armor.equip_elytra master @s
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=241}] at @s run playsound item.armor.equip_elytra master @s
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=341}] at @s run playsound item.armor.equip_elytra master @s
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=441}] at @s run playsound item.armor.equip_elytra master @s
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=541}] at @s run playsound item.armor.equip_elytra master @s
execute as @a[tag=cacard.newPlayer,scores={cacard.newPlayer=-1}] at @s run playsound item.armor.equip_elytra master @s
scoreboard players reset @a[scores={cacard.newPlayer=..-1}] cacard.newPlayer

#10.基础教程
scoreboard players add @a[tag=cacard.bt,scores={cacard.basicTuition=0..600}] cacard.basicTuition 1
execute as @a[tag=cacard.bt1,scores={cacard.basicTuition=20}] at @s run function cacardwar:basic_tuition/bt1_1
execute as @a[tag=cacard.bt1,scores={cacard.basicTuition=100}] at @s run function cacardwar:basic_tuition/bt1_2
execute as @a[tag=cacard.bt1,scores={cacard.basicTuition=180}] at @s run function cacardwar:basic_tuition/bt1_3
execute as @a[tag=cacard.bt1,tag=cacard.ready,tag=cacard.redTeam] at @s run function cacardwar:basic_tuition/bt1_4

execute as @a[tag=cacard.bt2,scores={cacard.basicTuition=40}] at @s run function cacardwar:basic_tuition/bt2_1
execute as @a[tag=cacard.bt2,scores={cacard.basicTuition=120}] at @s run function cacardwar:basic_tuition/bt2_2
execute as @a[tag=cacard.bt2,scores={cacard.basicTuition=200}] at @s run function cacardwar:basic_tuition/bt2_3
execute as @a[tag=cacard.bt2,scores={cacard.basicTuition=600}] at @s run tellraw @s [{text:"\n                  "},{text:"§7§l[重 试]§r",click_event:{action:"run_command",command:"/function cacardwar:basic_tuition/bt2_retry"}},{text:"\n"}]

execute as @a[tag=cacard.bt3,scores={cacard.basicTuition=40}] at @s run function cacardwar:basic_tuition/bt3_1
execute as @a[tag=cacard.bt3,scores={cacard.basicTuition=120}] at @s run function cacardwar:basic_tuition/bt3_2
execute as @a[tag=cacard.bt3,scores={cacard.basicTuition=200}] at @s run function cacardwar:basic_tuition/bt3_3
execute as @a[tag=cacard.bt3,scores={cacard.basicTuition=260}] at @s run function cacardwar:basic_tuition/bt3_4
execute as @a[tag=cacard.bt3,tag=cacard.ready,tag=cacard.redTeam,scores={cacard.basicTuition=261..601}] if score #cacard.redHealth cacard.health matches 16..20 at @s run function cacardwar:basic_tuition/bt3_5
execute as @a[tag=cacard.bt3,scores={cacard.basicTuition=600}] if score #cacard.redHealth cacard.health matches 5..12 at @s run tellraw @s [{text:"\n                  "},{text:"§7§l[重 试]§r",click_event:{action:"run_command",command:"/function cacardwar:basic_tuition/bt3_retry"}},{text:"\n"}]
execute as @a[tag=cacard.bt3,scores={cacard.basicTuition=600}] if score #cacard.redHealth cacard.health matches 13..15 at @s run tellraw @s [{text:"\n            "},{text:"§7§l[重 试]§r",click_event:{action:"run_command",command:"/function cacardwar:basic_tuition/bt3_retry"}},{text:"      "},{text:"§a§l[跳 过]§r",click_event:{action:"run_command",command:"/function cacardwar:basic_tuition/bt3_5"}},{text:"\n"}]

execute as @a[tag=cacard.bt4,scores={cacard.basicTuition=40}] at @s run function cacardwar:basic_tuition/bt4_1
execute as @a[tag=cacard.bt4,scores={cacard.basicTuition=120}] at @s run function cacardwar:basic_tuition/bt4_2
execute as @a[tag=cacard.bt4,scores={cacard.basicTuition=200}] at @s run function cacardwar:basic_tuition/bt4_3
execute as @a[tag=cacard.bt4,scores={cacard.basicTuition=250}] at @s run function cacardwar:basic_tuition/bt4_4
scoreboard players reset @a[tag=!cacard.bt] cacard.basicTuition
