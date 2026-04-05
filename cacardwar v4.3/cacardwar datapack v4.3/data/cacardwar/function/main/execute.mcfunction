#1.离场/入场
##1.1信息显示
execute at @e[tag=cacard.center] run title @a[distance=..8,gamemode=creative] actionbar {text:"\u00a7e※您当前正处于\u00a7l创造模式\u00a7r\u00a7e！※\u00a7r"}
execute at @e[tag=cacard.center] as @a[distance=..18,tag=cacard.ingame] at @s if block ~ ~-1 ~ amethyst_block if score @s cacard.up matches 1.. run tp @s ~ ~7 ~
execute at @e[tag=cacard.center] as @a[distance=..18,tag=cacard.ingame] at @s if block ~ ~-1 ~ iron_block if score @s cacard.down matches 1.. run tp @s ~ ~-7 ~
execute at @e[tag=cacard.center] run tag @a[distance=..18,tag=!cacard.ingame] add cacard.ingame
execute at @e[tag=cacard.center] run tag @a[distance=24..,tag=cacard.ingame] remove cacard.ingame
advancement grant @a[tag=cacard.ingame,advancements={cacardwar:root=false}] only cacardwar:root
##1.2场地电梯
execute at @e[tag=cacard.center] run effect give @a[distance=..18,tag=cacard.ingame] saturation 1 255 true
execute at @e[tag=cacard.center] as @a[distance=..18,tag=cacard.ingame] at @s unless block ~ ~-1 ~ amethyst_block run scoreboard players set @s cacard.up 0
execute at @e[tag=cacard.center] as @a[distance=..18,tag=cacard.ingame] at @s unless block ~ ~-1 ~ iron_block run scoreboard players set @s cacard.down 0

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
execute if score #cacard.redHealth cacard.health <= #cacard.j cacard.health run bossbar set cacardwar:bluehealth value 0

#4.对局
##4.1卡组信息
execute if score #cacard.time cacard.time matches 1 run tag @a[scores={cacard.cardsetype=1}] add cacard.attack
execute if score #cacard.time cacard.time matches 1 run tag @a[scores={cacard.cardsetype=2}] add cacard.average
execute if score #cacard.time cacard.time matches 1 run tag @a[scores={cacard.cardsetype=3}] add cacard.resist
execute if score #cacard.time cacard.time matches 1 run tag @a[scores={cacard.cardsetype=4}] add cacard.summon
function cacardwar:preparation/getcardset {team:red}
function cacardwar:preparation/getcardset {team:blue}
##4.2抽取先后手,1 == 红先 , 0 == 蓝先
$execute if score #cacard.time cacard.time matches 1 store result score #cacard.time cacard.gameSeed run random value 1..2147483647 $(seed)
execute if score #cacard.time cacard.time matches 1 run scoreboard players operation @a[tag=cacard.ready] cacard.gameSeed = #cacard.time cacard.gameSeed
$execute if score #cacard.time cacard.time matches 1 store result score #cacard.i cacard.random run random value 0..1 $(seed)
execute if score #cacard.time cacard.time matches 1 run title @a[tag=cacard.ingame] title {text:"\u00a77- - -\u00a7e\u00a7l游戏开始\u00a7r\u00a77- - -"}
execute if score #cacard.time cacard.time matches 1 run title @a[tag=cacard.ingame,tag=!cacard.ready,scores={cacard.showRate=0}] actionbar {text:"\u00a7e※\u00a7a/trigger cacard.showRate\u00a7e可显示当前双方胜率\u00a7o（仅供参考）\u00a7r\u00a7e※"}
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
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 1 run item replace entity @a[tag=cacard.redTeam] hotbar.8 with lime_concrete[custom_data={cacardwar:["skip","non-card"]},enchantment_glint_override=true,custom_name={text:"\u00a7a按F（或切换至副手位）跳过你的回合"}] 1
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 1 run item replace entity @a[tag=cacard.blueTeam] hotbar.4 with barrier[custom_data={cacardwar:["none","non-card"]},enchantment_glint_override=true,custom_name={text:"\u00a7c现在不是你的回合"}] 1
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 0 run item replace entity @a[tag=cacard.blueTeam] hotbar.8 with lime_concrete[custom_data={cacardwar:["skip","non-card"]},enchantment_glint_override=true,custom_name={text:"\u00a7a按F（或切换至副手位）跳过你的回合"}] 1
execute if score #cacard.time cacard.time matches 2 if score #cacard.i cacard.random matches 0 run item replace entity @a[tag=cacard.redTeam] hotbar.4 with barrier[custom_data={cacardwar:["none","non-card"]},enchantment_glint_override=true,custom_name={text:"\u00a7c现在不是你的回合"}] 1
##4.6跳过回合
execute as @a[nbt={equipment:{offhand:{id:"minecraft:lime_concrete",components:{"minecraft:custom_data":{cacardwar:["skip"]}}}}},tag=cacard.blueTeam] run function cacardwar:main/skip {team:blue,oppteam:red}
execute as @a[nbt={equipment:{offhand:{id:"minecraft:lime_concrete",components:{"minecraft:custom_data":{cacardwar:["skip"]}}}}},tag=cacard.redTeam] run function cacardwar:main/skip {team:red,oppteam:blue}
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
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run title @a[tag=cacard.ingame,tag=!cacard.ready] actionbar [{text:"\u00a76※\u00a7c\u00a7l对局中断！"},{text:"\u00a76※"}]
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run title @a[tag=cacard.ready] actionbar [{text:"\u00a76※\u00a7c\u00a7l对局中断！\u00a7r\u00a76这通常源于您的对手现处于离线状态。"},{text:"\u00a76您可以选择\u00a7c重置游戏\u00a76或\u00a7a等待对手上线\u00a76。※"}]
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run clear @a lime_concrete[custom_data={cacardwar:["skip"]}]
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 run item replace entity @a[nbt={Inventory:[{Slot:8b,components:{"minecraft:custom_data":{cacardwar:["stop","non-card"]}}}]}] hotbar.8 with lime_concrete[custom_data={cacardwar:["skip","non-card"]},enchantment_glint_override=true,custom_name={text:"\u00a7a按F（或切换至副手位）跳过你的回合"}] 1
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run item replace entity @a[tag=cacard.ready] hotbar.8 with red_concrete[custom_data={cacardwar:["stop","non-card"]},enchantment_glint_override=true,custom_name={text:"\u00a7c对局中断！"},lore=[{text:"\u00a76这通常源于您的对手现处于离线状态。"},{text:"\u00a76您可以选择\u00a7c重置游戏\u00a76或\u00a7a等待对手上线\u00a76。"},{text:"\u00a7c\u00a7l请不要移动此物品的位置！"}]] 1
##4.10评分
execute as @a[tag=cacard.ready] run scoreboard players operation @s cacard.point -= @s cacard.leftcardcount
scoreboard players set @a[tag=cacard.ready] cacard.leftcardcount 0
execute if score #cacard.time cacard.isongoing matches 1 run title @a[tag=cacard.ingame,tag=!cacard.ready,scores={cacard.showRate=1..}] actionbar [{score:{name:"@a[tag=cacard.blueTeam]",objective:"cacard.point"},color:"aqua"},{text:"\u00a7r : "},{score:{name:"@a[tag=cacard.redTeam]",objective:"cacard.point"},color:"gold"}]
##4.11胜负判断
execute if score #cacard.time cacard.isongoing matches 2 run function cacardwar:main/info with storage cacardwar:cardsetinfo
execute if score #cacard.redHealth cacard.health <= #cacard.j cacard.health run function cacardwar:main/win {team:blue,oppteam:red,fcolors:[5294056,2217976,2669309],text1:"b",text2:"蓝",color:aqua}
execute if score #cacard.blueHealth cacard.health <= #cacard.j cacard.health run function cacardwar:main/win {team:red,oppteam:blue,fcolors:[15244368,16289825,16101403],text1:"6",text2:"红",color:gold}
##4.12中途退出后重进许可
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] if score @s cacard.gameSeed = #cacard.time cacard.gameSeed run title @s actionbar [{text:"\u00a7e※游戏仍在进行中，继续游戏※"}]
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run title @s actionbar [{text:"\u00a7c※上局游戏已结束※"}]
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run function cacardwar:main/clear_all_item
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run scoreboard players set @s cacard.cardcount 0
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run scoreboard players set @s cacard.shieldtype 0
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run scoreboard players set @s cacard.point 0
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run tag @s remove cacard.shield_fire
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run tag @s remove cacard.shield_sword
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run tag @s remove cacard.hungry
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run tag @s remove cacard.attack
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run tag @s remove cacard.average
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run tag @s remove cacard.resist
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run tag @s remove cacard.summon
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run tag @s remove cacard.blueTeam
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run tag @s remove cacard.redTeam
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run tag @s remove cacard.winner
execute as @a[tag=cacard.ready,scores={cacard.joinGame=1..}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run scoreboard players set @s cacard.gameSeed -1
execute as @a[tag=cacard.ready,scores={cacard.gameSeed=-1}] unless score @s cacard.gameSeed = #cacard.time cacard.gameSeed run tag @s remove cacard.ready
scoreboard players set @a[scores={cacard.gameSeed=..-1}] cacard.gameSeed 0
scoreboard players set @a[scores={cacard.joinGame=1}] cacard.joinGame 0

#5.召唤物生成
##5.1召唤物初始生命值
scoreboard players add @e[tag=cacard.tosummon,type=zombie] cacard.summonleft 2
scoreboard players add @e[tag=cacard.tosummon,type=wandering_trader] cacard.summonleft 4
##5.2召唤物生成与清除
tag @e[tag=cacard.tosummon] remove cacard.tosummon
execute as @e[scores={cacard.summonleft=..0},tag=cacard.summoner] at @s run tp @s ~ -100 ~
kill @e[scores={cacard.summonleft=..0},tag=cacard.summoner]

#6.效果
##6.1盾
###6.1.1蓝方铁盾
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=1}] at @e[tag=cacard.blue5] run particle $(particle1)
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=4}] at @e[tag=cacard.blue5] run particle $(particle1)
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=5}] at @e[tag=cacard.blue5] run particle $(particle1)
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=7}] at @e[tag=cacard.blue5] run particle $(particle1)
###6.1.2蓝方金盾
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=2}] at @e[tag=cacard.blue5] run particle $(particle2)
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=4}] at @e[tag=cacard.blue5] run particle $(particle2)
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=6}] at @e[tag=cacard.blue5] run particle $(particle2)
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=7}] at @e[tag=cacard.blue5] run particle $(particle2)
###6.1.3蓝方钻盾
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=3}] at @e[tag=cacard.blue5] run particle $(particle3)
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=5}] at @e[tag=cacard.blue5] run particle $(particle3)
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=6}] at @e[tag=cacard.blue5] run particle $(particle3)
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=7}] at @e[tag=cacard.blue5] run particle $(particle3)
###6.1.4红方铁盾
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=1}] at @e[tag=cacard.red5] run particle $(particle1)
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=4}] at @e[tag=cacard.red5] run particle $(particle1)
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=5}] at @e[tag=cacard.red5] run particle $(particle1)
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=7}] at @e[tag=cacard.red5] run particle $(particle1)
###6.1.5红方金盾
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=2}] at @e[tag=cacard.red5] run particle $(particle2)
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=4}] at @e[tag=cacard.red5] run particle $(particle2)
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=6}] at @e[tag=cacard.red5] run particle $(particle2)
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=7}] at @e[tag=cacard.red5] run particle $(particle2)
###6.1.6红方钻盾
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=3}] at @e[tag=cacard.red5] run particle $(particle3)
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=5}] at @e[tag=cacard.red5] run particle $(particle3)
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=6}] at @e[tag=cacard.red5] run particle $(particle3)
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=7}] at @e[tag=cacard.red5] run particle $(particle3)
##6.2饥饿
execute if entity @a[tag=cacard.blueTeam,tag=cacard.hungry] at @e[tag=cacard.blue5] run particle dust{color:[0.35,0.2,0],scale:1} ~ ~2 ~ 0.5 0.3 0.5 0 1 normal @a[tag=cacard.ingame]
execute if entity @a[tag=cacard.redTeam,tag=cacard.hungry] at @e[tag=cacard.red5] run particle dust{color:[0.35,0.2,0],scale:1} ~ ~2 ~ 0.5 0.3 0.5 0 1 normal @a[tag=cacard.ingame]