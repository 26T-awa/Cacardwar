# AI 训练模式 - 开始一局（含自动重开）
scoreboard players set #cacard.aiState cacard.players 1
scoreboard players set #cacard.aiResolve cacard.players 0
data remove storage cacardwar:training pending_sample
# ===== 清场 / 满血 / 手牌清零 =====
function cacardwar:ai/reset_arena
scoreboard players set #cacard.blueHealth cacard.health 20
scoreboard players set #cacard.redHealth cacard.health 20
function cacardwar:ai/hand_reset
# ===== 随机红方卡组（静止对手，仅名义轮换）=====
execute store result score #cacard.aiRedDeck cacard.players run random value 1..4
scoreboard players operation @a[tag=cacard.redTeam] cacard.cardsetype = #cacard.aiRedDeck cacard.players
# ===== 蓝方卡组（人类在 info 书里选的 cardsetype）=====
execute if score @a[tag=cacard.blueTeam,limit=1] cacard.cardsetype matches ..0 run scoreboard players set #cacard.aiDeck cacard.players 2
# ===== 蓝方先手，发初始 4 张 =====
scoreboard players set @a[tag=cacard.blueTeam,limit=1] cacard.cardcount 4
function cacardwar:ai/draw
# ===== 提示 =====
title @a[tag=cacard.ingame] title {text:"§7- - -§b§lAI训练对局开始§r§7- - -"}
title @a[tag=cacard.ingame] subtitle {text:"§e请通过动作命令行动"}
