execute if entity @a[tag=cacard.redTeam,tag=!cacard.shield_sword] at @e[tag=cacard.red5] run particle damage_indicator ~ ~2 ~ 0.2 0.2 0.2 0.1 6 normal
execute at @e[tag=cacard.red5] run playsound entity.player.attack.sweep master @a[tag=cacard.ingame] ~ ~ ~ 2 1 1
execute at @e[tag=cacard.red5] run particle sweep_attack ~ ~2 ~ 0.2 0.2 0.2 0.1 1 normal
execute if entity @a[tag=cacard.redTeam,tag=!cacard.shield_sword] run scoreboard players remove #cacard.redHealth cacard.health 6
execute if entity @a[tag=cacard.redTeam,tag=cacard.shield_sword] at @e[tag=cacard.red5] run playsound item.shield.block master @a[tag=cacard.ingame] ~ ~ ~ 2 1 1
execute if entity @a[tag=cacard.redTeam,tag=cacard.shield_sword] at @e[tag=cacard.red5] run playsound item.shield.break master @a[tag=cacard.ingame] ~ ~ ~ 2 1 1
tag @a[tag=cacard.redTeam,tag=cacard.shield_sword] remove cacard.shield_sword
execute as @e[tag=cacard.blue] run data modify entity @s Item set value {}
tellraw @a[tag=cacard.ingame] [{text:"\n \u00a77[\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a77]   \u00a7b蓝方"},{selector:"@a[tag=cacard.blueTeam,limit=1]",color:aqua,underlined:true},{text:"\u00a7e合成了\u00a7f铁剑"},{text:"   \u00a77[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"\u00a77]"}]}]
execute as @a[tag=cacard.blueTeam,advancements={cacardwar:craft_any=false}] run advancement grant @s only cacardwar:craft_any