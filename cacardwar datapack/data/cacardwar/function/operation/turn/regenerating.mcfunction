#金头颅
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege3] as @e[tag=cacard.$(team)5] at @s run particle heart ~ ~2 ~ 0.5 0.3 0.5 0 9 normal @a[tag=cacard.ingame]
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege3] as @e[tag=cacard.$(team)5] at @s run playsound block.conduit.activate master @a[tag=cacard.ingame] ~ ~ ~ 0.7 1.6 0.5
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege3] as @e[tag=cacard.$(team)5] at @s run playsound block.conduit.deactivate master @a[tag=cacard.ingame] ~ ~ ~ 0.3 0.4 0.1
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege3] run scoreboard players add #cacard.$(team)Health cacard.health 9
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege3] run function cacardwar:main/others/advancements {team:$(team),advancementype:regenerate_golden_head}
$tag @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege3] remove cacard.regenerating
$tag @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege3] remove cacard.godn_head_rege3

$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege2] as @e[tag=cacard.$(team)5] at @s run particle heart ~ ~2 ~ 0.5 0.3 0.5 0 9 normal @a[tag=cacard.ingame]
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege2] as @e[tag=cacard.$(team)5] at @s run playsound block.conduit.activate master @a[tag=cacard.ingame] ~ ~ ~ 0.8 1.6 0.6
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege2] run scoreboard players add #cacard.$(team)Health cacard.health 9
$tag @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege2] add cacard.godn_head_rege3
$tag @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege3] remove cacard.godn_head_rege2

$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege1] as @e[tag=cacard.$(team)5] at @s run particle heart ~ ~2 ~ 0.5 0.3 0.5 0 7 normal @a[tag=cacard.ingame]
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege1] as @e[tag=cacard.$(team)5] at @s run playsound block.conduit.activate master @a[tag=cacard.ingame] ~ ~ ~ 0.8 1.6 0.6
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege1] run scoreboard players add #cacard.$(team)Health cacard.health 7
$tag @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege1] add cacard.godn_head_rege2
$tag @a[tag=cacard.$(team)Team,tag=cacard.godn_head_rege2] remove cacard.godn_head_rege1
