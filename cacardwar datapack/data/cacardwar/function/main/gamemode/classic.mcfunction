
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
