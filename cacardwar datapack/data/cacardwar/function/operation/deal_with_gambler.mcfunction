$execute at @e[tag=cacard.$(team)5] run particle witch ~ ~2 ~ 0.2 0.2 0.2 0.1 10 normal
$execute at @e[tag=cacard.$(oppteam)5] run particle damage_indicator ~ ~2 ~ 0.2 0.2 0.2 0.1 5 normal

$execute as @e[tag=cacard.$(team)] run data remove entity @s Item 
$execute as @e[tag=cacard.$(team)0] run data remove entity @s Item 
$tellraw @a[tag=cacard.ingame] [{text:"\n §7[§b§l牌§6§l牌§r§a大作战§7]   §$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"§e使用了§5赌徒的交易"},{text:"   §7[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"§7]"}]}]

$function cacardwar:main/others/advancements {team:$(team),advancementype:use_deal}

$execute as @a[tag=cacard.$(team)Team] run function cacardwar:main/clear_item
$scoreboard players add @a[tag=cacard.$(team)Team] cacard.point 3
$scoreboard players operation #cacard.$(oppteam)Health cacard.health /= #cacard.i cacard.health 