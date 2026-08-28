# 传入参数:X、Y
$scoreboard players set #cacard.m_Loop1UP cacard.players $(X)
scoreboard players set #cacard.m_Loop1NOW cacard.players 0
$scoreboard players set #cacard.m_Loop2UP cacard.players $(Y)
scoreboard players set #cacard.m_Loop2NOW cacard.players 0

data modify storage cacardwar:agent loop_i set value 0i
data modify storage cacardwar:agent loop_j set value 0i
data modify storage cacardwar:agent input1 set value 0d
data modify storage cacardwar:agent input2 set value 0d
data modify storage cacardwar:agent output set value 0d
data modify storage cacardwar:agent sum set value 0d
scoreboard players set #cacard.m_Input1 cacard.players 0
scoreboard players set #cacard.m_Input2 cacard.players 0
scoreboard players set #cacard.m_Output cacard.players 0
scoreboard players set #cacard.m_Sum1 cacard.players 0
scoreboard players set #cacard.m_Sum2 cacard.players 0
scoreboard players set #cacard.m_Sum3 cacard.players 0
scoreboard players set #cacard.m_Sum cacard.players 0

# 进入循环：计算一个j∈Y的元素
function cacardwar:agent/matrix_operation/loop
