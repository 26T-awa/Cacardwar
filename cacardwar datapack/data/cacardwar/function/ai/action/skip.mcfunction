# AI 训练模式 - 动作 0：跳过 = 抽 5 张，继续行动（无真正等待）
scoreboard players set #cacard.aiDraw cacard.players 5
function cacardwar:ai/draw
# 跳过无需合成结算：立即捕获 next_state 并写样本

schedule function cacardwar:ai/finalize 2t
