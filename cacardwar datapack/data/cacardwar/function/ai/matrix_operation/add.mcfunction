# 传入value1/2
## 加
$data modify storage cacardwar:ai value1 set from storage cacardwar:ai matrix.l[$(loop_i)]
$data modify storage cacardwar:ai value2 set from storage cacardwar:ai matrix.r[$(loop_i)]

#tellraw @a ["EXECUTING ADDICTION!   ","loop_i=",{storage:"cacardwar:ai",nbt:"loop_i"},"with value1=",{storage:"cacardwar:ai",nbt:"value1"}]
execute store result score #cacard.m_value1 cacard.point run data get storage cacardwar:ai value1 10000
execute store result score #cacard.m_value2 cacard.point run data get storage cacardwar:ai value2 10000

scoreboard players operation #cacard.m_output cacard.point = #cacard.m_value1 cacard.point
$execute store result storage cacardwar:ai matrix.o[$(loop_i)] double 0.0001 run scoreboard players operation #cacard.m_output cacard.point += #cacard.m_value2 cacard.point