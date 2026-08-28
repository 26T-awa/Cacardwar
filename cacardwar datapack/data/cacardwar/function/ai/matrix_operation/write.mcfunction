scoreboard players operation #cacard.m_Sum1 cacard.players /= #cacard.m_div1 cacard.players
scoreboard players operation #cacard.m_Sum2 cacard.players /= #cacard.m_div1 cacard.players
scoreboard players operation #cacard.m_Sum3 cacard.players /= #cacard.m_div1 cacard.players
scoreboard players operation #cacard.m_Sum cacard.players += #cacard.m_Sum1 cacard.players
scoreboard players operation #cacard.m_Sum cacard.players += #cacard.m_Sum2 cacard.players
execute store result storage cacardwar:agent sum double 0.001 run scoreboard players operation #cacard.m_Sum cacard.players += #cacard.m_Sum3 cacard.players

#tellraw @a ["WRITING!   loop_j=",{storage:"cacardwar:agent",nbt:"loop_j"},"with Sum=",{storage:"cacardwar:agent",nbt:"sum"}]

$data modify storage cacardwar:agent layer2[$(loop_j)] set from storage cacardwar:agent sum
$execute store result score #cacard.m_Sum cacard.point run data get storage cacardwar:agent action_mask[$(loop_j)] 1
$execute if score #cacard.m_Sum cacard.point matches 0 run data modify storage cacardwar:agent layer2[$(loop_j)] set value -999999999d

scoreboard players set #cacard.m_Sum1 cacard.players 0
scoreboard players set #cacard.m_Sum2 cacard.players 0
scoreboard players set #cacard.m_Sum3 cacard.players 0
scoreboard players set #cacard.m_Sum cacard.players 0
