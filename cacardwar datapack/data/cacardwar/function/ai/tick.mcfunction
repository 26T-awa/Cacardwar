# AI 训练模式 - 每 tick 主逻辑（由 main/execute 在 isongoing=5 时调用）
# 1) 吸收背包卡牌
function cacardwar:ai/absorb
# 2) 合成/道具自动结算（蓝方槽位）
function cacardwar:item_detect/_entry
# 3) 动作结算倒计时：到 0 时捕获 next_state + 写样本
execute if score #cacard.aiResolve cacard.players matches 1 run function cacardwar:ai/finalize
execute if score #cacard.aiResolve cacard.players matches 2.. run scoreboard players remove #cacard.aiResolve cacard.players 1
# 4) 胜负检查（安全网，finalize 已处理）
execute if score #cacard.aiState cacard.players matches 1 if score #cacard.redHealth cacard.health matches ..0 run function cacardwar:ai/end {team:blue,oppteam:red}
execute if score #cacard.aiState cacard.players matches 1 if score #cacard.blueHealth cacard.health matches ..0 run function cacardwar:ai/end {team:red,oppteam:blue}
# 5) 更新手牌合计（供信息栏显示）
function cacardwar:ai/hand_total
