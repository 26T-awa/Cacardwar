# 任意单层循环入口/function cacardwar:main/others/loop_entry {min:,max:,bias:,command:''}
# command可直接调用$(current), $(curbias)
# 传入 min, max, bias, command，值域为[min,max)
$data modify storage cacardwar:loop min set value $(min)
$data modify storage cacardwar:loop max set value $(max)
$data modify storage cacardwar:loop bias set value $(bias)
$data modify storage cacardwar:loop command set value '$(command)'

$data modify storage cacardwar:loop current set value $(min)
data modify storage cacardwar:loop curbias set value 0
$scoreboard players set #cacard.loop cacard.players $(min)
$execute store result storage cacardwar:loop curbias int 1 run scoreboard players add #cacard.loop cacard.players $(bias)
$scoreboard players set #cacard.loop cacard.time $(min)

function cacardwar:main/others/loop_any with storage cacardwar:loop