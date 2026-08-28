#记录双方卡槽状态信息
#构建
data modify storage cacardwar:ai pending_sample.slot_state set value [[1b,1b,1b,1b,1b,1b,1b,1b,1b,1b],[1b,1b,1b,1b,1b,1b,1b,1b,1b,1b]]
function cacardwar:main/others/loop_entry {min:0,max:10,bias:0,command:'function cacardwar:ai/constructor/loop/func3 with storage cacardwar:loop'}
