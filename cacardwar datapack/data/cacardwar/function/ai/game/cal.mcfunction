#计算1. 特征向量O(1x81) x model.weights1(81x64) = A(1x64)
function cacardwar:ai/game/flattening
data modify storage cacardwar:ai matrix.r set from storage cacardwar:ai model.weights1
function cacardwar:ai/matrix_operation/initialization1 {X:81,Y:64}

#计算2. A(1x64) + model.biases1(1x64) = B(1x64)
data modify storage cacardwar:ai matrix.l set from storage cacardwar:ai matrix.o
data modify storage cacardwar:ai matrix.r set from storage cacardwar:ai model.biases1
function cacardwar:ai/matrix_operation/initialization2 {X:64}

#计算3. B(1x64) x model.weights2(64x181) = C(1x181)
data modify storage cacardwar:ai matrix.l set from storage cacardwar:ai matrix.o
data modify storage cacardwar:ai matrix.r set from storage cacardwar:ai model.weights2
function cacardwar:ai/matrix_operation/initialization1 {X:64,Y:181}

#计算4. C(1x181) + model.biases2(1x181) = D(1x181)
data modify storage cacardwar:ai matrix.l set from storage cacardwar:ai matrix.o
data modify storage cacardwar:ai matrix.r set from storage cacardwar:ai model.biases2
function cacardwar:ai/matrix_operation/initialization2 {X:181}

#计算5. D(1x181) Δ 动作掩码M(1x181) = Q(1x181)

#计算6. max{Q(1x181)} = 动作码K
