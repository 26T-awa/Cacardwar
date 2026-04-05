execute if entity @a[tag=cacard.blueTeam,tag=!cacard.hungry] at @e[tag=cacard.blue5] run particle heart ~ ~2 ~ 0.2 0.2 0.2 0.1 5 normal
execute if entity @a[tag=cacard.blueTeam,tag=cacard.hungry] at @e[tag=cacard.blue5] run particle heart ~ ~2 ~ 0.2 0.2 0.2 0.1 2 normal
execute if entity @a[tag=cacard.blueTeam,tag=!cacard.hungry] run scoreboard players add #cacard.blueHealth cacard.health 5
execute if entity @a[tag=cacard.blueTeam,tag=cacard.hungry] run scoreboard players add #cacard.blueHealth cacard.health 2
tag @a[tag=cacard.blueTeam,tag=cacard.hungry] remove cacard.hungry
execute as @e[tag=cacard.blue] run data modify entity @s Item set value {}
tellraw @a[tag=cacard.ingame] [{text:"\n \u00a77[\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a77]   \u00a7b蓝方"},{selector:"@a[tag=cacard.blueTeam,limit=1]",color:aqua,underlined:true},{text:"\u00a7e合成了"},{text:"面包",color:"#c2af1e"},{text:"   \u00a77[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"\u00a77]"}]}]
execute as @a[tag=cacard.blueTeam,advancements={cacardwar:craft_any=false}] run advancement grant @s only cacardwar:craft_any
execute as @a[tag=cacard.blueTeam,advancements={cacardwar:regenerate_any=false}] run advancement grant @s only cacardwar:regenerate_any