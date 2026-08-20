# 牌牌大作战 - 己方基础 layer0[0..3,18..24] + 对手 layer0[4..7]（宏参数 {team, oppteam}）

# 1. 生命值 = 当前生命/20
$execute store result storage cacardwar:agent layer0[0] double 0.05 run scoreboard players get #cacard.$(team)Health cacard.health

# 2. 剑免（铁/钻石盾）：shieldtype==1 或 3..7
$execute if score @a[tag=cacard.$(team)Team,limit=1] cacard.shieldtype matches 1 run data modify storage cacardwar:agent layer0[1] set value 1.0
$execute if score @a[tag=cacard.$(team)Team,limit=1] cacard.shieldtype matches 3..7 run data modify storage cacardwar:agent layer0[1] set value 1.0

# 3. 火免（金/钻石盾）：shieldtype 2..7
$execute if score @a[tag=cacard.$(team)Team,limit=1] cacard.shieldtype matches 2..7 run data modify storage cacardwar:agent layer0[2] set value 1.0

# 4. 卡组（当前固定为 1）
data modify storage cacardwar:agent layer0[7] set value 1.0

# 5. 饥饿效果
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.hungry] run data modify storage cacardwar:agent layer0[18] set value 1.0

# 6. 金头颅回复（剩余治疗量/30；无=0, rege1=25/30, rege2=18/30, rege3=9/30）
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege3] run data modify storage cacardwar:agent layer0[19] set value 0.3
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege2] run data modify storage cacardwar:agent layer0[19] set value 0.6
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege1] run data modify storage cacardwar:agent layer0[19] set value 0.833333333

# 7. 乌鸦的赐福
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.bless_of_crow] run data modify storage cacardwar:agent layer0[20] set value 1.0

# 8~11. 召唤物数量/3
scoreboard players set #cacard.agentZombie cacard.players 0
$execute as @e[tag=cacard.$(team)Zombie] run scoreboard players add #cacard.agentZombie cacard.players 1
execute store result storage cacardwar:agent layer0[21] double 0.333333 run scoreboard players get #cacard.agentZombie cacard.players

scoreboard players set #cacard.agentSuperZombie cacard.players 0
$execute as @e[tag=cacard.$(team)SuperZombie] run scoreboard players add #cacard.agentSuperZombie cacard.players 1
execute store result storage cacardwar:agent layer0[22] double 0.333333 run scoreboard players get #cacard.agentSuperZombie cacard.players

scoreboard players set #cacard.agentScarecrow cacard.players 0
$execute as @e[tag=cacard.$(team)Scarecrow] run scoreboard players add #cacard.agentScarecrow cacard.players 1
execute store result storage cacardwar:agent layer0[23] double 0.333333 run scoreboard players get #cacard.agentScarecrow cacard.players

scoreboard players set #cacard.agentTrader cacard.players 0
$execute as @e[tag=cacard.$(team)Trader] run scoreboard players add #cacard.agentTrader cacard.players 1
execute store result storage cacardwar:agent layer0[24] double 0.333333 run scoreboard players get #cacard.agentTrader cacard.players


# ===== 12. 对手关键状态 layer0[38..41]（宏 {oppteam}） =====
# 38. 对手生命/20
$execute store result storage cacardwar:agent layer0[3] double 0.05 run scoreboard players get #cacard.$(oppteam)Health cacard.health
# 39. 对手剑免
$execute if score @a[tag=cacard.$(oppteam)Team,limit=1] cacard.shieldtype matches 1 run data modify storage cacardwar:agent layer0[4] set value 1.0
$execute if score @a[tag=cacard.$(oppteam)Team,limit=1] cacard.shieldtype matches 3..7 run data modify storage cacardwar:agent layer0[4] set value 1.0
# 40. 对手火免
$execute if score @a[tag=cacard.$(oppteam)Team,limit=1] cacard.shieldtype matches 2..7 run data modify storage cacardwar:agent layer0[5] set value 1.0
# 41. 对手召唤物总数/3
scoreboard players set #cacard.agentOppSum cacard.players 0
$execute as @e[tag=cacard.$(oppteam)Zombie] run scoreboard players add #cacard.agentOppSum cacard.players 1
$execute as @e[tag=cacard.$(oppteam)SuperZombie] run scoreboard players add #cacard.agentOppSum cacard.players 1
$execute as @e[tag=cacard.$(oppteam)Scarecrow] run scoreboard players add #cacard.agentOppSum cacard.players 1
$execute as @e[tag=cacard.$(oppteam)Trader] run scoreboard players add #cacard.agentOppSum cacard.players 1
execute store result storage cacardwar:agent layer0[6] double 0.333333 run scoreboard players get #cacard.agentOppSum cacard.players
