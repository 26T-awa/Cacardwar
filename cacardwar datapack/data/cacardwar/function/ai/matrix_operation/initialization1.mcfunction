#function cacardwar:ai/matrix_operation/initialization1 {X:x,Y:y}
#X,Y表示A(1xX) x B(XxY) = C(1xY)
#最终将在cacardwar:ai output找到矩阵(1xY)

#计算1. 特征向量O(1x81) x model.weights1(81x64) = A(1x64)
#计算2. A(1x64) + model.biases1(1x64) = B(1x64)
#计算3. B(1x64) x model.weights2(64x181) = C(1x181)
#计算4. C(1x181) + model.biases2(1x181) = D(1x181)
#计算5. D(1x181) Δ 动作掩码M(1x181) = Q(1x181)
#计算6. max{Q(1x181)} = 动作码K

#cacardwar:ai loop_i loop_j 循环计数
#cacardwar:ai value1 value2 传入数值
#cacardwar:ai sum 累加和
#cacardwar:ai output 传出数值
#cacardwar:ai matrix.l matrix.r 传入左右矩阵
#cacardwar:ai matrix.o 输出矩阵
#scoreboard #cacard.m_i #cacard.m_j |cacard.point 循环计数 |cacard.players 循环上限
#scoreboard #cacard.m_value1 #cacard.m_value2 |cacard.point 传入数值
#scoreboard #cacard.m_sum |cacard.point 累加和
#scoreboard #cacard.m_output |cacard.point 传出数值

$scoreboard players set #cacard.m_i cacard.players $(X)
scoreboard players set #cacard.m_i cacard.point 0
$scoreboard players set #cacard.m_j cacard.players $(Y)
scoreboard players set #cacard.m_j cacard.point 0

data modify storage cacardwar:ai loop_i set value 0i
data modify storage cacardwar:ai loop_j set value 0i
data modify storage cacardwar:ai value1 set value 0d
data modify storage cacardwar:ai value2 set value 0d
data modify storage cacardwar:ai output set value 0d
data modify storage cacardwar:ai sum set value 0d
scoreboard players set #cacard.m_value1 cacard.point 0
scoreboard players set #cacard.m_value2 cacard.point 0
scoreboard players set #cacard.m_output cacard.point 0
#scoreboard players set #cacard.m_sum1 cacard.point 0
#scoreboard players set #cacard.m_sum2 cacard.point 0
#scoreboard players set #cacard.m_sum3 cacard.point 0
scoreboard players set #cacard.m_sum cacard.point 0

# 进入循环：计算一个j∈Y的元素
function cacardwar:ai/matrix_operation/loop1
