# 牌牌大作战 - 训练样本记录（第 1 步：行动前快照）
# 用法：/function cacardwar:agent/training/record_action
# 参数：
#   team   - 当前行动方（blue / red），仅用于调试定位，不影响样本字段
#   action - 智能体本次选择的动作编号（0~350，约定：0=跳过，1~10=清空槽0~9，
#            11~350=放置动作：11 + 卡牌*20 + 槽位*2 + 类型(0加牌/1改牌)）
# 效果：
#   1) 把此刻的 42 维特征向量 storage cacardwar:agent layer0 快照为待结算样本的 state
#   2) 记录 action 与 team
#   3) 标记 pending=1b（有未结算样本）
#
# 调用时机：必须在“行动尚未执行、layer0 仍为行动前状态”时调用。
# 之后执行该行动，再调用 record_transition 完成入库。
function cacardwar:agent/feature_vector/feature_vector {team:blue, oppteam:red}

data modify storage cacardwar:training pending_sample.state set from storage cacardwar:agent layer0
data modify storage cacardwar:training pending_sample.pending set value 1b
