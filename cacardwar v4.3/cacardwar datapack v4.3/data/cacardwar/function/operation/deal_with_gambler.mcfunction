$execute at @e[tag=cacard.$(team)5] run particle witch ~ ~2 ~ 0.2 0.2 0.2 0.1 10 normal
$execute at @e[tag=cacard.$(oppteam)5] run particle damage_indicator ~ ~2 ~ 0.2 0.2 0.2 0.1 5 normal

$execute as @e[tag=cacard.$(team)] run data remove entity @s Item 
$execute as @e[tag=cacard.$(team)0] run data remove entity @s Item 
$tellraw @a[tag=cacard.ingame] [{text:"\n \u00a77[\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a77]   \u00a7$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"\u00a7e使用了\u00a75赌徒的交易"},{text:"   \u00a77[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"\u00a77]"}]}]

$function cacardwar:main/others/advancements {team:$(team),advancementype:use_deal_with_gambler}

$execute as @a[tag=cacard.$(team)Team] run function cacardwar:main/clear_item
$scoreboard players add @a[tag=cacard.$(team)Team] cacard.point 3
$scoreboard players operation #cacard.$(oppteam)Health cacard.health /= #cacard.i cacard.health 