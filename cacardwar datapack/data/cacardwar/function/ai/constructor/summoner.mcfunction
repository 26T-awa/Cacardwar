#记录双方召唤物信息
#现在仅支持记录蓝方的信息，红方默认为无召唤物；召唤物ID:僵尸1，商人2，超级僵尸3，稻草人4
#构建
data modify storage cacardwar:ai pending_sample.summoner set value [[0,0,0],[0,0,0]]
function cacardwar:main/others/loop_entry {min:0,max:3,bias:1,command:'function cacardwar:ai/constructor/loop/func5 with storage cacardwar:loop'}
