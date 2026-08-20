# AI 训练模式 - 每 tick 主逻辑（由 main/execute 在 isongoing=5 时调用）
# 1) 吸收背包卡牌
function cacardwar:ai/absorb
# 2) 合成/道具自动结算（蓝方槽位）
function cacardwar:item_detect/another_two
function cacardwar:item_detect/apple
function cacardwar:item_detect/bomb
function cacardwar:item_detect/bread
function cacardwar:item_detect/deal_with_gambler
function cacardwar:item_detect/diamond_pickaxe
function cacardwar:item_detect/diamond_sword
function cacardwar:item_detect/fire_sword
function cacardwar:item_detect/fireball
function cacardwar:item_detect/golden_apple
function cacardwar:item_detect/golden_head
function cacardwar:item_detect/golden_sword
function cacardwar:item_detect/huge_bomb
function cacardwar:item_detect/iron_pickaxe
function cacardwar:item_detect/iron_sword
function cacardwar:item_detect/log
function cacardwar:item_detect/mineral_clump
function cacardwar:item_detect/newly_bread
function cacardwar:item_detect/planks
function cacardwar:item_detect/rotten_flesh
function cacardwar:item_detect/scarecrow
function cacardwar:item_detect/shield_diamond
function cacardwar:item_detect/shield_gold
function cacardwar:item_detect/shield_iron
function cacardwar:item_detect/superzombie
function cacardwar:item_detect/trader
function cacardwar:item_detect/zombie
function cacardwar:item_detect/zombie_headcraft
# 3) 动作结算倒计时：到 0 时捕获 next_state + 写样本
execute if score #cacard.aiResolve cacard.players matches 1 run function cacardwar:ai/finalize
execute if score #cacard.aiResolve cacard.players matches 2.. run scoreboard players remove #cacard.aiResolve cacard.players 1
# 4) 胜负检查（安全网，finalize 已处理）
execute if score #cacard.aiState cacard.players matches 1 if score #cacard.redHealth cacard.health matches ..0 run function cacardwar:ai/end {team:blue,oppteam:red}
execute if score #cacard.aiState cacard.players matches 1 if score #cacard.blueHealth cacard.health matches ..0 run function cacardwar:ai/end {team:red,oppteam:blue}
# 5) 更新手牌合计（供信息栏显示）
function cacardwar:ai/hand_total
