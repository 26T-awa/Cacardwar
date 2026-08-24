#跳过-记录数据
clear @a[tag=cacard.inAImode,limit=1] *[custom_data~{cacardwar:["ai_act"]}]

#构建行动前特征向量
function cacardwar:ai/constructor/cst_before
#构建行动码、奖励
function
