# 牌牌大作战 - 显示 42 维特征向量（宏参数 {team, oppteam}）
# 用法：/function cacardwar:agent/feature_vector_show {team:blue,oppteam:red}
# 会先收集最新状态，再逐行 tellraw 显示

# ===== 1. 先收集最新状态 =====
$function cacardwar:agent/feature_vector/feature_vector {team:$(team),oppteam:$(oppteam)}

# ===== 2. 显示（每行一个：序号 + label + 值） =====
function cacardwar:main/others/loop_entry {min:0,max:42,command:"function cacardwar:agent/feature_vector/feature_vector_show_ with storage cacardwar:loop"}

