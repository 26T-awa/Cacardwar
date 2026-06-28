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
scoreboard players display name cacard.info1 cacard.Info {text:"\u00a77Cacard=================="}
scoreboard players display name cacard.info9 cacard.Info {text:"\u00a77=====================War"}

#等待玩家
execute if score #cacard.time cacard.isongoing matches 0 if score #cacard.time cacard.players matches 0..1 run scoreboard players display name cacard.info2 cacard.Info {text:"对局模式 : \u00a7a\u00a7l标准/经典",strikethrough:true}
execute if score #cacard.time cacard.isongoing matches 0 if score #cacard.time cacard.players matches 0..1 run scoreboard players display name cacard.info3 cacard.Info {text:"当前阶段 : \u00a7e\u00a7l等待玩家"}
execute if score #cacard.time cacard.isongoing matches 0 if score #cacard.time cacard.players matches 0..1 run scoreboard players display name cacard.info4 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 0 if score #cacard.time cacard.players matches 0..1 run scoreboard players display name cacard.info5 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 0 if score #cacard.time cacard.players matches 0..1 run scoreboard players display name cacard.info6 cacard.Info [{text:"玩家数 : "},{score:{name:"#cacard.time",objective:"cacard.players"},color:"yellow"},{text:"\u00a7e/2"}]
execute if score #cacard.time cacard.isongoing matches 0 if score #cacard.time cacard.players matches 0..1 run scoreboard players display name cacard.info7 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 0 if score #cacard.time cacard.players matches 0..1 run scoreboard players display name cacard.info8 cacard.Info {text:""}

#对局进行中
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info2 cacard.Info {text:"对局模式 : \u00a7a\u00a7l标准/经典",strikethrough:true}
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info3 cacard.Info {text:"当前阶段 : \u00a7a\u00a7l对局进行中"}
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info4 cacard.Info {text:"\u00a7f\u00a7l选手"}
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info5 cacard.Info [{text:"\u00a76红方:\u00a7r "},{selector:"@a[tag=cacard.redTeam,limit=1]"},{text:"\u00a77 - "},{storage:"cacardwar:cardsetinfo",nbt:"red"}]
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info6 cacard.Info [{text:"\u00a7b蓝方:\u00a7r "},{selector:"@a[tag=cacard.blueTeam,limit=1]"},{text:"\u00a77 - "},{storage:"cacardwar:cardsetinfo",nbt:"blue"}]
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info7 cacard.Info {text:""}

execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 if score #cacard.timeSec cacard.time matches 0..9 run scoreboard players display name cacard.info8 cacard.Info [{text:"对局时间 : "},{storage:"cacardwar:cardsetinfo",nbt:"min",color:"yellow"},{text:"\u00a7em-0"},{storage:"cacardwar:cardsetinfo",nbt:"sec",color:"yellow"},{text:"\u00a7es"}]
execute if score #cacard.time cacard.isongoing matches 1 if score #cacard.time cacard.players matches 2 if score #cacard.timeSec cacard.time matches 10.. run scoreboard players display name cacard.info8 cacard.Info [{text:"对局时间 : "},{storage:"cacardwar:cardsetinfo",nbt:"min",color:"yellow"},{text:"\u00a7em-"},{storage:"cacardwar:cardsetinfo",nbt:"sec",color:"yellow"},{text:"\u00a7es"}]

#对局中断
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info2 cacard.Info {text:"对局模式 : \u00a7a\u00a7l标准/经典",strikethrough:true}
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info3 cacard.Info {text:"当前阶段 : \u00a7c\u00a7l对局中断"}

execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 if score #cacard.timeSec cacard.time matches 0..9 run scoreboard players display name cacard.info4 cacard.Info [{text:"中断时间 : "},{storage:"cacardwar:cardsetinfo",nbt:"min",color:"yellow"},{text:"\u00a7em-0"},{storage:"cacardwar:cardsetinfo",nbt:"sec",color:"yellow"},{text:"\u00a7es"}]
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 if score #cacard.timeSec cacard.time matches 10.. run scoreboard players display name cacard.info4 cacard.Info [{text:"中断时间 : "},{storage:"cacardwar:cardsetinfo",nbt:"min",color:"yellow"},{text:"\u00a7em-"},{storage:"cacardwar:cardsetinfo",nbt:"sec",color:"yellow"},{text:"\u00a7es"}]

execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info5 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info6 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info7 cacard.Info {text:"\u00a76这通常源于一方玩家现处于离线状态"}
execute if score #cacard.time cacard.isongoing matches 1 unless score #cacard.time cacard.players matches 2 run scoreboard players display name cacard.info8 cacard.Info {text:""}

#对局结束
execute if score #cacard.time cacard.isongoing matches 2 run scoreboard players display name cacard.info2 cacard.Info {text:"对局模式 : \u00a7a\u00a7l标准/经典",strikethrough:true}
execute if score #cacard.time cacard.isongoing matches 2 run scoreboard players display name cacard.info3 cacard.Info {text:"当前阶段 : \u00a7d\u00a7l对局结束"}
execute if score #cacard.time cacard.isongoing matches 2 run scoreboard players display name cacard.info4 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 2 run scoreboard players display name cacard.info5 cacard.Info [{text:"获胜方 : "},{storage:"cacardwar:cardsetinfo",nbt:"winner"},{text:" "},{selector:"@a[tag=cacard.winner,limit=1]",color:"light_purple",bold:true,underlined:true}]

execute if score #cacard.time cacard.isongoing matches 2 if score #cacard.timeSec cacard.time matches 0..9 run scoreboard players display name cacard.info6 cacard.Info [{text:"对局时间 : "},{storage:"cacardwar:cardsetinfo",nbt:"min",color:"yellow"},{text:"\u00a7em-0"},{storage:"cacardwar:cardsetinfo",nbt:"sec",color:"yellow"},{text:"\u00a7es"}]
execute if score #cacard.time cacard.isongoing matches 2 if score #cacard.timeSec cacard.time matches 10.. run scoreboard players display name cacard.info6 cacard.Info [{text:"对局时间 : "},{storage:"cacardwar:cardsetinfo",nbt:"min",color:"yellow"},{text:"\u00a7em-"},{storage:"cacardwar:cardsetinfo",nbt:"sec",color:"yellow"},{text:"\u00a7es"}]

execute if score #cacard.time cacard.isongoing matches 2 run scoreboard players display name cacard.info7 cacard.Info {text:""}
execute if score #cacard.time cacard.isongoing matches 2 run scoreboard players display name cacard.info8 cacard.Info {text:"\u00a7e对局将在10秒后重置"}