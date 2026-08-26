execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players set #cacard.ai_reward_arg2 cacard.point 0
execute if score #cacard.time cacard.isongoing matches 5 run function cacardwar:ai/calculation/rule1 {arg1:9}

$execute if entity @a[tag=cacard.$(oppteam)Team,tag=!cacard.shield_fire] at @e[tag=cacard.$(oppteam)5] run particle damage_indicator ~ ~2 ~ 0.2 0.2 0.2 0.1 8 normal
$execute at @e[tag=cacard.$(oppteam)5] run playsound entity.generic.explode master @a[tag=cacard.ingame] ~ ~ ~ 0.6 1 0.6
$execute if entity @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=1..7}] at @e[tag=cacard.$(oppteam)5] run playsound item.shield.break master @a[tag=cacard.ingame] ~ ~ ~ 2 1.2 1
$execute at @e[tag=cacard.$(oppteam)5] run particle explosion ~ ~2 ~ 0.2 0.2 0.2 1 4 normal
$execute at @e[tag=cacard.$(oppteam)5] run particle flame ~ ~2 ~ 0.2 0.2 0.2 1 10 normal

$execute as @e[tag=cacard.$(team),tag=!cacard.disabled] run data remove entity @s Item
$tellraw @a[tag=cacard.ingame] [{text:"\n §7[§b§l牌§6§l牌§r§a大作战§7]   §$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"§e合成了§c炸药桶"},{text:"   §7[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"§7]"}]}]

$execute if entity @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=1}] run function cacardwar:main/others/advancements {team:$(team),advancementype:bypass_shield}
$execute if entity @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=2}] run function cacardwar:main/others/advancements {team:$(oppteam),advancementype:anti_fire}
$execute if entity @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=4}] run function cacardwar:main/others/advancements {team:$(oppteam),advancementype:anti_fire}
$execute if entity @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=6..7}] run function cacardwar:main/others/advancements {team:$(oppteam),advancementype:anti_fire}
$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_any}

$execute if entity @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=0..1}] run scoreboard players remove #cacard.$(oppteam)Health cacard.health 7
execute if score #cacard.time cacard.isongoing matches 5 if score #cacard.redHealth cacard.health matches 5..9 run function cacardwar:ai/calculation/rule9 {arg1:7,arg2:1,arg3:0}
execute if score #cacard.time cacard.isongoing matches 5 if score #cacard.redHealth cacard.health matches ..4 run function cacardwar:ai/calculation/rule9 {arg1:7,arg2:1,arg3:1}

$scoreboard players set @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=1..4}] cacard.shieldtype 0 
$scoreboard players set @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=5}] cacard.shieldtype 1
$scoreboard players set @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=6}] cacard.shieldtype 2
$scoreboard players set @a[tag=cacard.$(oppteam)Team,scores={cacard.shieldtype=7}] cacard.shieldtype 4

execute if score #cacard.time cacard.isongoing matches 5 run schedule function cacardwar:ai/constructor/cst_after 10t