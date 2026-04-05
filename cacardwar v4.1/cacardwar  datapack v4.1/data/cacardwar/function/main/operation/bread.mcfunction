$execute if entity @a[tag=cacard.$(team)Team,tag=!cacard.hungry] at @e[tag=cacard.$(team)5] run particle heart ~ ~2 ~ 0.2 0.2 0.2 0.1 5 normal
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.hungry] at @e[tag=cacard.$(team)5] run particle heart ~ ~2 ~ 0.2 0.2 0.2 0.1 2 normal

$execute as @e[tag=cacard.$(team)] run data remove entity @s Item 
$tellraw @a[tag=cacard.ingame] [{text:"\n \u00a77[\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a77]   \u00a7$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"\u00a7e合成了"},{text:"面包",color:"#c2af1e"},{text:"   \u00a77[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"\u00a77]"}]}]

$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_any}
$function cacardwar:main/others/advancements {team:$(team),advancementype:regenerate_any}\

$execute if entity @a[tag=cacard.$(team)Team,tag=!cacard.hungry] run scoreboard players add #cacard.$(team)Health cacard.health 5
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.hungry] run scoreboard players add #cacard.$(team)Health cacard.health 2
$tag @a[tag=cacard.$(team)Team,tag=cacard.hungry] remove cacard.hungry