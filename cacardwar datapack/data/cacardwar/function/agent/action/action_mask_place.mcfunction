# 牌牌大作战 - 动作掩码：单个(卡,槽)放置动作（宏参数 {team, slot, hand, add, mod}）
# 前提条件：手牌有该卡（score $(hand) >= 1）且槽位未禁用
# 槽空 → "添加"动作索引 $(add) 可行；槽有卡 → "修改"动作索引 $(mod) 可行
# 输出：storage cacardwar:agent.action_mask[N] = 1.0

# ===== 槽空 且 未禁用 且 手牌有卡 → 添加 =====
$execute if score $(hand) cacard.players matches 1.. unless items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["card"]}] unless entity @e[tag=cacard.$(team)$(slot),tag=cacard.disabled] run data modify storage cacardwar:agent action_mask[$(add)] set value 1b

# ===== 槽有卡 且 未禁用 且 手牌有卡 → 修改 =====
$execute if score $(hand) cacard.players matches 1.. if items entity @e[tag=cacard.$(team)$(slot)] contents *[custom_data~{cacardwar:["card"]}] unless entity @e[tag=cacard.$(team)$(slot),tag=cacard.disabled] run data modify storage cacardwar:agent action_mask[$(mod)] set value 1b
