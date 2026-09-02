#计算动作掩码1x181
#跳过0
data modify storage cacardwar:ai action_mask set value [1b]

#清空槽位1~10
function cacardwar:main/others/loop_entry {min:0,max:10,bias:0,command:'function cacardwar:ai/game/loop/func1 with storage cacardwar:loop'}

#放置卡牌11~180
function cacardwar:main/others/loop_entry {min:0,max:17,bias:0,command:'function cacardwar:ai/game/loop/func2 with storage cacardwar:loop'}
