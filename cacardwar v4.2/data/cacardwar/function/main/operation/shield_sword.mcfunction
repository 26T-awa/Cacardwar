$execute at @e[tag=cacard.$(team)5] run playsound block.anvil.land master @a[tag=cacard.ingame] ~ ~ ~ 1.5 0.7 1

$execute as @e[tag=cacard.$(team)] run data remove entity @s Item 
$tellraw @a[tag=cacard.ingame] [{text:"\n \u00a77[\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a77]   \u00a7$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"\u00a7e合成了\u00a7f铁盾牌"},{text:"   \u00a77[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"\u00a77]"}]}]
$scoreboard players add @a[tag=cacard.$(team)Team,tag=!cacard.shield_sword] cacard.shield.count 1

$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_any}
$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_shield}

$tag @a[tag=cacard.$(team)Team,tag=!cacard.shield_sword] add cacard.shield_sword
$execute as @a[tag=cacard.$(team)Team,tag=cacard.shield_fire,tag=cacard.shield_sword] run function cacardwar:main/others/advancements {team:$(team),advancementype:full_shield}