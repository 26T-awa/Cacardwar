tag @s add cacard.ready
scoreboard players set @s cacard.point 50
$scoreboard players set #cacard.$(team)Health cacard.health 20
execute if entity @s[scores={cacard.cardsetype=0}] run tellraw @s {text:"§e你并没有选择卡组或之前选择过卡组，已默认选择§a均衡型§e卡组！"}
execute if entity @s[scores={cacard.cardsetype=0}] run scoreboard players set @s cacard.cardsetype 2
$tag @s add cacard.$(team)Team
clear @s written_book[custom_data={cacardwar:book}]
function cacardwar:preparation/getcardset {team:red}
function cacardwar:preparation/getcardset {team:blue}
playsound minecraft:block.note_block.harp master @s ~ ~ ~ 2 0.3 1
$title @s title {text:"§e等待§$(opptext)方§e玩家…"}
$title @s subtitle {text:"§f你是§$(text)方 §7| ",extra:[{storage:"cacardwar:cardsetinfo",nbt:"$(team)"}]}