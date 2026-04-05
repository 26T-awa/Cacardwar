$execute at @e[tag=cacard.$(team)5] run playsound block.anvil.land master @a[tag=cacard.ingame] ~ ~ ~ 1.5 0.7 1

$execute as @e[tag=cacard.$(team)] run data remove entity @s Item 
$tellraw @a[tag=cacard.ingame] [{text:"\n \u00a77[\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a77]   \u00a7$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"\u00a7e合成了\u00a7f铁盾牌"},{text:"   \u00a77[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"\u00a77]"}]}]

$scoreboard players set @a[tag=cacard.$(team)Team,scores={cacard.shieldtype=0}] cacard.shieldtype 1
$scoreboard players set @a[tag=cacard.$(team)Team,scores={cacard.shieldtype=2}] cacard.shieldtype 4
$scoreboard players set @a[tag=cacard.$(team)Team,scores={cacard.shieldtype=3}] cacard.shieldtype 5
$scoreboard players set @a[tag=cacard.$(team)Team,scores={cacard.shieldtype=6}] cacard.shieldtype 7

$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_any}
$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_shield}

$execute as @a[tag=cacard.$(team)Team,scores={cacard.shieldtype=7}] run function cacardwar:main/others/advancements {team:$(team),advancementype:full_shield}