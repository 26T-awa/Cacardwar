#记录双方卡槽内容物信息
#现在仅支持记录蓝方的信息，红方卡槽默认为空
#构建
data modify storage cacardwar:ai pending_sample.slot set value [[0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0]]
function cacardwar:main/others/loop_entry {min:1,max:18,bias:0,command:'function cacardwar:ai/constructor/loop/func4 with storage cacardwar:loop'}
