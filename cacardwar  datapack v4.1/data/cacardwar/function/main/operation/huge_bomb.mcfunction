$execute if entity @a[tag=cacard.$(oppteam)Team,tag=!cacard.shield_fire] at @e[tag=cacard.$(oppteam)5] run particle damage_indicator ~ ~2 ~ 0.2 0.2 0.2 0.1 16 normal
$execute if entity @a[tag=cacard.$(oppteam)Team,tag=cacard.shield_fire] at @e[tag=cacard.$(oppteam)5] run particle damage_indicator ~ ~2 ~ 0.2 0.2 0.2 0.1 2 normal
$execute at @e[tag=cacard.$(oppteam)5] run playsound entity.generic.explode master @a[tag=cacard.ingame] ~ ~ ~ 2 1 1
$execute at @e[tag=cacard.$(oppteam)5] run particle explosion_emitter ~ ~2 ~ 0.2 0.2 0.2 1 10 normal
$execute at @e[tag=cacard.$(oppteam)5] run particle flame ~ ~2 ~ 0.2 0.2 0.2 1 10 normal

$execute as @e[tag=cacard.$(team)] run data remove entity @s Item 
$tellraw @a[tag=cacard.ingame] [{text:"\n \u00a77[\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a77]   \u00a7$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"\u00a7e合成了\u00a74巨型炸药桶"},{text:"   \u00a77[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"\u00a77]"}]}]

$function cacardwar:main/others/advancements {team:$(team),advancementype:bypass_shield}
$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_any}
$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_huge_bomb}

$execute if entity @a[tag=cacard.$(oppteam)Team,tag=!cacard.shield_fire] run scoreboard players remove #cacard.$(oppteam)Health cacard.health 16
$execute if entity @a[tag=cacard.$(oppteam)Team,tag=cacard.shield_fire] run scoreboard players remove #cacard.$(oppteam)Health cacard.health 2
$execute if entity @a[tag=cacard.$(oppteam)Team,tag=cacard.shield_sword] run function cacardwar:main/others/advancements {team:$(team),advancementype:break_sword_shield}
$function cacardwar:main/others/break_shield_fire {oppteam:$(oppteam)}
$function cacardwar:main/others/break_shield_sword {oppteam:$(oppteam)}