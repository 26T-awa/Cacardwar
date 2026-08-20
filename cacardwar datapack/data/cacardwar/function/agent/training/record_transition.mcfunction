# 牌牌大作战 - 训练样本记录（第 2 步：行动结算后入库）
# 用法：/function cacardwar:agent/training/record_transition {reward:1.0, done:0b}
# 参数：
#   reward - 本次行动获得的奖励（浮点，可正可负，如 -0.5 / 1.0 / 0.3）
#   done   - 是否对局结束：0b=未结束，1b=结束
# 前提：
#   1) 之前调用过 record_action（存在 pending 样本）
#   2) 行动已执行，且已重新运行 feature_vector
#      （storage cacardwar:agent layer0 现在是行动后的新状态）
# 效果：
#   1) 组装 {state, action, reward, next_state, done} 追加到 storage cacardwar:training experience
#   2) 清空待结算样本 pending_sample
#
# 采集器 rcon_collector.py 会通过 RCON 轮询 storage cacardwar:training experience，
# 解析成 JSON 并逐行写入本地 experience.jsonl，供 train_dqn.py 训练。
#
# 完整调用范式（一回合）：
#   function cacardwar:agent/training/record_action
#   ...执行动作 action ...
#   function cacardwar:agent/training/record_transition {done:0b/1b}
# 对局结束的那一步把 done 传 1b，并在下一步调用前复位 pending_sample。
execute unless data storage cacardwar:training pending_sample.pending run return 0
function cacardwar:agent/feature_vector/feature_vector {team:blue, oppteam:red}

# 追加占位样本（state/action/reward/next_state/done 随后逐一填充；-1 引用列表最后一个元素）
data modify storage cacardwar:training experience append value {state:[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],action:0,reward:0.0,next_state:[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],done:0b}
# 填充 state / action（来自待结算样本）、reward / done（宏参数）、next_state（当前新状态）
data modify storage cacardwar:training experience[-1].state set from storage cacardwar:training pending_sample.state
data modify storage cacardwar:training experience[-1].action set from storage cacardwar:training pending_sample.action
data modify storage cacardwar:training experience[-1].reward set from storage cacardwar:training pending_sample.reward
data modify storage cacardwar:training experience[-1].next_state set from storage cacardwar:agent layer0
$data modify storage cacardwar:training experience[-1].done set value $(done)b
# 清空待结算样本
data remove storage cacardwar:training pending_sample
