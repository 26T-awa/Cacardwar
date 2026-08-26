execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players set #cacard.ai_reward_arg2 cacard.point 0
execute if score #cacard.time cacard.isongoing matches 5 run function cacardwar:ai/calculation/rule1 {arg1:1}

$execute if entity @a[tag=cacard.$(team)Team,tag=!cacard.hungry] at @e[tag=cacard.$(team)5] run particle heart ~ ~2 ~ 0.2 0.2 0.2 0.1 2 normal
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.hungry] at @e[tag=cacard.$(team)5] run particle heart ~ ~2 ~ 0.2 0.2 0.2 0.1 1 normal
$execute at @e[tag=cacard.$(team)5] run particle dust_color_transition{from_color:[0.5,0.85,0],scale:2,to_color:[0.35,0.2,0]} ~ ~2 ~ 0.2 0.2 0.2 0 20 normal

$data remove entity @e[tag=cacard.$(team)2,limit=1] Item
$tellraw @a[tag=cacard.ingame] [{text:"\n §7[§b§l牌§6§l牌§r§a大作战§7]   §$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"§e使用了§4腐肉"},{text:"   §7[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"§7]"}]}]

$function cacardwar:main/others/advancements {team:$(team),advancementype:regenerate_any}
$function cacardwar:main/others/advancements {team:$(team),advancementype:eat_rotten_flesh}

$execute if entity @a[tag=cacard.$(team)Team,tag=!cacard.hungry] run scoreboard players add #cacard.$(team)Health cacard.health 2
$execute if entity @a[tag=cacard.$(team)Team,tag=cacard.hungry] run scoreboard players add #cacard.$(team)Health cacard.health 1
execute if score #cacard.time cacard.isongoing matches 5 if entity @a[tag=cacard.inAImode,limit=1,tag=cacard.hungry] if score #cacard.blueHealth cacard.health matches 13..16 run function cacardwar:ai/calculation/rule10 {arg1:1,arg2:1,arg3:0}
execute if score #cacard.time cacard.isongoing matches 5 if entity @a[tag=cacard.inAImode,limit=1,tag=cacard.hungry] if score #cacard.blueHealth cacard.health matches 17.. run function cacardwar:ai/calculation/rule10 {arg1:1,arg2:1,arg3:1}
execute if score #cacard.time cacard.isongoing matches 5 if entity @a[tag=cacard.inAImode,limit=1,tag=cacard.hungry] if score #cacard.blueHealth cacard.health matches 0..12 run function cacardwar:ai/calculation/rule10 {arg1:1,arg2:0,arg3:0}
execute if score #cacard.time cacard.isongoing matches 5 if entity @a[tag=cacard.inAImode,limit=1,tag=!cacard.hungry] if score #cacard.blueHealth cacard.health matches 13..16 run function cacardwar:ai/calculation/rule10 {arg1:2,arg2:1,arg3:0}
execute if score #cacard.time cacard.isongoing matches 5 if entity @a[tag=cacard.inAImode,limit=1,tag=!cacard.hungry] if score #cacard.blueHealth cacard.health matches 17.. run function cacardwar:ai/calculation/rule10 {arg1:2,arg2:1,arg3:1}
execute if score #cacard.time cacard.isongoing matches 5 if entity @a[tag=cacard.inAImode,limit=1,tag=!cacard.hungry] if score #cacard.blueHealth cacard.health matches 0..12 run function cacardwar:ai/calculation/rule10 {arg1:2,arg2:0,arg3:0}
$tag @a[tag=cacard.$(team)Team,tag=cacard.hungry] remove cacard.hungry
$tag @a[tag=cacard.$(team)Team,tag=!cacard.hungry] add cacard.hungry
execute if score #cacard.time cacard.isongoing matches 5 run function cacardwar:ai/calculation/rule7 {arg1:0}

execute if score #cacard.time cacard.isongoing matches 5 run schedule function cacardwar:ai/constructor/cst_after 10t