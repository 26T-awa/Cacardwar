# 计算放置动作索引：11 + card*20 + slot*2 + type
scoreboard players set #cacard.actionIndexCalu cacard.time 11

#$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)*20
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(card)

#$scoreboard players add #cacard.actionIndexCalu cacard.time $(slot)*2
$scoreboard players add #cacard.actionIndexCalu cacard.time $(slot)
$scoreboard players add #cacard.actionIndexCalu cacard.time $(slot)

$scoreboard players add #cacard.actionIndexCalu cacard.time $(type)
execute store result storage cacardwar:training pending_sample.action int 1 run scoreboard players get #cacard.actionIndexCalu cacard.time
tellraw @a [{text:"动作已设置: ",color:"green",click_event:{action:"suggest_command",command:"/data modify storage cacardwar:training pending_sample.reward set value "}},{storage:"cacardwar:training",nbt:"pending_sample.action"}]
# 可选：返回主菜单
function cacardwar:agent/training/input/main