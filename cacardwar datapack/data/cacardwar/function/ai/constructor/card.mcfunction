#记录剩余卡牌
#构建
data modify storage cacardwar:ai pending_sample.card set value [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
function cacardwar:main/others/loop_entry {min:1,max:18,bias:0,command:'function cacardwar:ai/constructor/loop/func1 with storage cacardwar:loop'}
function cacardwar:main/others/loop_entry {min:0,max:17,bias:1,command:'function cacardwar:ai/constructor/loop/func2 with storage cacardwar:loop'}
