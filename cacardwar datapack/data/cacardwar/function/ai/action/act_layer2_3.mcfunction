#跳过-记录数据
clear @a[tag=cacard.inAImode,limit=1] *[custom_data~{cacardwar:["ai_act"]}]

#构建行动前特征向量
function cacardwar:ai/constructor/cst_before
#构建行动码、奖励，这里是跳过的特殊情况
data modify storage cacardwar:ai pending_sample.action set value 0
function cacardwar:ai/action/skip
