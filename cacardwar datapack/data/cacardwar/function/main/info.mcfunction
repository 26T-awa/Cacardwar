scoreboard players set cacard.info1 cacard.Info 9
scoreboard players set cacard.info2 cacard.Info 8
scoreboard players set cacard.info3 cacard.Info 7
scoreboard players set cacard.info4 cacard.Info 6
scoreboard players set cacard.info5 cacard.Info 5
scoreboard players set cacard.info6 cacard.Info 4
scoreboard players set cacard.info7 cacard.Info 3
scoreboard players set cacard.info8 cacard.Info 2
scoreboard players set cacard.info9 cacard.Info 1

scoreboard players display numberformat cacard.info1 cacard.Info blank
scoreboard players display numberformat cacard.info2 cacard.Info blank
scoreboard players display numberformat cacard.info3 cacard.Info blank
scoreboard players display numberformat cacard.info4 cacard.Info blank
scoreboard players display numberformat cacard.info5 cacard.Info blank
scoreboard players display numberformat cacard.info6 cacard.Info blank
scoreboard players display numberformat cacard.info7 cacard.Info blank
scoreboard players display numberformat cacard.info8 cacard.Info blank
scoreboard players display numberformat cacard.info9 cacard.Info blank

#运算器
scoreboard players operation #cacard.timeSec cacard.time = #cacard.time cacard.time
scoreboard players operation #cacard.timeSec cacard.time /= #cacard.j cacard.time

scoreboard players operation #cacard.timeMin cacard.time = #cacard.timeSec cacard.time

execute store result storage cacardwar:cardsetinfo min int 1.0 run scoreboard players operation #cacard.timeMin cacard.time /= #cacard.k cacard.time
execute store result storage cacardwar:cardsetinfo sec int 1.0 run scoreboard players operation #cacard.timeSec cacard.time %= #cacard.k cacard.time

#边框
scoreboard players display name cacard.info1 cacard.Info {text:"§7Cacard=================="}
scoreboard players display name cacard.info9 cacard.Info {text:"§7=====================War"}

#分数0空；1~2标准；3~4基础教程；5AI训练模式
#等待玩家
execute if score #cacard.time cacard.isongoing matches 0 if score #cacard.time cacard.players matches 0..1 run scoreboard players display name cacard.info2 cacard.Info {text:"对局模式 : §a§l标准/经典"}
execute if score #cacard.time cacard.isongoing matches 0 if score #cacard.time cacard.players matches 0..1 run scoreboard players display name cacard.info3 cacard.Info {text:"当前阶段 : §e§l等待玩家"}
execute if score #cacard.time cacard.isongoing matches 0 if score #cacard.time cacard.players matches 0..1 run scoreboard players display name cacard.info4 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 0 if score #cacard.time cacard.players matches 0..1 run scoreboard players display name cacard.info5 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 0 if score #cacard.time cacard.players matches 0..1 run scoreboard players display name cacard.info6 cacard.Info [{text:"玩家数 : "},{score:{name:"#cacard.time",objective:"cacard.players"},color:"yellow"},{text:"§e/2"}]
execute if score #cacard.time cacard.isongoing matches 0 if score #cacard.time cacard.players matches 0..1 run scoreboard players display name cacard.info7 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 0 if score #cacard.time cacard.players matches 0..1 run scoreboard players display name cacard.info8 cacard.Info {text:""}

#标准对局进行中
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info2 cacard.Info {text:"对局模式 : §a§l标准/经典"}
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info3 cacard.Info {text:"当前阶段 : §a§l对局进行中"}
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info4 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info5 cacard.Info [{text:"§6§l红方§r: "},{selector:"@a[tag=cacard.redTeam,limit=1]"},{text:"§7 - "},{storage:"cacardwar:cardsetinfo",nbt:"red"}]
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info6 cacard.Info [{text:"§b§l蓝方§r: "},{selector:"@a[tag=cacard.blueTeam,limit=1]"},{text:"§7 - "},{storage:"cacardwar:cardsetinfo",nbt:"blue"}]
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info7 cacard.Info {text:""}

execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 if score #cacard.timeSec cacard.time matches 0..9 run scoreboard players display name cacard.info8 cacard.Info [{text:"对局时间 : "},{storage:"cacardwar:cardsetinfo",nbt:"min",color:"yellow"},{text:"§em-0"},{storage:"cacardwar:cardsetinfo",nbt:"sec",color:"yellow"},{text:"§es"}]
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 if score #cacard.timeSec cacard.time matches 10.. run scoreboard players display name cacard.info8 cacard.Info [{text:"对局时间 : "},{storage:"cacardwar:cardsetinfo",nbt:"min",color:"yellow"},{text:"§em-"},{storage:"cacardwar:cardsetinfo",nbt:"sec",color:"yellow"},{text:"§es"}]

#标准对局中断
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info2 cacard.Info {text:"对局模式 : §a§l标准/经典"}
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info3 cacard.Info {text:"当前阶段 : §c§l对局中断"}

execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 if score #cacard.timeSec cacard.time matches 0..9 run scoreboard players display name cacard.info4 cacard.Info [{text:"中断时间 : "},{storage:"cacardwar:cardsetinfo",nbt:"min",color:"yellow"},{text:"§em-0"},{storage:"cacardwar:cardsetinfo",nbt:"sec",color:"yellow"},{text:"§es"}]
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 if score #cacard.timeSec cacard.time matches 10.. run scoreboard players display name cacard.info4 cacard.Info [{text:"中断时间 : "},{storage:"cacardwar:cardsetinfo",nbt:"min",color:"yellow"},{text:"§em-"},{storage:"cacardwar:cardsetinfo",nbt:"sec",color:"yellow"},{text:"§es"}]

execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info5 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info6 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info7 cacard.Info {text:"§6这通常源于一方玩家现处于离线状态"}
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info8 cacard.Info {text:""}

#标准对局结束
execute if score #cacard.time cacard.isongoing matches 2 run scoreboard players display name cacard.info2 cacard.Info {text:"对局模式 : §a§l标准/经典"}
execute if score #cacard.time cacard.isongoing matches 2 run scoreboard players display name cacard.info3 cacard.Info {text:"当前阶段 : §d§l对局结束"}
execute if score #cacard.time cacard.isongoing matches 2 run scoreboard players display name cacard.info4 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 2 run scoreboard players display name cacard.info5 cacard.Info [{text:"获胜方 : "},{storage:"cacardwar:cardsetinfo",nbt:"winner"},{text:" "},{selector:"@a[tag=cacard.winner,limit=1]",color:"light_purple",bold:true}]

execute if score #cacard.time cacard.isongoing matches 2 if score #cacard.timeSec cacard.time matches 0..9 run scoreboard players display name cacard.info6 cacard.Info [{text:"对局时间 : "},{storage:"cacardwar:cardsetinfo",nbt:"min",color:"yellow"},{text:"§em-0"},{storage:"cacardwar:cardsetinfo",nbt:"sec",color:"yellow"},{text:"§es"}]
execute if score #cacard.time cacard.isongoing matches 2 if score #cacard.timeSec cacard.time matches 10.. run scoreboard players display name cacard.info6 cacard.Info [{text:"对局时间 : "},{storage:"cacardwar:cardsetinfo",nbt:"min",color:"yellow"},{text:"§em-"},{storage:"cacardwar:cardsetinfo",nbt:"sec",color:"yellow"},{text:"§es"}]

execute if score #cacard.time cacard.isongoing matches 2 run scoreboard players display name cacard.info7 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 2 run scoreboard players display name cacard.info8 cacard.Info {text:"§e对局将在10秒后重置"}

#基础教程阶段1：准备
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt1,limit=1] run scoreboard players display name cacard.info2 cacard.Info {text:"对局模式 : §b§l基础教程"}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt1,limit=1] run scoreboard players display name cacard.info3 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt1,limit=1] run scoreboard players display name cacard.info4 cacard.Info {text:"当前阶段 : §a§l准备"}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt1,limit=1] run scoreboard players display name cacard.info5 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt1,limit=1] unless items entity @a[tag=cacard.bt1,limit=1] weapon.mainhand written_book[custom_data={cacardwar:"book"}] run scoreboard players display name cacard.info6 cacard.Info {text:"§f左键点击物品展示框取得信息书"}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt1,limit=1] unless items entity @a[tag=cacard.bt1,limit=1] weapon.mainhand written_book[custom_data={cacardwar:"book"}] run scoreboard players display name cacard.info7 cacard.Info {text:"§7右键打开信息书，阅读规则、选择卡组、准备"}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt1,limit=1] if items entity @a[tag=cacard.bt1,limit=1] weapon.mainhand written_book[custom_data={cacardwar:"book"}] run scoreboard players display name cacard.info6 cacard.Info {text:"§7§m左键点击物品展示框取得信息书"}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt1,limit=1] if items entity @a[tag=cacard.bt1,limit=1] weapon.mainhand written_book[custom_data={cacardwar:"book"}] run scoreboard players display name cacard.info7 cacard.Info {text:"§f右键打开信息书，阅读规则、选择卡组、准备"}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt1,limit=1] run scoreboard players display name cacard.info8 cacard.Info {text:""}

#基础教程阶段2：攻击
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt2,limit=1] run scoreboard players display name cacard.info2 cacard.Info {text:"对局模式 : §b§l基础教程"}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt2,limit=1] run scoreboard players display name cacard.info3 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt2,limit=1] run scoreboard players display name cacard.info4 cacard.Info {text:"当前阶段 : §a§l攻击"}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt2,limit=1] run scoreboard players display name cacard.info5 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt2,limit=1] run scoreboard players display name cacard.info6 cacard.Info {text:"利用卡牌和合成配方，"}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt2,limit=1] run scoreboard players display name cacard.info7 cacard.Info {text:"合成一把钻石剑"}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt2,limit=1] run scoreboard players display name cacard.info8 cacard.Info {text:""}

#基础教程阶段3：回复
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt3,limit=1] run scoreboard players display name cacard.info2 cacard.Info {text:"对局模式 : §b§l基础教程"}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt3,limit=1] run scoreboard players display name cacard.info3 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt3,limit=1] run scoreboard players display name cacard.info4 cacard.Info {text:"当前阶段 : §a§l回复"}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt3,limit=1] run scoreboard players display name cacard.info5 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt3,limit=1] run scoreboard players display name cacard.info6 cacard.Info {text:"利用卡牌和合成配方，"}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt3,limit=1] run scoreboard players display name cacard.info7 cacard.Info {text:"尽可能地回复你的生命值(理论最大值:16/20)"}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt3,limit=1] run scoreboard players display name cacard.info8 cacard.Info {text:""}

#基础教程阶段4：过关
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt4,limit=1] run scoreboard players display name cacard.info2 cacard.Info {text:"对局模式 : §b§l基础教程"}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt4,limit=1] run scoreboard players display name cacard.info3 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt4,limit=1] run scoreboard players display name cacard.info4 cacard.Info {text:"当前阶段 : §7§l补充"}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt4,limit=1] run scoreboard players display name cacard.info5 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt4,limit=1] run scoreboard players display name cacard.info6 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt4,limit=1] run scoreboard players display name cacard.info7 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 3 if entity @a[tag=cacard.bt4,limit=1] run scoreboard players display name cacard.info8 cacard.Info {text:""}

#AI训练
execute if score #cacard.time cacard.isongoing matches 5 if entity @a[tag=cacard.ai,limit=1] run scoreboard players display name cacard.info2 cacard.Info {text:"对局模式 : §b§lAI训练模式"}
execute if score #cacard.time cacard.isongoing matches 5 if entity @a[tag=cacard.ai,limit=1] if score #cacard.aiState cacard.players matches 1 run scoreboard players display name cacard.info3 cacard.Info {text:"当前阶段 : §a§l对局进行中"}
execute if score #cacard.time cacard.isongoing matches 5 if entity @a[tag=cacard.ai,limit=1] if score #cacard.aiState cacard.players matches 2 run scoreboard players display name cacard.info3 cacard.Info {text:"当前阶段 : §d§l对局结束·即将重开"}
execute if score #cacard.time cacard.isongoing matches 5 if entity @a[tag=cacard.ai,limit=1] unless score #cacard.aiState cacard.players matches 1..2 run scoreboard players display name cacard.info3 cacard.Info {text:"当前阶段 : §7§l等待开始"}
execute if score #cacard.time cacard.isongoing matches 5 if entity @a[tag=cacard.ai,limit=1] run scoreboard players display name cacard.info4 cacard.Info [{text:"手牌 : "},{score:{name:"#cacard.aiHandTotal",objective:"cacard.players"},color:"yellow"},{text:"§e 张"}] 
execute if score #cacard.time cacard.isongoing matches 5 if entity @a[tag=cacard.ai,limit=1] run scoreboard players display name cacard.info5 cacard.Info [{text:"§b蓝方血量: "},{score:{name:"#cacard.blueHealth",objective:"cacard.health"},color:"aqua"},{text:"§7 / 20"}] 
execute if score #cacard.time cacard.isongoing matches 5 if entity @a[tag=cacard.ai,limit=1] run scoreboard players display name cacard.info6 cacard.Info [{text:"§6红方血量: "},{score:{name:"#cacard.redHealth",objective:"cacard.health"},color:"gold"},{text:"§7 / 20"}] 
execute if score #cacard.time cacard.isongoing matches 5 if entity @a[tag=cacard.ai,limit=1] run scoreboard players display name cacard.info7 cacard.Info {text:"§7通过动作命令行动（RCON）"}
execute if score #cacard.time cacard.isongoing matches 5 if entity @a[tag=cacard.ai,limit=1] run scoreboard players display name cacard.info8 cacard.Info {text:""}
