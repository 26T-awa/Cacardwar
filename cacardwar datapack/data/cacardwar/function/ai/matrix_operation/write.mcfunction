#scoreboard players operation #cacard.m_sum2 cacard.point /= #10 cacard.point
#scoreboard players operation #cacard.m_sum3 cacard.point /= #10 cacard.point
$execute store result storage cacardwar:ai matrix.o[$(loop_j)] double 0.0001 run scoreboard players get #cacard.m_sum cacard.point

#scoreboard players operation #cacard.m_sum cacard.point += #cacard.m_sum1 cacard.point
#scoreboard players operation #cacard.m_sum cacard.point += #cacard.m_sum2 cacard.point
#execute store result storage cacardwar:ai sum double 0.001 run scoreboard players operation #cacard.m_sum cacard.point += #cacard.m_sum3 cacard.point

#tellraw @a ["WRITING!   loop_j=",{storage:"cacardwar:ai",nbt:"loop_j"},"with Sum=",{storage:"cacardwar:ai",nbt:"sum"}]

#$data modify storage cacardwar:ai output[$(loop_j)] set from storage cacardwar:ai sum

#scoreboard players set #cacard.m_sum1 cacard.point 0
#scoreboard players set #cacard.m_sum2 cacard.point 0
#scoreboard players set #cacard.m_sum3 cacard.point 0
scoreboard players set #cacard.m_sum cacard.point 0
