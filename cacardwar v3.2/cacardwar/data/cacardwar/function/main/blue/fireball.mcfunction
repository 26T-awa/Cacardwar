execute at @e[tag=cacard.red5] run particle damage_indicator ~ ~2 ~ 0.2 0.2 0.2 0.1 5 normal
execute at @e[tag=cacard.red5] run playsound item.firecharge.use master @a[tag=cacard.ingame] ~ ~ ~ 2 1 1
execute at @e[tag=cacard.red5] run particle flame ~ ~2 ~ 0.2 0.2 0.2 1 10 normal
scoreboard players remove #cacard.redHealth cacard.health 7
execute if entity @a[tag=cacard.redTeam,tag=cacard.shield] as @a[tag=cacard.blueTeam,advancements={cacardwar:break_shield=false}] run advancement grant @s only cacardwar:break_shield
tag @a[tag=cacard.blueTeam,tag=cacard.shield] remove cacard.shield
execute as @e[tag=cacard.blue] run data modify entity @s Item set value {}
tellraw @a[tag=cacard.ingame] [{text:"\n \u00a77[\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a77]   \u00a7b蓝方"},{selector:"@a[tag=cacard.blueTeam,limit=1]",color:aqua,underlined:true},{text:"\u00a7e合成了\u00a7e小火弹"},{text:"   \u00a77[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"\u00a77]"}]}]
execute as @a[tag=cacard.blueTeam,advancements={cacardwar:craft_any=false}] run advancement grant @s only cacardwar:craft_any