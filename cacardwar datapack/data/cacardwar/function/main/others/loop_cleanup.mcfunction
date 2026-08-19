# 循环结束清理函数
# 重置计分板，删除 storage 中的临时数据

# 归零
scoreboard players set #cacard.loop cacard.time 0

# 清除 storage 中的循环参数
data remove storage cacardwar:loop min
data remove storage cacardwar:loop max
data remove storage cacardwar:loop current
data remove storage cacardwar:loop command
