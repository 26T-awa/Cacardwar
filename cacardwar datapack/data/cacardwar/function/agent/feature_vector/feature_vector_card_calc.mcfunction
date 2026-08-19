# 牌牌大作战 - 计算单种卡牌归一化特征（宏参数 {team,type,dimIndex}）
# 特征 = (手牌H + 0槽 + 1~9槽S*0.5) / 总卡牌数Total
# 用整数放大技巧实现浮点：num = ((H+0)*BIG + S*BIG/2) / Total，再乘以 0.00001 得到 0~1

$function cacardwar:agent/feature_vector/feature_vector_card {team:$(team),type:$(type)}

# T1 = (H+0) * BIG
scoreboard players operation #cacard.agentT1 cacard.players = #cacard.agentH cacard.players
scoreboard players operation #cacard.agentT1 cacard.players += #cacard.agent0 cacard.players
scoreboard players operation #cacard.agentT1 cacard.players *= #cacard.agentBig cacard.players
# T2 = S * BIG / 2   （即 S * 0.5 * BIG）
scoreboard players operation #cacard.agentT2 cacard.players = #cacard.agentS cacard.players
scoreboard players operation #cacard.agentT2 cacard.players *= #cacard.agentBig cacard.players
scoreboard players operation #cacard.agentT2 cacard.players /= #cacard.agentTwo cacard.players
# Quot = (T1 + T2) / Total
scoreboard players operation #cacard.agentQuot cacard.players = #cacard.agentT1 cacard.players
scoreboard players operation #cacard.agentQuot cacard.players += #cacard.agentT2 cacard.players
execute if score #cacard.agentTotal cacard.players matches 1.. run scoreboard players operation #cacard.agentQuot cacard.players /= #cacard.agentTotal cacard.players
$execute if score #cacard.agentTotal cacard.players matches 1.. run execute store result storage cacardwar:agent layer0[$(dimIndex)] double 0.00001 run scoreboard players get #cacard.agentQuot cacard.players
