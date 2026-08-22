# AI 训练模式 - 清场（槽位/召唤物/手牌/待结算）
# ===== 清除召唤物 =====
execute as @e[tag=cacard.summoner] at @s run tp @s ~ -100 ~
kill @e[tag=cacard.summoner]
execute as @a[tag=cacard.ingame] run function cacardwar:main/recover_all_slot_tag
# ===== 清空槽位并锁定（AI 模式玩家不能直接交互，必须走动作命令）=====
execute as @e[tag=cacard.blue] run data remove entity @s Item 
execute as @e[tag=cacard.blue0] run data remove entity @s Item 
execute as @e[tag=cacard.blue] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.blue0] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.red] run data remove entity @s Item 
execute as @e[tag=cacard.red0] run data remove entity @s Item 
execute as @e[tag=cacard.red] run data modify entity @s Fixed set value true
execute as @e[tag=cacard.red0] run data modify entity @s Fixed set value true

# ===== 清空潜影盒 =====
function cacardwar:ai/clear_shulker
# ===== 玩家标签清理 =====
tag @a[tag=cacard.ingame] remove cacard.winner
tag @a[tag=cacard.ingame] remove cacard.shield_fire
tag @a[tag=cacard.ingame] remove cacard.shield_sword
tag @a[tag=cacard.ingame] remove cacard.hungry
tag @a[tag=cacard.ingame] remove cacard.regenerating
tag @a[tag=cacard.ingame] remove cacard.godn_head_rege1
tag @a[tag=cacard.ingame] remove cacard.godn_head_rege2
tag @a[tag=cacard.ingame] remove cacard.godn_head_rege3
tag @a[tag=cacard.ingame] remove cacard.bless_of_crow

# ===== 清空待结算 =====
scoreboard players set @a[tag=cacard.blueTeam] cacard.shieldtype 0
scoreboard players set #cacard.aiResolve cacard.players 0
data remove storage cacardwar:training pending_sample

