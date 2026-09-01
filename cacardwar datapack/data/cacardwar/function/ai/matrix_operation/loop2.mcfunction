#单层循环体

execute store result storage cacardwar:ai loop_i int 1 run scoreboard players get #cacard.m_i cacard.point

function cacardwar:ai/matrix_operation/add with storage cacardwar:ai

execute if score #cacard.m_i cacard.point < #cacard.m_i cacard.players run scoreboard players add #cacard.m_i cacard.point 1

execute if score #cacard.m_i cacard.point < #cacard.m_i cacard.players run function cacardwar:ai/matrix_operation/loop2
