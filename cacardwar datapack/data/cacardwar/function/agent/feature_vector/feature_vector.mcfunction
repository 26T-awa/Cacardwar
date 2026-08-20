# 牌牌大作战 - 智能体特征向量（42维）主入口
# 用法：/function cacardwar:agent/feature_vector/feature_vector {team:blue,oppteam:red}
# 输出：storage cacardwar:agent {team, labels, layer0[0~41]}

# ===== 初始化 storage =====
$data modify storage cacardwar:agent team set value "$(team)"
data modify storage cacardwar:agent layer0 set value [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]

# ===== 己方基础 layer0[0..3,18..24] + 对手 layer0[4..7] =====
$function cacardwar:agent/feature_vector/feature_vector_team {team:$(team),oppteam:$(oppteam)}

# ===== 槽位状态 layer0[8..17] =====
$function cacardwar:agent/feature_vector/feature_vector_slot {team:$(team),slot:0,dimIndex:8}
$function cacardwar:agent/feature_vector/feature_vector_slot {team:$(team),slot:1,dimIndex:9}
$function cacardwar:agent/feature_vector/feature_vector_slot {team:$(team),slot:2,dimIndex:10}
$function cacardwar:agent/feature_vector/feature_vector_slot {team:$(team),slot:3,dimIndex:11}
$function cacardwar:agent/feature_vector/feature_vector_slot {team:$(team),slot:4,dimIndex:12}
$function cacardwar:agent/feature_vector/feature_vector_slot {team:$(team),slot:5,dimIndex:13}
$function cacardwar:agent/feature_vector/feature_vector_slot {team:$(team),slot:6,dimIndex:14}
$function cacardwar:agent/feature_vector/feature_vector_slot {team:$(team),slot:7,dimIndex:15}
$function cacardwar:agent/feature_vector/feature_vector_slot {team:$(team),slot:8,dimIndex:16}
$function cacardwar:agent/feature_vector/feature_vector_slot {team:$(team),slot:9,dimIndex:17}

# ===== 4. 卡牌 layer0[25..41]：第一遍算总卡牌数（分母） =====
$function cacardwar:agent/feature_vector/feature_vector_card_total {team:$(team),type:iron_ingot}
$function cacardwar:agent/feature_vector/feature_vector_card_total {team:$(team),type:gold_ingot}
$function cacardwar:agent/feature_vector/feature_vector_card_total {team:$(team),type:diamond}
$function cacardwar:agent/feature_vector/feature_vector_card_total {team:$(team),type:gunpowder}
$function cacardwar:agent/feature_vector/feature_vector_card_total {team:$(team),type:stick}
$function cacardwar:agent/feature_vector/feature_vector_card_total {team:$(team),type:log}
$function cacardwar:agent/feature_vector/feature_vector_card_total {team:$(team),type:plank}
$function cacardwar:agent/feature_vector/feature_vector_card_total {team:$(team),type:apple}
$function cacardwar:agent/feature_vector/feature_vector_card_total {team:$(team),type:wheat}
$function cacardwar:agent/feature_vector/feature_vector_card_total {team:$(team),type:another_two}
$function cacardwar:agent/feature_vector/feature_vector_card_total {team:$(team),type:deal}
$function cacardwar:agent/feature_vector/feature_vector_card_total {team:$(team),type:newly_wheat}
$function cacardwar:agent/feature_vector/feature_vector_card_total {team:$(team),type:newly_bread}
$function cacardwar:agent/feature_vector/feature_vector_card_total {team:$(team),type:rotten}
$function cacardwar:agent/feature_vector/feature_vector_card_total {team:$(team),type:head}
$function cacardwar:agent/feature_vector/feature_vector_card_total {team:$(team),type:head_zombie}
$function cacardwar:agent/feature_vector/feature_vector_card_total {team:$(team),type:mineral_clump}

# ===== 5. 卡牌 layer0[25..41]：第二遍逐张归一化 =====
$function cacardwar:agent/feature_vector/feature_vector_card_calc {team:$(team),type:iron_ingot,dimIndex:25}
$function cacardwar:agent/feature_vector/feature_vector_card_calc {team:$(team),type:gold_ingot,dimIndex:26}
$function cacardwar:agent/feature_vector/feature_vector_card_calc {team:$(team),type:diamond,dimIndex:27}
$function cacardwar:agent/feature_vector/feature_vector_card_calc {team:$(team),type:gunpowder,dimIndex:28}
$function cacardwar:agent/feature_vector/feature_vector_card_calc {team:$(team),type:stick,dimIndex:29}
$function cacardwar:agent/feature_vector/feature_vector_card_calc {team:$(team),type:log,dimIndex:30}
$function cacardwar:agent/feature_vector/feature_vector_card_calc {team:$(team),type:plank,dimIndex:31}
$function cacardwar:agent/feature_vector/feature_vector_card_calc {team:$(team),type:apple,dimIndex:32}
$function cacardwar:agent/feature_vector/feature_vector_card_calc {team:$(team),type:wheat,dimIndex:33}
$function cacardwar:agent/feature_vector/feature_vector_card_calc {team:$(team),type:another_two,dimIndex:34}
$function cacardwar:agent/feature_vector/feature_vector_card_calc {team:$(team),type:deal,dimIndex:35}
$function cacardwar:agent/feature_vector/feature_vector_card_calc {team:$(team),type:newly_wheat,dimIndex:36}
$function cacardwar:agent/feature_vector/feature_vector_card_calc {team:$(team),type:newly_bread,dimIndex:37}
$function cacardwar:agent/feature_vector/feature_vector_card_calc {team:$(team),type:rotten,dimIndex:38}
$function cacardwar:agent/feature_vector/feature_vector_card_calc {team:$(team),type:head,dimIndex:39}
$function cacardwar:agent/feature_vector/feature_vector_card_calc {team:$(team),type:head_zombie,dimIndex:40}
$function cacardwar:agent/feature_vector/feature_vector_card_calc {team:$(team),type:mineral_clump,dimIndex:41}

