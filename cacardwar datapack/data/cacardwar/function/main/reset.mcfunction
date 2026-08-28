title @a[tag=cacard.ingame] reset
execute as @e[tag=cacard.summoner] at @s run tp @s ~ -100 ~
kill @e[tag=cacard.summoner]
execute as @a[tag=cacard.ingame] run function cacardwar:main/clear_all_item

data modify block -5 -59 -77 Items set value []
function cacardwar:main/reset_only_frame
function cacardwar:agent/state_reset

tag @e[tag=cacard.disabled] remove cacard.disabled
execute as @e[tag=cacard.blue] run data remove entity @s Item 
execute as @e[tag=cacard.blue0] run data remove entity @s Item 
execute as @e[tag=cacard.blue] run data modify entity @s Fixed set value false
execute as @e[tag=cacard.blue0] run data modify entity @s Fixed set value false
execute as @e[tag=cacard.red] run data remove entity @s Item 
execute as @e[tag=cacard.red0] run data remove entity @s Item 
execute as @e[tag=cacard.red] run data modify entity @s Fixed set value false
execute as @e[tag=cacard.red0] run data modify entity @s Fixed set value false
$execute as @e[tag=cacard.blue5] run data modify entity @s Item set value {id:written_book,count:1b,components:{written_book_content:{author:"§k_26T",title:$(title),pages:[$(content),$(rule),$(cardset1),$(cardset2),$(cardset3),$(cardset4),{text:"§l准备§r\n\n§7  点击下面的选项准备，点击前请再次确认所选的卡组！\n\n\n\n\n\n\n\n        ",extra:[{text:"【§b蓝方§r准备】",hover_event:{action:"show_text",value:"点击准备，点击前请再次确认所选的卡组！"},click_event:{action:"run_command",command:"/function cacardwar:preparation/ready {team:blue,opptext:\"6红\",text:\"b蓝\"}"}}]}]},custom_data:{cacardwar:book}}}
$execute as @e[tag=cacard.red5] run data modify entity @s Item set value {id:written_book,count:1b,components:{written_book_content:{author:"§k_26T",title:$(title),pages:[$(content),$(rule),$(cardset1),$(cardset2),$(cardset3),$(cardset4),{text:"§l准备§r\n\n§7  点击下面的选项准备，点击前请再次确认所选的卡组！\n\n\n\n\n\n\n\n        ",extra:[{text:"【§6红方§r准备】",hover_event:{action:"show_text",value:"点击准备，点击前请再次确认所选的卡组！"},click_event:{action:"run_command",command:"/function cacardwar:preparation/ready {team:red,opptext:\"b蓝\",text:\"6红\"}"}}]}]},custom_data:{cacardwar:book}}}

execute as @a[tag=cacard.ingame] run function cacardwar:main/clear_all_item
playsound minecraft:block.note_block.harp master @s ~ ~ ~ 2 0.3 1
title @a[tag=cacard.ingame] actionbar {text:"§e§l已重置！"}
scoreboard players set #cacard.time cacard.isongoing 0
scoreboard players set #cacard.time cacard.gameSeed 0
scoreboard players set @a[tag=cacard.ready] cacard.cardcount 0
scoreboard players set @a[tag=cacard.ready] cacard.gameSeed 0
scoreboard players set @a[tag=cacard.ready] cacard.shieldtype 0
scoreboard players set @a[tag=cacard.ready] cacard.mineral_clump 0
execute as @a run function cacardwar:main/remove_all_tag
scoreboard players set @a[tag=cacard.ingame] cacard.point 0
bossbar remove cacardwar:bluehealth
bossbar remove cacardwar:redhealth
scoreboard players set #cacard.blueHealth cacard.health 0
scoreboard players set #cacard.redHealth cacard.health 0
team empty CacardwarPlayers
scoreboard objectives remove cacard.Info
scoreboard objectives remove cacard.newPlayer
scoreboard objectives remove cacard.basicTuition