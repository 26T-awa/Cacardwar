$execute if entity @a[tag=cacard.$(team)Team,tag=!cacard.hungry] at @e[tag=cacard.$(team)5] run particle heart ~ ~2 ~ 0.2 0.2 0.2 0.1 3 normal
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.hungry] at @e[tag=cacard.$(team)5] run particle heart ~ ~2 ~ 0.2 0.2 0.2 0.1 1 normal

$data remove entity @e[tag=cacard.$(team)2,limit=1] Item
$tellraw @a[tag=cacard.ingame] [{text:"\n \u00a77[\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a77]   \u00a7$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"\u00a7e使用了\u00a7c苹果"},{text:"   \u00a77[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"\u00a77]"}]}]

$function cacardwar:main/others/advancements {team:$(team),advancementype:regenerate_any}

$execute if entity @a[tag=cacard.$(team)Team,tag=!cacard.hungry] run scoreboard players add #cacard.$(team)Health cacard.health 3
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.hungry] run scoreboard players add #cacard.$(team)Health cacard.health 1
$tag @a[tag=cacard.$(team)Team,tag=cacard.hungry] remove cacard.hungry