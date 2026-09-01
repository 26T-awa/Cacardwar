# 传入value1/2
## 乘
$data modify storage cacardwar:ai value1 set from storage cacardwar:ai matrix.l[$(loop_i)]
$data modify storage cacardwar:ai value2 set from storage cacardwar:ai matrix.r[$(loop_i)][$(loop_j)]

#tellraw @a ["EXECUTING MULTIPLICATION!   ","loop_i=",{storage:"cacardwar:ai",nbt:"loop_i"}," | loop_j=",{storage:"cacardwar:ai",nbt:"loop_j"},"with value1=",{storage:"cacardwar:ai",nbt:"value1"}," Input2=",{storage:"cacardwar:ai",nbt:"input2"}]
execute store result score #cacard.m_value1 cacard.point run data get storage cacardwar:ai value1 10000
execute store result score #cacard.m_value2 cacard.point run data get storage cacardwar:ai value2 10000

scoreboard players operation #cacard.m_output cacard.point = #cacard.m_value1 cacard.point
execute store result storage cacardwar:ai output double 0.00000001 run scoreboard players operation #cacard.m_output cacard.point *= #cacard.m_value2 cacard.point
scoreboard players operation #cacard.m_output cacard.point /= #10000 cacard.point
#此时storage output 0.xxxx|scoreboard output 0xxxx

## 加
execute if score #cacard.m_sum cacard.point matches 0..2000000000 run scoreboard players operation #cacard.m_sum cacard.point += #cacard.m_output cacard.point
execute unless score #cacard.m_sum cacard.point matches 0..2000000000 run say 累加器溢出！(#cacard.m_sum > 2e9 or < 0)
#execute unless score #cacard.m_sum1 cacard.point matches 0..2000000000 if score #cacard.m_sum2 cacard.point matches 0..2000000000 run scoreboard players operation #cacard.m_sum2 cacard.point += #cacard.m_output cacard.point
#execute unless score #cacard.m_sum1 cacard.point matches 0..2000000000 unless score #cacard.m_sum2 cacard.point matches 0..2000000000 if score #cacard.m_sum3 cacard.point matches 0..2000000000 run scoreboard players operation #cacard.m_sum3 cacard.point += #cacard.m_output cacard.point
#tellraw @a ["now Sum1=",{score:{name:"#cacard.m_sum1",objective:cacard.point}}," Sum2=",{score:{name:"#cacard.m_sum2",objective:cacard.point}}," Sum3=",{score:{name:"#cacard.m_sum3",objective:cacard.point}}]