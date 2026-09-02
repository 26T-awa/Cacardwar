#function cacardwar:ai/game/loop/func2 with storage cacardwar:loop
#计算手持拥有卡牌
$execute store result score #cacard.ai_action_mask cacard.point run data get storage cacardwar:ai pending_sample.before[5][$(current)] 10
execute if score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp set value [0b,0b,0b,0b,0b,0b,0b,0b,0b,0b]
execute if score #cacard.ai_action_mask cacard.point matches 0 run return run data modify storage cacardwar:ai action_mask append from storage cacardwar:ai action_masktemp[]

#execute unless score #cacard.ai_action_mask cacard.point matches 0 run :

execute store result score #cacard.ai_action_mask cacard.players run data get storage cacardwar:ai pending_sample.before[7][0][0]
execute if score #cacard.ai_action_mask cacard.players matches 1 store result score #cacard.ai_action_mask cacard.point run data get storage cacardwar:ai pending_sample.before[6][0][0]
execute if score #cacard.ai_action_mask cacard.players matches 1 if score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[0] set value 1b
execute if score #cacard.ai_action_mask cacard.players matches 1 unless score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[0] set value 0b
execute if score #cacard.ai_action_mask cacard.players matches 0 run data modify storage cacardwar:ai action_masktemp[0] set value 0b
execute store result score #cacard.ai_action_mask cacard.players run data get storage cacardwar:ai pending_sample.before[7][0][1]
execute if score #cacard.ai_action_mask cacard.players matches 1 store result score #cacard.ai_action_mask cacard.point run data get storage cacardwar:ai pending_sample.before[6][0][1]
execute if score #cacard.ai_action_mask cacard.players matches 1 if score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[1] set value 1b
execute if score #cacard.ai_action_mask cacard.players matches 1 unless score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[1] set value 0b
execute if score #cacard.ai_action_mask cacard.players matches 0 run data modify storage cacardwar:ai action_masktemp[1] set value 0b
execute store result score #cacard.ai_action_mask cacard.players run data get storage cacardwar:ai pending_sample.before[7][0][2]
execute if score #cacard.ai_action_mask cacard.players matches 1 store result score #cacard.ai_action_mask cacard.point run data get storage cacardwar:ai pending_sample.before[6][0][2]
execute if score #cacard.ai_action_mask cacard.players matches 1 if score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[2] set value 1b
execute if score #cacard.ai_action_mask cacard.players matches 1 unless score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[2] set value 0b
execute if score #cacard.ai_action_mask cacard.players matches 0 run data modify storage cacardwar:ai action_masktemp[2] set value 0b
execute store result score #cacard.ai_action_mask cacard.players run data get storage cacardwar:ai pending_sample.before[7][0][3]
execute if score #cacard.ai_action_mask cacard.players matches 1 store result score #cacard.ai_action_mask cacard.point run data get storage cacardwar:ai pending_sample.before[6][0][3]
execute if score #cacard.ai_action_mask cacard.players matches 1 if score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[3] set value 1b
execute if score #cacard.ai_action_mask cacard.players matches 1 unless score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[3] set value 0b
execute if score #cacard.ai_action_mask cacard.players matches 0 run data modify storage cacardwar:ai action_masktemp[3] set value 0b
execute store result score #cacard.ai_action_mask cacard.players run data get storage cacardwar:ai pending_sample.before[7][0][4]
execute if score #cacard.ai_action_mask cacard.players matches 1 store result score #cacard.ai_action_mask cacard.point run data get storage cacardwar:ai pending_sample.before[6][0][4]
execute if score #cacard.ai_action_mask cacard.players matches 1 if score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[4] set value 1b
execute if score #cacard.ai_action_mask cacard.players matches 1 unless score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[4] set value 0b
execute if score #cacard.ai_action_mask cacard.players matches 0 run data modify storage cacardwar:ai action_masktemp[4] set value 0b
execute store result score #cacard.ai_action_mask cacard.players run data get storage cacardwar:ai pending_sample.before[7][0][5]
execute if score #cacard.ai_action_mask cacard.players matches 1 store result score #cacard.ai_action_mask cacard.point run data get storage cacardwar:ai pending_sample.before[6][0][5]
execute if score #cacard.ai_action_mask cacard.players matches 1 if score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[5] set value 1b
execute if score #cacard.ai_action_mask cacard.players matches 1 unless score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[5] set value 0b
execute if score #cacard.ai_action_mask cacard.players matches 0 run data modify storage cacardwar:ai action_masktemp[5] set value 0b
execute store result score #cacard.ai_action_mask cacard.players run data get storage cacardwar:ai pending_sample.before[7][0][6]
execute if score #cacard.ai_action_mask cacard.players matches 1 store result score #cacard.ai_action_mask cacard.point run data get storage cacardwar:ai pending_sample.before[6][0][6]
execute if score #cacard.ai_action_mask cacard.players matches 1 if score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[6] set value 1b
execute if score #cacard.ai_action_mask cacard.players matches 1 unless score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[6] set value 0b
execute if score #cacard.ai_action_mask cacard.players matches 0 run data modify storage cacardwar:ai action_masktemp[6] set value 0b
execute store result score #cacard.ai_action_mask cacard.players run data get storage cacardwar:ai pending_sample.before[7][0][7]
execute if score #cacard.ai_action_mask cacard.players matches 1 store result score #cacard.ai_action_mask cacard.point run data get storage cacardwar:ai pending_sample.before[6][0][7]
execute if score #cacard.ai_action_mask cacard.players matches 1 if score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[7] set value 1b
execute if score #cacard.ai_action_mask cacard.players matches 1 unless score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[7] set value 0b
execute if score #cacard.ai_action_mask cacard.players matches 0 run data modify storage cacardwar:ai action_masktemp[7] set value 0b
execute store result score #cacard.ai_action_mask cacard.players run data get storage cacardwar:ai pending_sample.before[7][0][8]
execute if score #cacard.ai_action_mask cacard.players matches 1 store result score #cacard.ai_action_mask cacard.point run data get storage cacardwar:ai pending_sample.before[6][0][8]
execute if score #cacard.ai_action_mask cacard.players matches 1 if score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[8] set value 1b
execute if score #cacard.ai_action_mask cacard.players matches 1 unless score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[8] set value 0b
execute if score #cacard.ai_action_mask cacard.players matches 0 run data modify storage cacardwar:ai action_masktemp[8] set value 0b
execute store result score #cacard.ai_action_mask cacard.players run data get storage cacardwar:ai pending_sample.before[7][0][9]
execute if score #cacard.ai_action_mask cacard.players matches 1 store result score #cacard.ai_action_mask cacard.point run data get storage cacardwar:ai pending_sample.before[6][0][9]
execute if score #cacard.ai_action_mask cacard.players matches 1 if score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[9] set value 1b
execute if score #cacard.ai_action_mask cacard.players matches 1 unless score #cacard.ai_action_mask cacard.point matches 0 run data modify storage cacardwar:ai action_masktemp[9] set value 0b
execute if score #cacard.ai_action_mask cacard.players matches 0 run data modify storage cacardwar:ai action_masktemp[9] set value 0b

data modify storage cacardwar:ai action_mask append from storage cacardwar:ai action_masktemp[]
