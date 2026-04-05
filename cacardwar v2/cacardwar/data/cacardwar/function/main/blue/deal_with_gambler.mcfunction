execute at @e[tag=cacard.blue5] run particle witch ~ ~2 ~ 0.2 0.2 0.2 0.1 10 normal
execute at @e[tag=cacard.red5] run particle damage_indicator ~ ~2 ~ 0.2 0.2 0.2 0.1 5 normal
execute as @a[tag=cacard.blueTeam] run function cacardwar:main/clear_item
execute as @e[tag=cacard.blue] run data modify entity @s Item set value {}
execute as @e[tag=cacard.blue0] run data modify entity @s Item set value {}
scoreboard players operation #cacard.redHealth cacard.health /= #cacard.i cacard.health 
tellraw @a[tag=cacard.ingame] [{text:"\n \u00a77[\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a77]   \u00a7b蓝方"},{selector:"@a[tag=cacard.blueTeam,limit=1]",color:aqua,underlined:true},{text:"\u00a7e使用了\u00a75赌徒的交易"},{text:"   \u00a77[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"\u00a77]"}]}]