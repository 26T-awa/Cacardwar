# 特征向量 1*X
# 参数矩阵 X*Y
# 结果 1*Y
# now X=42 Y=351

execute store result storage cacardwar:agent loop_i int 1 run scoreboard players get #cacard.m_Loop1NOW cacard.players
execute store result storage cacardwar:agent loop_j int 1 run scoreboard players get #cacard.m_Loop2NOW cacard.players

function cacardwar:agent/matrix_operation/multiply_accumulate with storage cacardwar:agent

execute if score #cacard.m_Loop1NOW cacard.players < #cacard.m_Loop1UP cacard.players run scoreboard players add #cacard.m_Loop1NOW cacard.players 1
execute if score #cacard.m_Loop1NOW cacard.players = #cacard.m_Loop1UP cacard.players run scoreboard players add #cacard.m_Loop2NOW cacard.players 1
execute if score #cacard.m_Loop1NOW cacard.players = #cacard.m_Loop1UP cacard.players run function cacardwar:agent/matrix_operation/write with storage cacardwar:agent
execute if score #cacard.m_Loop1NOW cacard.players = #cacard.m_Loop1UP cacard.players run scoreboard players set #cacard.m_Loop1NOW cacard.players 0

execute if score #cacard.m_Loop1NOW cacard.players < #cacard.m_Loop1UP cacard.players if score #cacard.m_Loop2NOW cacard.players < #cacard.m_Loop2UP cacard.players run return run function cacardwar:agent/matrix_operation/loop
