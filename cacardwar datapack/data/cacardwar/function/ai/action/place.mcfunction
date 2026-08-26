# AI 训练模式 - 动作 11~350：放置（解码 card/slot/type 并分发）
# N = action-11；card = N/20；rem = N%20；slot = rem/2；type = rem%2（0=加牌 1=改牌）
scoreboard players operation #cacard.aiN cacard.players = #cacard.aiDecode cacard.players
scoreboard players remove #cacard.aiN cacard.players 11
scoreboard players operation #cacard.aiCard cacard.players = #cacard.aiN cacard.players
scoreboard players operation #cacard.aiCard cacard.players /= #20 cacard.players
scoreboard players operation #cacard.aiRem cacard.players = #cacard.aiN cacard.players
scoreboard players operation #cacard.aiRem cacard.players %= #20 cacard.players
scoreboard players operation #cacard.aiSlot cacard.players = #cacard.aiRem cacard.players
scoreboard players operation #cacard.aiSlot cacard.players /= #2 cacard.players
scoreboard players operation #cacard.aiType cacard.players = #cacard.aiRem cacard.players
scoreboard players operation #cacard.aiType cacard.players %= #2 cacard.players
# ===== 写入宏参数 storage =====
data modify storage cacardwar:ai args set value {slot:0,type:0}
execute store result storage cacardwar:ai args.slot int 1 run scoreboard players get #cacard.aiSlot cacard.players
execute store result storage cacardwar:ai args.type int 1 run scoreboard players get #cacard.aiType cacard.players
# ===== 分发到卡函数 =====
execute if score #cacard.aiCard cacard.players matches 0 run function cacardwar:ai/action/card/card_0 with storage cacardwar:ai args
execute if score #cacard.aiCard cacard.players matches 1 run function cacardwar:ai/action/card/card_1 with storage cacardwar:ai args
execute if score #cacard.aiCard cacard.players matches 2 run function cacardwar:ai/action/card/card_2 with storage cacardwar:ai args
execute if score #cacard.aiCard cacard.players matches 3 run function cacardwar:ai/action/card/card_3 with storage cacardwar:ai args
execute if score #cacard.aiCard cacard.players matches 4 run function cacardwar:ai/action/card/card_4 with storage cacardwar:ai args
execute if score #cacard.aiCard cacard.players matches 5 run function cacardwar:ai/action/card/card_5 with storage cacardwar:ai args
execute if score #cacard.aiCard cacard.players matches 6 run function cacardwar:ai/action/card/card_6 with storage cacardwar:ai args
execute if score #cacard.aiCard cacard.players matches 7 run function cacardwar:ai/action/card/card_7 with storage cacardwar:ai args
execute if score #cacard.aiCard cacard.players matches 8 run function cacardwar:ai/action/card/card_8 with storage cacardwar:ai args
execute if score #cacard.aiCard cacard.players matches 9 run function cacardwar:ai/action/card/card_9 with storage cacardwar:ai args
execute if score #cacard.aiCard cacard.players matches 10 run function cacardwar:ai/action/card/card_10 with storage cacardwar:ai args
execute if score #cacard.aiCard cacard.players matches 11 run function cacardwar:ai/action/card/card_11 with storage cacardwar:ai args
execute if score #cacard.aiCard cacard.players matches 12 run function cacardwar:ai/action/card/card_12 with storage cacardwar:ai args
execute if score #cacard.aiCard cacard.players matches 13 run function cacardwar:ai/action/card/card_13 with storage cacardwar:ai args
execute if score #cacard.aiCard cacard.players matches 14 run function cacardwar:ai/action/card/card_14 with storage cacardwar:ai args
execute if score #cacard.aiCard cacard.players matches 15 run function cacardwar:ai/action/card/card_15 with storage cacardwar:ai args
execute if score #cacard.aiCard cacard.players matches 16 run function cacardwar:ai/action/card/card_16 with storage cacardwar:ai args
# ===== 标记待结算 =====
scoreboard players set #cacard.aiResolve cacard.players 2
