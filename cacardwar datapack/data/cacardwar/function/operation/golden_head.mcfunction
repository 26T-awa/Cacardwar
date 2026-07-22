$execute if entity @a[tag=cacard.$(team)Team] at @e[tag=cacard.$(team)5] run particle heart ~ ~2 ~ 0.2 0.2 0.2 0.1 5 normal

$execute as @e[tag=cacard.$(team),tag=!cacard.disabled] run data remove entity @s Item
$tellraw @a[tag=cacard.ingame] [{text:"\n §7[§b§l牌§6§l牌§r§a大作战§7]   §$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"§e使用了§6金头颅"},{text:"   §7[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"§7]"}]}]

$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_any}
$function cacardwar:main/others/advancements {team:$(team),advancementype:regenerate_any}

$scoreboard players add #cacard.$(team)Health cacard.health 5
$tag @a[tag=cacard.$(team)Team] add cacard.godn_head_rege1
$tag @a[tag=cacard.$(team)Team] add cacard.regenerating
$tag @a[tag=cacard.$(team)Team,tag=cacard.hungry] remove cacard.hungry
