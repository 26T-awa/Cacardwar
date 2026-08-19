# 任意单层循环，先判断再执行
# 传入 min, max, command，值域为[min,max)
$execute if score #cacard.loop cacard.time matches $(max).. run return run function cacardwar:main/others/loop_cleanup

$$(command)
execute store result storage cacardwar:loop current int 1 run scoreboard players add #cacard.loop cacard.time 1

$execute if score #cacard.loop cacard.time matches $(min)..$(max) run return run function cacardwar:main/others/loop_any with storage cacardwar:loop
