# AI 训练模式 - 清场（槽位/召唤物/手牌/待结算）
# ===== 清空槽位并锁定（AI 模式玩家不能直接交互，必须走动作命令）=====
execute as @e[tag=cacard.blue0] run data remove entity @s Item
execute as @e[tag=cacard.blue0] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.red0] run data remove entity @s Item
execute as @e[tag=cacard.red0] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.blue1] run data remove entity @s Item
execute as @e[tag=cacard.blue1] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.red1] run data remove entity @s Item
execute as @e[tag=cacard.red1] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.blue2] run data remove entity @s Item
execute as @e[tag=cacard.blue2] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.red2] run data remove entity @s Item
execute as @e[tag=cacard.red2] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.blue3] run data remove entity @s Item
execute as @e[tag=cacard.blue3] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.red3] run data remove entity @s Item
execute as @e[tag=cacard.red3] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.blue4] run data remove entity @s Item
execute as @e[tag=cacard.blue4] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.red4] run data remove entity @s Item
execute as @e[tag=cacard.red4] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.blue5] run data remove entity @s Item
execute as @e[tag=cacard.blue5] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.red5] run data remove entity @s Item
execute as @e[tag=cacard.red5] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.blue6] run data remove entity @s Item
execute as @e[tag=cacard.blue6] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.red6] run data remove entity @s Item
execute as @e[tag=cacard.red6] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.blue7] run data remove entity @s Item
execute as @e[tag=cacard.blue7] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.red7] run data remove entity @s Item
execute as @e[tag=cacard.red7] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.blue8] run data remove entity @s Item
execute as @e[tag=cacard.blue8] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.red8] run data remove entity @s Item
execute as @e[tag=cacard.red8] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.blue9] run data remove entity @s Item
execute as @e[tag=cacard.blue9] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.red9] run data remove entity @s Item
execute as @e[tag=cacard.red9] run data modify entity @s Fixed set value true
# ===== 清除召唤物 =====
execute as @e[tag=cacard.summoner] at @s run tp @s ~ -100 ~
kill @e[tag=cacard.summoner]
tag @e[tag=cacard.disabled] remove cacard.disabled
# ===== 清空潜影盒 =====
function cacardwar:ai/clear_shulker
# ===== 清空待结算 =====
scoreboard players set #cacard.aiResolve cacard.players 0
data remove storage cacardwar:training pending_sample
# ===== 玩家标签清理 =====
tag @a[tag=cacard.blueTeam] remove cacard.hungry
tag @a[tag=cacard.blueTeam] remove cacard.winner
scoreboard players set @a[tag=cacard.blueTeam] cacard.shieldtype 0
