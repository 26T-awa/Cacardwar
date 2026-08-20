# 牌牌大作战 - AI 训练模式：退出
scoreboard players set #cacard.time cacard.isongoing 0
scoreboard players set #cacard.aiState cacard.players 0
scoreboard players set #cacard.aiResolve cacard.players 0
scoreboard players set #cacard.aiReward cacard.players 0
data remove storage cacardwar:training pending_sample
function cacardwar:ai/reset_arena
function cacardwar:ai/hand_reset
scoreboard players set #cacard.blueHealth cacard.health 20
scoreboard players set #cacard.redHealth cacard.health 20
tellraw @a[tag=cacard.ingame] {text:"§b§l[AI训练] §e已退出 AI 训练模式。",color:"green"}
