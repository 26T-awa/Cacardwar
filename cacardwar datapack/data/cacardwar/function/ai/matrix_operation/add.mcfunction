# 传入value1/2
## 加
$data modify storage cacardwar:ai value1 set from storage cacardwar:ai matrix.l[$(loop_i)]
$data modify storage cacardwar:ai value2 set from storage cacardwar:ai matrix.r[$(loop_i)]

execute store result score #cacard.m_value1 cacard.point run data get storage cacardwar:ai value1 10000
execute store result score #cacard.m_value2 cacard.point run data get storage cacardwar:ai value2 10000
#tellraw @a ["加 with value1=",{score:{name:"#cacard.m_value1",objective:"cacard.point"}}," value2=",{score:{name:"#cacard.m_value2",objective:"cacard.point"}}]

scoreboard players operation #cacard.m_output cacard.point = #cacard.m_value1 cacard.point
execute unless score #cacard.m_sum cacard.point matches -2000000000..2000000000 run scoreboard players set #cacard.ai_reward cacard.isongoing 0
execute unless score #cacard.m_sum cacard.point matches -2000000000..2000000000 run tellraw @a ["累加器溢出！(#cacard.m_sum > 2e9 or < -2e9):",{score:{name:"#cacard.m_sum",objective:"cacard.point"}}]

$execute store result storage cacardwar:ai matrix.o[$(loop_i)] double 0.0001 run scoreboard players operation #cacard.m_output cacard.point += #cacard.m_value2 cacard.point
#tellraw @a ["加 with output score=",{score:{name:"#cacard.m_output",objective:"cacard.point"}}]