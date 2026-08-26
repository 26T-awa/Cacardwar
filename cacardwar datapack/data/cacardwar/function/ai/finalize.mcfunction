# AI 训练模式 - 动作结算：捕获 next_state + 计算奖励 + 写样本
# 先吸收（把合成产物纳入手牌）
function cacardwar:ai/absorb
# 计算行动后的特征向量
function cacardwar:agent/feature_vector/feature_vector {team:blue, oppteam:red}
# ===== 计算奖励（定点 x100）：伤害*100 + 治疗*50 - 步进1 + 胜负±500 =====
# aiDam = 行动前红血 - 当前红血（造成的伤害）
scoreboard players operation #cacard.aiDam cacard.players = #cacard.aiRedH0 cacard.players
scoreboard players operation #cacard.aiDam cacard.players -= #cacard.redHealth cacard.health
# aiHeal = 当前蓝血 - 行动前蓝血（治疗量）
scoreboard players operation #cacard.aiHeal cacard.players = #cacard.blueHealth cacard.health
scoreboard players operation #cacard.aiHeal cacard.players -= #cacard.aiBlueH0 cacard.players
# reward = 伤害*100
scoreboard players operation #cacard.aiReward cacard.players = #cacard.aiDam cacard.players
scoreboard players operation #cacard.aiReward cacard.players *= #100 cacard.players
# reward += 治疗*50
scoreboard players operation #cacard.aiHeal2 cacard.players = #cacard.aiHeal cacard.players
scoreboard players operation #cacard.aiHeal2 cacard.players *= #50 cacard.players
scoreboard players operation #cacard.aiReward cacard.players += #cacard.aiHeal2 cacard.players
# reward -= 1（步进惩罚）
scoreboard players remove #cacard.aiReward cacard.players 1
# 胜负奖励
execute if score #cacard.redHealth cacard.health matches ..0 run scoreboard players add #cacard.aiReward cacard.players 500
execute if score #cacard.blueHealth cacard.health matches ..0 run scoreboard players remove #cacard.aiReward cacard.players 500
# ===== 组装 record_transition 参数 =====
data modify storage cacardwar:ai trans set value {reward:0.0, done:0b}
execute store result storage cacardwar:ai trans.reward double 0.01 run scoreboard players get #cacard.aiReward cacard.players
execute if score #cacard.redHealth cacard.health matches ..0 run data modify storage cacardwar:ai trans.done set value 1b
execute if score #cacard.blueHealth cacard.health matches ..0 run data modify storage cacardwar:ai trans.done set value 1b
function cacardwar:agent/training/record_transition with storage cacardwar:ai trans
# ===== 结算完成 =====
scoreboard players set #cacard.aiResolve cacard.players 0
# ===== 若对局结束则收尾 =====
execute if score #cacard.redHealth cacard.health matches ..0 run function cacardwar:ai/end {team:blue,oppteam:red,text1:"b",text2:"蓝"}
execute if score #cacard.blueHealth cacard.health matches ..0 run function cacardwar:ai/end {team:red,oppteam:blue,text1:"6",text2:"红"}
