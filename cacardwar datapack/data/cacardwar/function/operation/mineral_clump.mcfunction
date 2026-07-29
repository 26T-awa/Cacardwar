
$execute at @e[tag=cacard.$(team)5] run playsound block.anvil.use master @a[tag=cacard.ingame] ~ ~ ~ 0.5 0.9 0.5

$execute as @e[tag=cacard.$(team),tag=!cacard.disabled] run data remove entity @s Item
$tellraw @a[tag=cacard.ingame] [{text:"\n §7[§b§l牌§6§l牌§r§a大作战§7]   §$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"§e合成了矿物质团"},{text:"   §7[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"§7]"}]}]

$scoreboard players add @a[tag=cacard.$(team)Team] cacard.mineral_clump 1