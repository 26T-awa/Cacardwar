execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players set #cacard.ai_reward_arg2 cacard.point 0
execute if score #cacard.time cacard.isongoing matches 5 as @e[tag=cacard.blue] if items entity @s contents * run scoreboard players add #cacard.ai_reward_arg2 cacard.point 1
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players remove #cacard.ai_reward_arg2 cacard.point 3
execute if score #cacard.time cacard.isongoing matches 5 run function cacardwar:ai/calculation/rule1 {arg1:3}

$execute at @e[tag=cacard.$(team)5] run particle heart ~ ~2 ~ 0.2 0.2 0.2 0.1 9 normal

$execute as @e[tag=cacard.$(team),tag=!cacard.disabled] run data remove entity @s Item
$tellraw @a[tag=cacard.ingame] [{text:"\n §7[§b§l牌§6§l牌§r§a大作战§7]   §$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"§e使用了"},{text:"新生的面包",color:"green"},{text:"   §7[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"§7]"}]}]

$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_any}
$function cacardwar:main/others/advancements {team:$(team),advancementype:regenerate_any}

$scoreboard players add #cacard.$(team)Health cacard.health 9
execute if score #cacard.time cacard.isongoing matches 5 if score #cacard.blueHealth cacard.health matches 13..16 run function cacardwar:ai/calculation/rule10 {arg1:9,arg2:1,arg3:0}
execute if score #cacard.time cacard.isongoing matches 5 if score #cacard.blueHealth cacard.health matches 17.. run function cacardwar:ai/calculation/rule10 {arg1:9,arg2:1,arg3:1}
execute if score #cacard.time cacard.isongoing matches 5 if score #cacard.blueHealth cacard.health matches 0..12 run function cacardwar:ai/calculation/rule10 {arg1:9,arg2:0,arg3:0}
$tag @a[tag=cacard.$(team)Team,tag=cacard.hungry] remove cacard.hungry

execute if score #cacard.time cacard.isongoing matches 5 run schedule function cacardwar:ai/constructor/cst_after 10t