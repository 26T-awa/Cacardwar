tag @s add cacard.ready
execute if entity @s[tag=!cacard.attack,tag=!cacard.average,tag=!cacard.resist,tag=!cacard.summon] run tellraw @s {text:"\u00a7e你并没有选择卡组，已默认选择\u00a7a均衡型\u00a7e卡组！"}
execute if entity @s[tag=!cacard.attack,tag=!cacard.average,tag=!cacard.resist,tag=!cacard.summon] run tag @s add cacard.average
$tag @s add cacard.$(team)Team
clear @s written_book[custom_data={cacardwar:book}] 2
playsound minecraft:block.note_block.harp master @s ~ ~ ~ 2 0.3 1
$title @s title {text:"\u00a7e等待\u00a7$(opptext)方\u00a7e玩家…"}