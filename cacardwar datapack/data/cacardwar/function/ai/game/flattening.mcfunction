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

data modify storage cacardwar:ai matrix.l set value []
data modify storage cacardwar:ai matrix.l append from storage cacardwar:ai pending_sample.before[0][]
data modify storage cacardwar:ai matrix.l append from storage cacardwar:ai pending_sample.before[1][]
data modify storage cacardwar:ai matrix.l append from storage cacardwar:ai pending_sample.before[2][0][]
data modify storage cacardwar:ai matrix.l append from storage cacardwar:ai pending_sample.before[2][1][]
data modify storage cacardwar:ai matrix.l append from storage cacardwar:ai pending_sample.before[3][0][]
data modify storage cacardwar:ai matrix.l append from storage cacardwar:ai pending_sample.before[3][1][]
data modify storage cacardwar:ai matrix.l append from storage cacardwar:ai pending_sample.before[4][0][]
data modify storage cacardwar:ai matrix.l append from storage cacardwar:ai pending_sample.before[4][1][]
data modify storage cacardwar:ai matrix.l append from storage cacardwar:ai pending_sample.before[5][]
data modify storage cacardwar:ai matrix.l append from storage cacardwar:ai pending_sample.before[6][0][]
data modify storage cacardwar:ai matrix.l append from storage cacardwar:ai pending_sample.before[6][1][]
data modify storage cacardwar:ai matrix.l append from storage cacardwar:ai pending_sample.before[7][0][]
data modify storage cacardwar:ai matrix.l append from storage cacardwar:ai pending_sample.before[7][1][]