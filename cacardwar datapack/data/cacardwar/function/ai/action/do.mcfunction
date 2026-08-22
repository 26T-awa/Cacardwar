# AI 训练模式 - 动作入口
# 用法：/function cacardwar:ai/action/do {action:0~350}
#   RCON：/function cacardwar:ai/action/do {action:123}
# 动作空间：0=跳过(抽5张继续), 1~10=清空槽0~9, 11~350=放置(11+卡*20+槽*2+类型)
# 流程：快照行动前状态 -> record_action -> 执行动作 -> 2 tick 后自动结算样本
# 校验：AI 模式、对局进行中、无待结算动作
execute unless score #cacard.time cacard.isongoing matches 5 run return 0
execute unless score #cacard.aiState cacard.players matches 1 run return 0
execute if score #cacard.aiResolve cacard.players matches 1.. run return 0
# ===== 快照行动前生命值（用于奖励）=====
scoreboard players operation #cacard.aiRedH0 cacard.players = #cacard.redHealth cacard.health
scoreboard players operation #cacard.aiBlueH0 cacard.players = #cacard.blueHealth cacard.health
# ===== 计算行动前特征向量并记录样本 =====
function cacardwar:agent/feature_vector/feature_vector {team:blue, oppteam:red}
$function cacardwar:agent/training/record_action {team:blue, action:$(action)}
# ===== 解码并分发 =====
$scoreboard players set #cacard.aiDecode cacard.players $(action)
execute if score #cacard.aiDecode cacard.players matches 0 run function cacardwar:ai/action/skip
execute if score #cacard.aiDecode cacard.players matches 1..10 run function cacardwar:ai/action/clear
execute if score #cacard.aiDecode cacard.players matches 11..350 run function cacardwar:ai/action/place
