#1.世界规则
gamerule command_block_output false
gamerule reduced_debug_info true

#2.计分板
##2.1评分
scoreboard objectives add cacard.point dummy
scoreboard objectives add cacard.leftcardcount dummy
scoreboard objectives add cacard.showRate trigger
scoreboard players enable @a[tag=cacard.ingame] cacard.showRate
scoreboard players set @a[scores={cacard.showRate=2..}] cacard.showRate 0
##2.2对局相关
scoreboard objectives add cacard.cardcount dummy
scoreboard objectives add cacard.health dummy
scoreboard objectives add cacard.gameSeed dummy
scoreboard objectives add cacard.joinGame custom:leave_game
###2.2.1盾状态0无盾；1仅铁；2仅金；3仅钻石；4铁金；5铁钻；6金钻；7All
scoreboard objectives add cacard.shieldtype dummy
scoreboard players add @a[tag=cacard.ingame] cacard.shieldtype 0
###~2.2.1
scoreboard objectives add cacard.summonleft dummy
scoreboard objectives add cacard.mineral_clump dummy
scoreboard objectives add cacard.time dummy
###2.2.2对局状态0等待玩家；1开始对局；2对局结束
scoreboard objectives add cacard.isongoing dummy
###~2.2.2
scoreboard objectives add cacard.players dummy
execute store result score #cacard.time cacard.players run execute if entity @a[tag=cacard.ready]
scoreboard players add #cacard.time cacard.time 0
scoreboard objectives add cacard.cardsetype dummy
scoreboard players add @a cacard.cardsetype 0
scoreboard objectives add cacard.random dummy
scoreboard objectives add cacard.wincount dummy {text:"§6胜场数"}
scoreboard objectives add cacard.winstrike dummy {text:"§6连胜场数"}
##2.3场地信息
scoreboard objectives add cacard.Info dummy {text:"§b§l牌§6§l牌§r§a大作战  §6信息栏§r"}
scoreboard objectives add cacard.up custom:jump
scoreboard objectives add cacard.down custom:sneak_time

#3.标准设定
##3.1“旷日之战”时间要求
scoreboard players set #cacard.i cacard.time 24000
##3.2时间除数
scoreboard players set #cacard.j cacard.time 20
scoreboard players set #cacard.k cacard.time 60
##3.3生命值
scoreboard players add #cacard.redHealth cacard.health 0
scoreboard players add #cacard.blueHealth cacard.health 0
scoreboard players set #cacard.j cacard.health 0
scoreboard players set #cacard.k cacard.health 20
###3.3.1取半基准数
scoreboard players set #cacard.i cacard.health 2
###~3.3.1
##3.4智能体
scoreboard players set #cacard.agentBig cacard.players 100000
scoreboard players set #cacard.agentTwo cacard.players 2
scoreboard players set #cacard.agentTotal cacard.players 0
scoreboard players set #cacard.m_div4 cacard.players 10000
scoreboard players set #cacard.m_div1 cacard.players 10
###~3.4
##3.5AI训练模式
# 不变常量：每刻 set 无副作用（保持固定值）
scoreboard players set #cacard.aiTwenty cacard.players 20
scoreboard players set #cacard.aiTwo cacard.players 2
scoreboard players set #cacard.aiHundred cacard.players 100
scoreboard players set #cacard.aiFifty cacard.players 50
# 变量：add 0 仅声明不重置（避免每刻被清零/递增）
scoreboard players add #cacard.aiState cacard.players 0
scoreboard players add #cacard.aiResolve cacard.players 0
scoreboard players add #cacard.aiReward cacard.players 0
scoreboard players add #cacard.aiDeck cacard.players 0
scoreboard players add #cacard.aiRedDeck cacard.players 0
scoreboard players add #cacard.aiDecode cacard.players 0
scoreboard players add #cacard.aiCard cacard.players 0
scoreboard players add #cacard.aiSlot cacard.players 0
scoreboard players add #cacard.aiType cacard.players 0
scoreboard players add #cacard.aiN cacard.players 0
scoreboard players add #cacard.aiRem cacard.players 0
scoreboard players add #cacard.aiDam cacard.players 0
scoreboard players add #cacard.aiHeal cacard.players 0
scoreboard players add #cacard.aiHeal2 cacard.players 0
scoreboard players add #cacard.aiRedH0 cacard.players 0
scoreboard players add #cacard.aiBlueH0 cacard.players 0
scoreboard players add #cacard.aiAbsorb cacard.players 0
scoreboard players add #cacard.aiDraw cacard.players 0
scoreboard players add #cacard.aiHandTotal cacard.players 0
###~3.5

#4.队伍和顶栏信息
##4.1队伍
team add CacardwarPlayers
team modify CacardwarPlayers color white
team modify CacardwarPlayers friendlyFire false
team join CacardwarPlayers @a[tag=cacard.ingame]
team leave @a[tag=!cacard.ingame]
scoreboard objectives setdisplay sidebar.team.white cacard.Info
##4.2顶栏
bossbar add cacardwar:bluehealth ""
bossbar add cacardwar:redhealth ""
execute if entity @a[tag=cacard.blueTeam,tag=cacard.ingame] run bossbar set cacardwar:bluehealth name [{text:"§b蓝方生命值:"},{score:{name:"#cacard.blueHealth",objective:cacard.health},color:light_purple}]
execute if entity @a[tag=cacard.redTeam,tag=cacard.ingame] run bossbar set cacardwar:redhealth name [{text:"§6红方生命值:"},{score:{name:"#cacard.redHealth",objective:cacard.health},color:light_purple}]
execute unless score #cacard.time cacard.isongoing matches 3..4 unless entity @a[tag=cacard.blueTeam] run bossbar set cacardwar:bluehealth name [{text:"§e等待玩家…"}]
execute unless entity @a[tag=cacard.redTeam] run bossbar set cacardwar:redhealth name [{text:"§e等待玩家…"}]
bossbar set cacardwar:bluehealth max 20
bossbar set cacardwar:redhealth max 20
bossbar set cacardwar:bluehealth color blue
bossbar set cacardwar:redhealth color red
bossbar set cacardwar:bluehealth style notched_20
bossbar set cacardwar:redhealth style notched_20
bossbar set cacardwar:bluehealth players @a[tag=cacard.ingame]
bossbar set cacardwar:redhealth players @a[tag=cacard.ingame]

#5.入场动画
scoreboard objectives add cacard.newPlayer dummy
scoreboard players add @a cacard.newPlayer 0

#6.基础教程
scoreboard objectives add cacard.basicTuition dummy
scoreboard players add @a[tag=cacard.bt] cacard.basicTuition 0
