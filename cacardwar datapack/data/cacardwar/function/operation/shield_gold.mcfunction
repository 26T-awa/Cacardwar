$execute at @e[tag=cacard.$(team)5] run playsound block.anvil.land master @a[tag=cacard.ingame] ~ ~ ~ 1.5 0.7 1

$execute as @e[tag=cacard.$(team),tag=!cacard.disabled] run data remove entity @s Item
$tellraw @a[tag=cacard.ingame] [{text:"\n §7[§b§l牌§6§l牌§r§a大作战§7]   §$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"§e合成了§6金盾牌"},{text:"   §7[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"§7]"}]}]

$scoreboard players set @a[tag=cacard.$(team)Team,scores={cacard.shieldtype=0}] cacard.shieldtype 2
$scoreboard players set @a[tag=cacard.$(team)Team,scores={cacard.shieldtype=1}] cacard.shieldtype 4
$scoreboard players set @a[tag=cacard.$(team)Team,scores={cacard.shieldtype=3}] cacard.shieldtype 6
$scoreboard players set @a[tag=cacard.$(team)Team,scores={cacard.shieldtype=5}] cacard.shieldtype 7

$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_any}
$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_shield}

$execute as @a[tag=cacard.$(team)Team,scores={cacard.shieldtype=7}] run function cacardwar:main/others/advancements {team:$(team),advancementype:full_shield}