scoreboard players display name cacard.info8 cacard.Info {text:"§aDone."}

tag @a[tag=cacard.ai_clean] remove cacard.ai_clean
tag @a[tag=cacard.ai_place] remove cacard.ai_place
tag @a[tag=cacard.ai_placed_card] remove cacard.ai_placed_card
title @a[tag=cacard.blueTeam] actionbar {text:"§e继续你的回合！"}
playsound block.stone_button.click_off master @a[tag=cacard.ingame] ~ ~ ~ 1 1.2 1
execute at @e[tag=cacard.blue5] run playsound block.note_block.harp master @a[tag=cacard.ingame] ~ ~ ~ 1 2 1

function cacardwar:ai/constructor/cardset
function cacardwar:ai/constructor/health
function cacardwar:ai/constructor/shield
function cacardwar:ai/constructor/effect
function cacardwar:ai/constructor/summoner
function cacardwar:ai/constructor/card
function cacardwar:ai/constructor/slot
function cacardwar:ai/constructor/slot_state

data modify storage cacardwar:ai pending_sample.before set value []
data modify storage cacardwar:ai pending_sample.before append from storage cacardwar:ai pending_sample.cardset
data modify storage cacardwar:ai pending_sample.before append from storage cacardwar:ai pending_sample.health
data modify storage cacardwar:ai pending_sample.before append from storage cacardwar:ai pending_sample.shield
data modify storage cacardwar:ai pending_sample.before append from storage cacardwar:ai pending_sample.effect
data modify storage cacardwar:ai pending_sample.before append from storage cacardwar:ai pending_sample.summoner
data modify storage cacardwar:ai pending_sample.before append from storage cacardwar:ai pending_sample.card
data modify storage cacardwar:ai pending_sample.before append from storage cacardwar:ai pending_sample.slot
data modify storage cacardwar:ai pending_sample.before append from storage cacardwar:ai pending_sample.slot_state
#注意：这时候的before以形式[[xxx],[xxx],...]存储

data modify storage cacardwar:ai pending_sample.done set value 0b
data modify storage cacardwar:ai pending_sample.action set value -1s

#reward初始化，[0]为总计
function cacardwar:main/others/loop_entry {min:1,max:15,bias:0,command:'function cacardwar:ai/calculation/loop/func1 with storage cacardwar:loop'}
scoreboard players set #cacard.ai_reward cacard.point 0
data modify storage cacardwar:ai pending_sample.reward set value [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
#下一步应为data modify storage cacardwar:ai pending_sample.action/reward set value xxx