execute at @e[tag=cacard.blue5] run playsound block.anvil.land master @a[tag=cacard.ingame] ~ ~ ~ 1.5 0.7 1
tag @a[tag=cacard.blueTeam,tag=!cacard.shield] add cacard.shield
execute as @e[tag=cacard.blue] run data modify entity @s Item set value {}
tellraw @a[tag=cacard.ingame] [{text:"\n \u00a77[\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a77]   \u00a7b蓝方"},{selector:"@a[tag=cacard.blueTeam,limit=1]",color:aqua,underlined:true},{text:"\u00a7e合成了\u00a73盾牌"},{text:"   \u00a77[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"\u00a77]"}]}]
execute as @a[tag=cacard.blueTeam,advancements={cacardwar:craft_any=false}] run advancement grant @s only cacardwar:craft_any
execute as @a[tag=cacard.blueTeam,advancements={cacardwar:craft_shield=false}] run advancement grant @s only cacardwar:craft_shield