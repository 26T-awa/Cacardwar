function cacardwar:ai/constructor/cardset
function cacardwar:ai/constructor/health
function cacardwar:ai/constructor/shield
function cacardwar:ai/constructor/effect
function cacardwar:ai/constructor/summoner
function cacardwar:ai/constructor/card
function cacardwar:ai/constructor/slot
function cacardwar:ai/constructor/slot_state

data modify storage cacardwar:ai pending_sample.after set value []
data modify storage cacardwar:ai pending_sample.after append from storage cacardwar:ai pending_sample.cardset
data modify storage cacardwar:ai pending_sample.after append from storage cacardwar:ai pending_sample.health
data modify storage cacardwar:ai pending_sample.after append from storage cacardwar:ai pending_sample.shield
data modify storage cacardwar:ai pending_sample.after append from storage cacardwar:ai pending_sample.effect
data modify storage cacardwar:ai pending_sample.after append from storage cacardwar:ai pending_sample.summoner
data modify storage cacardwar:ai pending_sample.after append from storage cacardwar:ai pending_sample.card
data modify storage cacardwar:ai pending_sample.after append from storage cacardwar:ai pending_sample.slot
data modify storage cacardwar:ai pending_sample.after append from storage cacardwar:ai pending_sample.slot_state
