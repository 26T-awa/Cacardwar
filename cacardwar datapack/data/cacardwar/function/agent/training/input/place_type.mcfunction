# 选择操作类型
$tellraw @a ["", {text:"卡牌 $(card) 放入槽 $(slot)",color:"gold"}]
$tellraw @a [{text:"[添加] ",color:"green",click_event:{action:"run_command",command:"function cacardwar:agent/training/input/set_place_action {card:$(card), slot:$(slot), type:0}"}},{text:"[修改] ",color:"red",click_event:{action:"run_command",command:"function cacardwar:agent/training/input/set_place_action {card:$(card), slot:$(slot), type:1}"}}]
$tellraw @a [{text:"[返回]",color:"gray",click_event:{action:"run_command",command:"function cacardwar:agent/training/input/place_slot {card:$(card)}"}}]