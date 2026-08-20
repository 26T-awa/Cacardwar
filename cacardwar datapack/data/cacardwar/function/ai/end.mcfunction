# AI 训练模式 - 对局结束（防重入）
execute unless score #cacard.aiState cacard.players matches 1 run return 0
scoreboard players set #cacard.aiState cacard.players 2
$title @a[tag=cacard.ingame] title {text:"§$(text1)§l$(text2)方§r §e获胜！"}
scoreboard players set #cacard.aiResolve cacard.players 0
# 8 秒后自动开始下一局（对手卡组会随机轮换）
schedule function cacardwar:ai/start 8s
