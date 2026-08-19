# 任意单层循环入口
# 传入 min, max, command，值域为[min,max)
$data modify storage cacardwar:loop min set value $(min)
$data modify storage cacardwar:loop max set value $(max)
$data modify storage cacardwar:loop current set value $(min)
$data modify storage cacardwar:loop command set value "$(command)"

$scoreboard players set #cacard.loop cacard.time $(min)
function cacardwar:main/others/loop_any with storage cacardwar:loop