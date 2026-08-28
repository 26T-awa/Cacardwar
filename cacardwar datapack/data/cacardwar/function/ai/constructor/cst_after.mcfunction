scoreboard players display name cacard.info8 cacard.Info {text:"§eSending..."}

function cacardwar:ai/constructor/cardset
function cacardwar:ai/constructor/health
function cacardwar:ai/constructor/shield
function cacardwar:ai/constructor/effect
function cacardwar:ai/constructor/summoner
function cacardwar:ai/constructor/card
function cacardwar:ai/constructor/slot
function cacardwar:ai/constructor/slot_state

#计算reward
execute unless score #cacard.ai_reward cacard.point matches 0 run tellraw @a[tag=cacard.inAImode,limit=1] [{text:"§e§oreward中途被修改:"},{score:{objective:cacard.point,name:"#cacard.ai_reward"}}]
scoreboard players set #cacard.ai_reward cacard.point 0
function cacardwar:main/others/loop_entry {min:1,max:15,bias:0,command:'function cacardwar:ai/calculation/loop/func2 with storage cacardwar:loop'}
scoreboard players set #cacard.ai_reward cacard.point 0

data modify storage cacardwar:ai pending_sample.after set value []
data modify storage cacardwar:ai pending_sample.after append from storage cacardwar:ai pending_sample.cardset
data modify storage cacardwar:ai pending_sample.after append from storage cacardwar:ai pending_sample.health
data modify storage cacardwar:ai pending_sample.after append from storage cacardwar:ai pending_sample.shield
data modify storage cacardwar:ai pending_sample.after append from storage cacardwar:ai pending_sample.effect
data modify storage cacardwar:ai pending_sample.after append from storage cacardwar:ai pending_sample.summoner
data modify storage cacardwar:ai pending_sample.after append from storage cacardwar:ai pending_sample.card
data modify storage cacardwar:ai pending_sample.after append from storage cacardwar:ai pending_sample.slot
data modify storage cacardwar:ai pending_sample.after append from storage cacardwar:ai pending_sample.slot_state

function cacardwar:ai/constructor/info_refresh