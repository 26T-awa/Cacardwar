#function cacardwar:ai/matrix_operation/initialization2 {X:x}
#X表示A(1xX) + B(1xX) = C(1xX)

$scoreboard players set #cacard.m_i cacard.players $(X)
scoreboard players set #cacard.m_i cacard.point 0

data modify storage cacardwar:ai loop_i set value 0i
data modify storage cacardwar:ai loop_j set value 0i
data modify storage cacardwar:ai value1 set value 0d
data modify storage cacardwar:ai value2 set value 0d
data modify storage cacardwar:ai output set value 0d
data modify storage cacardwar:ai sum set value 0d
scoreboard players set #cacard.m_value1 cacard.point 0
scoreboard players set #cacard.m_value2 cacard.point 0
scoreboard players set #cacard.m_output cacard.point 0
scoreboard players set #cacard.m_sum cacard.point 0

# 进入循环
function cacardwar:ai/matrix_operation/loop2
