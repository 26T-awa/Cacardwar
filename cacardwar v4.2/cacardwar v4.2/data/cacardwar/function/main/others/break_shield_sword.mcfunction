$execute if entity @a[tag=cacard.$(oppteam)Team,tag=cacard.shield_sword] at @e[tag=cacard.$(oppteam)5] run playsound item.shield.block master @a[tag=cacard.ingame] ~ ~ ~ 2 1 1
$execute if entity @a[tag=cacard.$(oppteam)Team,tag=cacard.shield_sword] at @e[tag=cacard.$(oppteam)5] run playsound item.shield.break master @a[tag=cacard.ingame] ~ ~ ~ 2 1 1
$scoreboard players remove @a[tag=cacard.$(oppteam)Team,tag=cacard.shield_sword] cacard.shield.count 1
$tag @a[tag=cacard.$(oppteam)Team,tag=cacard.shield_sword] remove cacard.shield_sword