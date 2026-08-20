$data modify storage cacardwar:training pending_sample.action set value $(action)
tellraw @a [{text:"动作已设置: ",color:"green",click_event:{action:"suggest_command",command:"/data modify storage cacardwar:training pending_sample.reward set value "}},{storage:"cacardwar:training",nbt:"pending_sample.action"}]
# 返回主菜单
function cacardwar:agent/training/input/main