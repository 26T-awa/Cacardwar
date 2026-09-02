#双层循环体

execute store result storage cacardwar:ai loop_i int 1 run scoreboard players get #cacard.m_i cacard.point
execute store result storage cacardwar:ai loop_j int 1 run scoreboard players get #cacard.m_j cacard.point

tellraw @a [{storage:"cacardwar:ai",nbt:"loop_i"},"|",{storage:"cacardwar:ai",nbt:"loop_j"}]
function cacardwar:ai/matrix_operation/multiply_accumulate with storage cacardwar:ai

execute if score #cacard.m_i cacard.point < #cacard.m_i cacard.players run scoreboard players add #cacard.m_i cacard.point 1
execute if score #cacard.m_i cacard.point = #cacard.m_i cacard.players run scoreboard players add #cacard.m_j cacard.point 1
execute if score #cacard.m_i cacard.point = #cacard.m_i cacard.players run function cacardwar:ai/matrix_operation/write with storage cacardwar:ai
execute if score #cacard.m_i cacard.point >= #cacard.m_i cacard.players run scoreboard players set #cacard.m_i cacard.point 0

execute if score #cacard.m_i cacard.point < #cacard.m_i cacard.players if score #cacard.m_j cacard.point < #cacard.m_j cacard.players run function cacardwar:ai/matrix_operation/loop1
