# 传入input1/2
# 乘
$data modify storage cacardwar:agent input1 set from storage cacardwar:agent layer0[$(loop_i)]
$data modify storage cacardwar:agent input2 set from storage cacardwar:agent layer1[$(loop_i)][$(loop_j)]

#tellraw @a ["EXECUTING MULTIPLICATION!   ","loop_i=",{storage:"cacardwar:agent",nbt:"loop_i"}," | loop_j=",{storage:"cacardwar:agent",nbt:"loop_j"},"with Input1=",{storage:"cacardwar:agent",nbt:"input1"}," Input2=",{storage:"cacardwar:agent",nbt:"input2"}]

execute store result score #cacard.m_Input1 cacard.players run data get storage cacardwar:agent input1 10000
execute store result score #cacard.m_Input2 cacard.players run data get storage cacardwar:agent input2 10000

scoreboard players operation #cacard.m_Output cacard.players = #cacard.m_Input1 cacard.players
execute store result storage cacardwar:agent output double 0.00000001 run scoreboard players operation #cacard.m_Output cacard.players *= #cacard.m_Input2 cacard.players
scoreboard players operation #cacard.m_Output cacard.players /= #cacard.m_div4 cacard.players

# 加
execute if score #cacard.m_Sum1 cacard.players matches 0..2000000000 run scoreboard players operation #cacard.m_Sum1 cacard.players += #cacard.m_Output cacard.players
execute unless score #cacard.m_Sum1 cacard.players matches 0..2000000000 if score #cacard.m_Sum2 cacard.players matches 0..2000000000 run scoreboard players operation #cacard.m_Sum2 cacard.players += #cacard.m_Output cacard.players
execute unless score #cacard.m_Sum1 cacard.players matches 0..2000000000 unless score #cacard.m_Sum2 cacard.players matches 0..2000000000 if score #cacard.m_Sum3 cacard.players matches 0..2000000000 run scoreboard players operation #cacard.m_Sum3 cacard.players += #cacard.m_Output cacard.players
#tellraw @a ["now Sum1=",{score:{name:"#cacard.m_Sum1",objective:cacard.players}}," Sum2=",{score:{name:"#cacard.m_Sum2",objective:cacard.players}}," Sum3=",{score:{name:"#cacard.m_Sum3",objective:cacard.players}}]