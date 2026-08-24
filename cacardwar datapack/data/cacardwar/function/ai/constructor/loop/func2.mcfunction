#function cacardwar:ai/constructor/loop/func2 with storage cacardwar:loop
$execute if score ai#cacard.ai_card$(curbias) cacard.cardcount matches 10.. run scoreboard players set #cacard.ai_card$(curbias) cacard.cardcount 10
$execute store result storage cacardwar:ai pending_sample.card[$(current)] double 0.1 run scoreboard players get #cacard.ai_card$(curbias) cacard.cardcount