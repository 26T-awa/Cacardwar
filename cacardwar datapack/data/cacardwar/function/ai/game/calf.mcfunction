##计算5. D(1x181) Δ 动作掩码M(1x181) = Q(1x181)
#计算6. max{Q(1x181)} = 动作码K

$execute store result score #cacard.m_sum cacard.point run data get storage cacardwar:ai action_mask[$(loop_j)] 1
$execute if score #cacard.m_sum cacard.point matches 0 run data modify storage cacardwar:ai layer2[$(loop_j)] set value -999999999d
