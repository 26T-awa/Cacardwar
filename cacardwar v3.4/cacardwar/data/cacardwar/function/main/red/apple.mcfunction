execute if entity @a[tag=cacard.redTeam,tag=!cacard.hungry] at @e[tag=cacard.red5] run particle heart ~ ~2 ~ 0.2 0.2 0.2 0.1 3 normal
execute if entity @a[tag=cacard.redTeam,tag=cacard.hungry] at @e[tag=cacard.red5] run particle heart ~ ~2 ~ 0.2 0.2 0.2 0.1 1 normal
execute if entity @a[tag=cacard.redTeam,tag=!cacard.hungry] run scoreboard players add #cacard.redHealth cacard.health 3
execute if entity @a[tag=cacard.redTeam,tag=cacard.hungry] run scoreboard players add #cacard.redHealth cacard.health 1
tag @a[tag=cacard.redTeam,tag=cacard.hungry] remove cacard.hungry
data modify entity @e[tag=cacard.red2,limit=1] Item set value {}
tellraw @a[tag=cacard.ingame] [{text:"\n \u00a77[\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a77]   \u00a76红方"},{selector:"@a[tag=cacard.redTeam,limit=1]",color:gold,underlined:true},{text:"\u00a7e使用了\u00a7c苹果"},{text:"   \u00a77[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"\u00a77]"}]}]
execute as @a[tag=cacard.redTeam,advancements={cacardwar:regenerate_any=false}] run advancement grant @s only cacardwar:regenerate_any