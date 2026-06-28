$execute if entity @a[tag=cacard.$(oppteam)Team,tag=!cacard.shield_sword] at @e[tag=cacard.$(oppteam)5] run particle damage_indicator ~ ~2 ~ 0.2 0.2 0.2 0.1 6 normal
$execute at @e[tag=cacard.$(oppteam)5] run playsound entity.player.attack.sweep master @a[tag=cacard.ingame] ~ ~ ~ 2 1 1
$execute at @e[tag=cacard.$(oppteam)5] run particle sweep_attack ~ ~2 ~ 0.2 0.2 0.2 0.1 1 normal

$execute as @e[tag=cacard.$(team)] run data remove entity @s Item 
$tellraw @a[tag=cacard.ingame] [{text:"\n \u00a77[\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a77]   \u00a7$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"\u00a7e合成了\u00a7f铁剑"},{text:"   \u00a77[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"\u00a77]"}]}]

$execute if entity @a[tag=cacard.$(oppteam)Team,tag=!cacard.shield_sword,tag=cacard.shield_fire] run function cacardwar:main/others/advancements {team:$(team),advancementype:bypass_shield}
$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_any}

$execute if entity @a[tag=cacard.$(oppteam)Team,tag=!cacard.shield_sword] run scoreboard players remove #cacard.$(oppteam)Health cacard.health 6
$function cacardwar:main/others/break_shield_sword {oppteam:$(oppteam)}