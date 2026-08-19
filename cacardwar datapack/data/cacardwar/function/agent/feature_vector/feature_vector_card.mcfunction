# 牌牌大作战 - 统计单种卡牌的分布（宏参数 {team,type}）
# 输出到临时 fake player：#cacard.agentH(手牌) / agent0(0槽) / agentS(1~9槽)

# ===== 清零 =====
scoreboard players set #cacard.agentH cacard.players 0
scoreboard players set #cacard.agent0 cacard.players 0
scoreboard players set #cacard.agentS cacard.players 0

# ===== 手牌 H（clear count=0 只统计不清除；按物品 ID） =====
$execute store result score #cacard.agentH cacard.players run clear @a[tag=cacard.$(team)Team,limit=1] *[custom_data~{cacardwar:["$(type)"]}] 0

# ===== 0 槽（0 或 1） =====
$execute if items entity @e[tag=cacard.$(team)0] contents *[custom_data~{cacardwar:["$(type)"]}] run scoreboard players set #cacard.agent0 cacard.players 1

# ===== 1~9 槽累加 S =====
$execute if items entity @e[tag=cacard.$(team)1] contents *[custom_data~{cacardwar:["$(type)"]}] run scoreboard players add #cacard.agentS cacard.players 1
$execute if items entity @e[tag=cacard.$(team)2] contents *[custom_data~{cacardwar:["$(type)"]}] run scoreboard players add #cacard.agentS cacard.players 1
$execute if items entity @e[tag=cacard.$(team)3] contents *[custom_data~{cacardwar:["$(type)"]}] run scoreboard players add #cacard.agentS cacard.players 1
$execute if items entity @e[tag=cacard.$(team)4] contents *[custom_data~{cacardwar:["$(type)"]}] run scoreboard players add #cacard.agentS cacard.players 1
$execute if items entity @e[tag=cacard.$(team)5] contents *[custom_data~{cacardwar:["$(type)"]}] run scoreboard players add #cacard.agentS cacard.players 1
$execute if items entity @e[tag=cacard.$(team)6] contents *[custom_data~{cacardwar:["$(type)"]}] run scoreboard players add #cacard.agentS cacard.players 1
$execute if items entity @e[tag=cacard.$(team)7] contents *[custom_data~{cacardwar:["$(type)"]}] run scoreboard players add #cacard.agentS cacard.players 1
$execute if items entity @e[tag=cacard.$(team)8] contents *[custom_data~{cacardwar:["$(type)"]}] run scoreboard players add #cacard.agentS cacard.players 1
$execute if items entity @e[tag=cacard.$(team)9] contents *[custom_data~{cacardwar:["$(type)"]}] run scoreboard players add #cacard.agentS cacard.players 1
