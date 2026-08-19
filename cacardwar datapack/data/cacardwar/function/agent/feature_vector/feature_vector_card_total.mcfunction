# 牌牌大作战 - 累加单种卡牌到总卡牌数（宏参数 {team,type}）
# 分母"总计已有卡牌数" = 手牌 + 0槽 + 1~9槽（各计 1）

$function cacardwar:agent/feature_vector/feature_vector_card {team:$(team),type:$(type)}
scoreboard players operation #cacard.agentTotal cacard.players += #cacard.agentH cacard.players
scoreboard players operation #cacard.agentTotal cacard.players += #cacard.agent0 cacard.players
scoreboard players operation #cacard.agentTotal cacard.players += #cacard.agentS cacard.players
