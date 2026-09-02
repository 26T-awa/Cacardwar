#function cacardwar:ai/game/cal
scoreboard players set #cacard.ai_reward cacard.isongoing 1
#计算1. 特征向量O(1x81) x model.weights1(81x64) = A(1x64)
function cacardwar:ai/game/flattening
data modify storage cacardwar:ai matrix.r set from storage cacardwar:ai model.weights1
function cacardwar:ai/matrix_operation/initialization1 {X:81,Y:64}

#tellraw @a [{storage:"cacardwar:ai",nbt:"matrix.o"}]

execute if score #cacard.ai_reward cacard.isongoing matches 0 run return run tellraw @a "由于计算1中途发生错误而停止计算！"
#计算2. A(1x64) + model.biases1(1x64) = B(1x64)
data modify storage cacardwar:ai matrix.l set from storage cacardwar:ai matrix.o
data modify storage cacardwar:ai matrix.r set from storage cacardwar:ai model.biases1
function cacardwar:ai/matrix_operation/initialization2 {X:64}

#tellraw @a [{storage:"cacardwar:ai",nbt:"matrix.o"}]

execute if score #cacard.ai_reward cacard.isongoing matches 0 run return run tellraw @a "由于计算2中途发生错误而停止计算！"
#计算3. B(1x64) x model.weights2(64x181) = C(1x181)
data modify storage cacardwar:ai matrix.l set from storage cacardwar:ai matrix.o
data modify storage cacardwar:ai matrix.r set from storage cacardwar:ai model.weights2
function cacardwar:ai/matrix_operation/initialization1 {X:64,Y:181}

#tellraw @a [{storage:"cacardwar:ai",nbt:"matrix.o"}]

execute if score #cacard.ai_reward cacard.isongoing matches 0 run return run tellraw @a "由于计算3中途发生错误而停止计算！"
#计算4. C(1x181) + model.biases2(1x181) = D(1x181)
data modify storage cacardwar:ai matrix.l set from storage cacardwar:ai matrix.o
data modify storage cacardwar:ai matrix.r set from storage cacardwar:ai model.biases2
function cacardwar:ai/matrix_operation/initialization2 {X:181}

#tellraw @a [{storage:"cacardwar:ai",nbt:"matrix.o"}]

execute if score #cacard.ai_reward cacard.isongoing matches 0 run return run tellraw @a "由于计算4中途发生错误而停止计算！"
#计算5. D(1x181) Δ 动作掩码M(1x181) = Q(1x181)
#计算6. max{Q(1x181)} = 动作码K
scoreboard players set #cacard.ai_action_mask cacard.time -999999999
function cacardwar:ai/game/action_mask
function cacardwar:main/others/loop_entry {min:0,max:181,bias:0,command:'function cacardwar:ai/game/loop/func3 with storage cacardwar:loop'}

#输出
tellraw @a ["After computing, the result implies the best action with key: ",{storage:"cacardwar:ai",nbt:"action.key"}," and value: ",{storage:"cacardwar:ai",nbt:"action.value"}]