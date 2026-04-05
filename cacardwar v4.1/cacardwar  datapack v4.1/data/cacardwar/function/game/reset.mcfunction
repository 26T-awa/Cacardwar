title @a[tag=cacard.ingame] reset
kill @e[tag=cacard.summoner]

function cacardwar:game/reset_only_frame

execute as @e[tag=cacard.blue] run data remove entity @s Item 
execute as @e[tag=cacard.blue0] run data remove entity @s Item 
execute as @e[tag=cacard.blue] run data modify entity @s Fixed set value false
execute as @e[tag=cacard.blue0] run data modify entity @s Fixed set value false
execute as @e[tag=cacard.red] run data remove entity @s Item 
execute as @e[tag=cacard.red0] run data remove entity @s Item 
execute as @e[tag=cacard.red] run data modify entity @s Fixed set value false
execute as @e[tag=cacard.red0] run data modify entity @s Fixed set value false
$execute as @e[tag=cacard.blue5] run data modify entity @s Item set value {id:written_book,count:1b,components:{written_book_content:{author:"\u00a7k_26T",title:$(title),pages:[$(content),$(rule1),$(rule2),$(rule3),$(cardset1),$(cardset2),$(cardset3),$(cardset4),{text:"\u00a7l准备\u00a7r\n\n\u00a77  点击下面的选项准备，点击前请再次确认所选的卡组！\n\n\n\n\n\n\n\n        ",extra:[{text:"【\u00a7b蓝方\u00a7r准备】",hover_event:{action:"show_text",value:"点击准备，点击前请再次确认所选的卡组！"},click_event:{action:"run_command",command:"/function cacardwar:preparation/ready {team:blue,opptext:\"6红\"}"}}]}]},custom_data:{cacardwar:book}}}
$execute as @e[tag=cacard.red5] run data modify entity @s Item set value {id:written_book,count:1b,components:{written_book_content:{author:"\u00a7k_26T",title:$(title),pages:[$(content),$(rule1),$(rule2),$(rule3),$(cardset1),$(cardset2),$(cardset3),$(cardset4),{text:"\u00a7l准备\u00a7r\n\n\u00a77  点击下面的选项准备，点击前请再次确认所选的卡组！\n\n\n\n\n\n\n\n        ",extra:[{text:"【\u00a76红方\u00a7r准备】",hover_event:{action:"show_text",value:"点击准备，点击前请再次确认所选的卡组！"},click_event:{action:"run_command",command:"/function cacardwar:preparation/ready {team:red,opptext:\"b蓝\"}"}}]}]},custom_data:{cacardwar:book}}}

execute as @a[tag=cacard.ingame] run function cacardwar:main/clear_all_item
playsound minecraft:block.note_block.harp master @s ~ ~ ~ 2 0.3 1
title @a[tag=cacard.ingame] actionbar {text:"\u00a7e\u00a7l已重置！"}
tag @a[tag=cacard.ready] remove cacard.shield_fire
tag @a[tag=cacard.ready] remove cacard.shield_sword
tag @a[tag=cacard.ready] remove cacard.hungry
tag @a[tag=cacard.ready] remove cacard.attack
tag @a[tag=cacard.ready] remove cacard.average
tag @a[tag=cacard.ready] remove cacard.resist
tag @a[tag=cacard.ready] remove cacard.summon
tag @a[tag=cacard.ready] remove cacard.blueTeam
tag @a[tag=cacard.ready] remove cacard.redTeam
tag @a[tag=cacard.ready] remove cacard.ready
bossbar remove cacardwar:bluehealth
bossbar remove cacardwar:redhealth