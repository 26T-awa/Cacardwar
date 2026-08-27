execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players set #cacard.ai_reward_arg2 cacard.point 0
execute if score #cacard.time cacard.isongoing matches 5 as @e[tag=cacard.blue] if items entity @s contents * run scoreboard players add #cacard.ai_reward_arg2 cacard.point 1
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players remove #cacard.ai_reward_arg2 cacard.point 7
execute if score #cacard.time cacard.isongoing matches 5 run function cacardwar:ai/calculation/rule1 {arg1:7}

$execute at @e[tag=cacard.$(team)5] run playsound block.anvil.land master @a[tag=cacard.ingame] ~ ~ ~ 1.5 0.7 1

$execute as @e[tag=cacard.$(team),tag=!cacard.disabled] run data remove entity @s Item
$tellraw @a[tag=cacard.ingame] [{text:"\n §7[§b§l牌§6§l牌§r§a大作战§7]   §$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"§e合成了§f铁盾牌"},{text:"   §7[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"§7]"}]}]

$scoreboard players set @a[tag=cacard.$(team)Team,scores={cacard.shieldtype=0}] cacard.shieldtype 1
$scoreboard players set @a[tag=cacard.$(team)Team,scores={cacard.shieldtype=2}] cacard.shieldtype 4
$scoreboard players set @a[tag=cacard.$(team)Team,scores={cacard.shieldtype=3}] cacard.shieldtype 5
$scoreboard players set @a[tag=cacard.$(team)Team,scores={cacard.shieldtype=6}] cacard.shieldtype 7
execute if score #cacard.time cacard.isongoing matches 5 if score @a[tag=cacard.inAImode,limit=1] cacard.shieldtype matches 1 run function cacardwar:ai/calculation/rule2 {arg1:1}
execute if score #cacard.time cacard.isongoing matches 5 if score @a[tag=cacard.inAImode,limit=1] cacard.shieldtype matches 4..5 run function cacardwar:ai/calculation/rule2 {arg1:1}
execute if score #cacard.time cacard.isongoing matches 5 if score @a[tag=cacard.inAImode,limit=1] cacard.shieldtype matches 7 run function cacardwar:ai/calculation/rule2 {arg1:1}
execute if score #cacard.time cacard.isongoing matches 5 if score @a[tag=cacard.inAImode,limit=1] cacard.shieldtype matches 0 run function cacardwar:ai/calculation/rule2 {arg1:0}
execute if score #cacard.time cacard.isongoing matches 5 if score @a[tag=cacard.inAImode,limit=1] cacard.shieldtype matches 2..3 run function cacardwar:ai/calculation/rule2 {arg1:0}
execute if score #cacard.time cacard.isongoing matches 5 if score @a[tag=cacard.inAImode,limit=1] cacard.shieldtype matches 6 run function cacardwar:ai/calculation/rule2 {arg1:0}

$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_any}
$function cacardwar:main/others/advancements {team:$(team),advancementype:craft_shield}

$execute as @a[tag=cacard.$(team)Team,scores={cacard.shieldtype=7}] run function cacardwar:main/others/advancements {team:$(team),advancementype:full_shield}

execute if score #cacard.time cacard.isongoing matches 5 run schedule function cacardwar:ai/constructor/cst_after 10t