# 传入value1/2
## 乘
$data modify storage cacardwar:ai value1 set from storage cacardwar:ai matrix.l[$(loop_i)]
$data modify storage cacardwar:ai value2 set from storage cacardwar:ai matrix.r[$(loop_i)][$(loop_j)]

execute store result score #cacard.m_value1 cacard.point run data get storage cacardwar:ai value1 10000
execute store result score #cacard.m_value2 cacard.point run data get storage cacardwar:ai value2 10000
#tellraw @a ["乘 with value1=",{score:{name:"#cacard.m_value1",objective:"cacard.point"}}," value2=",{score:{name:"#cacard.m_value2",objective:"cacard.point"}}]

scoreboard players operation #cacard.m_output cacard.point = #cacard.m_value1 cacard.point
execute store result storage cacardwar:ai output double 0.00000001 run scoreboard players operation #cacard.m_output cacard.point *= #cacard.m_value2 cacard.point
scoreboard players operation #cacard.m_output cacard.point /= #10000 cacard.point
#tellraw @a ["乘 with output score=",{score:{name:"#cacard.m_output",objective:"cacard.point"}}," storage=",{storage:"cacardwar:ai",nbt:"output"},"\n加之前累加器:",{score:{name:"#cacard.m_sum",objective:"cacard.point"}}]
#此时storage output 0.xxxx|scoreboard output 0xxxx

## 加
execute if score #cacard.m_sum cacard.point matches 0..2000000000 run scoreboard players operation #cacard.m_sum cacard.point += #cacard.m_output cacard.point
execute unless score #cacard.m_sum cacard.point matches -2000000000..2000000000 run scoreboard players set #cacard.ai_reward cacard.isongoing 0
execute unless score #cacard.m_sum cacard.point matches -2000000000..2000000000 run tellraw @a ["累加器溢出！(#cacard.m_sum > 2e9 or < -2e9):",{score:{name:"#cacard.m_sum",objective:"cacard.point"}}]