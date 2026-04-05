execute at @e[tag=cacard.blue5] run particle happy_villager ~ ~2 ~ 0.2 0.2 0.2 0.1 10 normal
loot give @a[tag=cacard.blueTeam,tag=cacard.attack] loot cacardwar:2/attack
loot give @a[tag=cacard.blueTeam,tag=cacard.average] loot cacardwar:2/average
loot give @a[tag=cacard.blueTeam,tag=cacard.resist] loot cacardwar:2/resist
data modify entity @e[tag=cacard.blue2,limit=1] Item set value {}
tellraw @a[tag=cacard.ingame] [{text:"\n \u00a77[\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a77]   \u00a7b蓝方"},{selector:"@a[tag=cacard.blueTeam,limit=1]",color:aqua,underlined:true},{text:"\u00a7e使用了\u00a7a五谷丰登"},{text:"   \u00a77[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"\u00a77]"}]}]