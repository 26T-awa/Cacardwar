execute at @e[tag=cacard.red5] run playsound block.anvil.land master @a[tag=cacard.ingame] ~ ~ ~ 1.5 0.7 1
tag @a[tag=cacard.redTeam,tag=!cacard.shield_sword] add cacard.shield_sword
execute as @e[tag=cacard.red] run data modify entity @s Item set value {}
tellraw @a[tag=cacard.ingame] [{text:"\n \u00a77[\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a77]   \u00a76红方"},{selector:"@a[tag=cacard.redTeam,limit=1]",color:gold,underlined:true},{text:"\u00a7e合成了\u00a73铁盾牌"},{text:"   \u00a77[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"\u00a77]"}]}]
execute as @a[tag=cacard.redTeam,advancements={cacardwar:craft_any=false}] run advancement grant @s only cacardwar:craft_any
execute as @a[tag=cacard.redTeam,advancements={cacardwar:craft_shield=false}] run advancement grant @s only cacardwar:craft_shield