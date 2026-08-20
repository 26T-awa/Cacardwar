# 牌牌大作战 - AI 训练模式：进入（由人类玩家执行）
# 用法：/function cacardwar:ai/setup
# 说明：执行者=蓝方（AI 控制的行动方）；其它在场玩家=红方（AFK 静止对手，请勿操作）
# 手牌模型：潜影盒(-5 -59 -77)发牌 -> 逐格计数到计分板 -> 清空盒子（手牌=纯计分板）

# ===== 进入 AI 模式 =====
scoreboard players set #cacard.time cacard.isongoing 5
scoreboard players set #cacard.aiState cacard.players 0
scoreboard players set #cacard.aiResolve cacard.players 0
scoreboard players set #cacard.aiReward cacard.players 0
data remove storage cacardwar:training pending_sample

# ===== 蓝方（人类执行者）=====
tag @s add cacard.ready
tag @s add cacard.blueTeam
tag @s add cacard.ai
scoreboard players set @s cacard.cardsetype 2
scoreboard players set @s cacard.shieldtype 0
scoreboard players set @s cacard.cardcount 0

# ===== 红方（其它在场玩家 = AFK 静止对手）=====
tag @a[tag=cacard.ingame,tag=!cacard.blueTeam] add cacard.redTeam
tag @a[tag=cacard.ingame,tag=!cacard.blueTeam] add cacard.ready
scoreboard players set @a[tag=cacard.redTeam] cacard.shieldtype 0
scoreboard players set @a[tag=cacard.redTeam] cacard.cardcount 0

# ===== 双方满血 =====
scoreboard players set #cacard.blueHealth cacard.health 20
scoreboard players set #cacard.redHealth cacard.health 20

# ===== 确保潜影盒存在并清空 =====
execute unless block -5 -59 -77 minecraft:shulker_box run setblock -5 -59 -77 minecraft:shulker_box
function cacardwar:ai/clear_shulker

# ===== 清场并开始第一局 =====
function cacardwar:ai/reset_arena
function cacardwar:ai/start
tellraw @a[tag=cacard.ingame] {text:"§b§l[AI训练] §e进入 AI 训练模式，红方请保持静止！",color:"green"}
