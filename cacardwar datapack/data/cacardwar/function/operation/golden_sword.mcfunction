$execute if entity @a[tag=cacard.$(oppteam)Team,tag=!cacard.shield_sword] at @e[tag=cacard.$(oppteam)5] run particle damage_indicator ~ ~2 ~ 0.2 0.2 0.2 0.1 5 normal
$execute at @e[tag=cacard.$(oppteam)5] run playsound entity.player.attack.sweep master @a[tag=cacard.ingame] ~ ~ ~ 2 1 1
$execute if entity @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=1}] at @e[tag=cacard.$(oppteam)5] run playsound item.shield.break master @a[tag=cacard.ingame] ~ ~ ~ 2 1 1
$execute if entity @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=3..7}] at @e[tag=cacard.$(oppteam)5] run playsound item.shield.break master @a[tag=cacard.ingame] ~ ~ ~ 2 1 1
$execute at @e[tag=cacard.$(oppteam)5] run particle sweep_attack ~ ~2 ~ 0.2 0.2 0.2 0.1 1 normal

$execute as @e[tag=cacard.$(team),tag=!cacard.disabled] run data remove entity @s Item
$tellraw @a[tag=cacard.ingame] [{text:"\n §7[§b§l牌§6§l牌§r§a大作战§7]   §$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"§e合成了§6金剑"},{text:"   §7[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"§7]"}]}]

$execute if entity @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=2}] run function cacardwar:main/others/advancements {team:$(team),advancementype:bypass_shield}
$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_any}

$execute if entity @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=0}] run scoreboard players remove #cacard.$(oppteam)Health cacard.health 4
$execute if entity @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=2}] run scoreboard players remove #cacard.$(oppteam)Health cacard.health 4

$scoreboard players set @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=1}] cacard.shieldtype 0 
$scoreboard players set @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=3}] cacard.shieldtype 0 
$scoreboard players set @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=4}] cacard.shieldtype 2
$scoreboard players set @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=5}] cacard.shieldtype 1
$scoreboard players set @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=6}] cacard.shieldtype 2
$scoreboard players set @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=7}] cacard.shieldtype 4