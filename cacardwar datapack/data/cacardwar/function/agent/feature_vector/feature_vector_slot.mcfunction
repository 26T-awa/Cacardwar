# 牌牌大作战 - 槽位状态 layer0[29..38]（宏参数 {team, slot, dimIndex}）
# 槽位 0~9 统一值域：空槽=0；有卡=配方参与数/28（不参与配方的卡=0.01）；被禁用=-1

# ===== 1. 配方参与度（0~9 统一，按 give_me_all_item 顺序） =====
# iron_ingot 7/28
$execute if items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["iron_ingot"]}] run data modify storage cacardwar:agent layer0[$(dimIndex)] set value 0.25
# gold_ingot 8/28
$execute if items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["gold_ingot"]}] run data modify storage cacardwar:agent layer0[$(dimIndex)] set value 0.285714286
# diamond 6/28
$execute if items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["diamond"]}] run data modify storage cacardwar:agent layer0[$(dimIndex)] set value 0.214285714
# gunpowder 4/28
$execute if items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["gunpowder"]}] run data modify storage cacardwar:agent layer0[$(dimIndex)] set value 0.142857143
# stick 2/28
$execute if items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["stick"]}] run data modify storage cacardwar:agent layer0[$(dimIndex)] set value 0.071428571
# log 1/28
$execute if items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["log"]}] run data modify storage cacardwar:agent layer0[$(dimIndex)] set value 0.035714286
# plank 4/28
$execute if items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["plank"]}] run data modify storage cacardwar:agent layer0[$(dimIndex)] set value 0.142857143
# apple 1/28
$execute if items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["apple"]}] run data modify storage cacardwar:agent layer0[$(dimIndex)] set value 0.035714286
# wheat 2/28
$execute if items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["wheat"]}] run data modify storage cacardwar:agent layer0[$(dimIndex)] set value 0.071428571
# another_two 0/28
$execute if items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["another_two"]}] run data modify storage cacardwar:agent layer0[$(dimIndex)] set value 0.01
# deal 1/28
$execute if items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["deal"]}] run data modify storage cacardwar:agent layer0[$(dimIndex)] set value 0.035714286
# newly_wheat 1/28
$execute if items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["newly_wheat"]}] run data modify storage cacardwar:agent layer0[$(dimIndex)] set value 0.035714286
# newly_bread 0/28
$execute if items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["newly_bread"]}] run data modify storage cacardwar:agent layer0[$(dimIndex)] set value 0.01
# rotten 1/28
$execute if items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["rotten"]}] run data modify storage cacardwar:agent layer0[$(dimIndex)] set value 0.035714286
# head 4/28
$execute if items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["head"]}] run data modify storage cacardwar:agent layer0[$(dimIndex)] set value 0.142857143
# head_zombie 1/28
$execute if items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["head_zombie"]}] run data modify storage cacardwar:agent layer0[$(dimIndex)] set value 0.035714286
# mineral 4/28
$execute if items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["mineral"]}] run data modify storage cacardwar:agent layer0[$(dimIndex)] set value 0.142857143

# ===== 2. 禁用覆盖：特殊值 -1（与空槽 0、有卡区分） =====
$execute if entity @e[tag=cacard.$(team)$(slot),tag=cacard.disabled] run data modify storage cacardwar:agent layer0[$(dimIndex)] set value -1.0
