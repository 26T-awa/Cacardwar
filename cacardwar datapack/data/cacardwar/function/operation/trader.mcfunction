#COUNT:4, LIFE:4
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players set #cacard.ai_reward_arg2 cacard.point 0
execute if score #cacard.time cacard.isongoing matches 5 as @e[tag=cacard.blue] if items entity @s contents * run scoreboard players add #cacard.ai_reward_arg2 cacard.point 1
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players remove #cacard.ai_reward_arg2 cacard.point 4
execute if score #cacard.time cacard.isongoing matches 5 run function cacardwar:ai/calculation/rule1 {arg1:4}

$execute at @e[tag=cacard.$(team)5] run playsound entity.wandering_trader.yes master @a[tag=cacard.ingame] ~ ~ ~ 2 0.8 1

$execute as @e[tag=cacard.$(team),tag=!cacard.disabled] run data remove entity @s Item
$tellraw @a[tag=cacard.ingame] [{text:"\n §7[§b§l牌§6§l牌§r§a大作战§7]   §$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"§e召唤了§3商人"},{text:"   §7[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"§7]"}]}]

$execute as @e[tag=cacard.$(team)Plot1] at @s positioned ~ ~.2 ~ if entity @e[distance=...2] as @e[tag=cacard.$(team)Plot2] at @s positioned ~ ~.2 ~ if entity @e[distance=...2] as @e[tag=cacard.$(team)Plot3] at @s positioned ~ ~.2 ~ if entity @e[distance=...2] store success score #cacard.ai_reward_arg5 cacard.point run scoreboard players add @e[tag=cacard.$(team)Trader] cacard.summonleft 1
execute if score #cacard.time cacard.isongoing matches 5 if score #cacard.ai_reward_arg5 cacard.point matches 1 run function cacardwar:ai/calculation/rule3 {arg1:0,arg2:1,arg3:0,arg4:0,arg5:1}
$execute as @e[tag=cacard.$(team)Plot1] at @s positioned ~ ~.2 ~ if entity @e[distance=...2] as @e[tag=cacard.$(team)Plot2] at @s positioned ~ ~.2 ~ if entity @e[distance=...2] as @e[tag=cacard.$(team)Plot3] at @s positioned ~ ~.2 ~ unless entity @e[distance=...2] store success score #cacard.ai_reward_arg5 cacard.point run summon wandering_trader ~ ~-.0125 ~ {NoAI:true,Silent:true,Invulnerable:true,Rotation:[$(rotation),0],Tags:["cacard.$(team)Trader","cacard.$(team)Summon3","cacard.tosummon","cacard.summoner","cacard.Trader"],DeathLootTable:"",Offers:{}}
$execute as @e[tag=cacard.$(team)Plot1] at @s positioned ~ ~.2 ~ if entity @e[distance=...2] as @e[tag=cacard.$(team)Plot2] at @s positioned ~ ~.2 ~ unless entity @e[distance=...2] store success score #cacard.ai_reward_arg5 cacard.point run summon wandering_trader ~ ~-.0125 ~ {NoAI:true,Silent:true,Invulnerable:true,Rotation:[$(rotation),0],Tags:["cacard.$(team)Trader","cacard.$(team)Summon2","cacard.tosummon","cacard.summoner","cacard.Trader"],DeathLootTable:"",Offers:{}}
$execute as @e[tag=cacard.$(team)Plot1] at @s positioned ~ ~.2 ~ unless entity @e[distance=...2] store success score #cacard.ai_reward_arg5 cacard.point run summon wandering_trader ~ ~-.0125 ~ {NoAI:true,Silent:true,Invulnerable:true,Rotation:[$(rotation),0],Tags:["cacard.$(team)Trader","cacard.$(team)Summon1","cacard.tosummon","cacard.summoner","cacard.Trader"],DeathLootTable:"",Offers:{}}
execute if score #cacard.time cacard.isongoing matches 5 if score #cacard.ai_reward_arg5 cacard.point matches 1 run function cacardwar:ai/calculation/rule3 {arg1:0,arg2:1,arg3:0,arg4:0,arg5:0}
execute if score #cacard.time cacard.isongoing matches 5 unless score #cacard.ai_reward_arg5 cacard.point matches 1 run function cacardwar:ai/calculation/rule3 {arg1:0,arg2:1,arg3:0,arg4:0,arg5:100}

$execute as @e[tag=cacard.$(team)Plot1] at @s positioned ~ ~.2 ~ if entity @e[distance=...2] as @e[tag=cacard.$(team)Plot2] at @s positioned ~ ~.2 ~ if entity @e[distance=...2] as @e[tag=cacard.$(team)Plot3] at @s positioned ~ ~.2 ~ if entity @e[distance=...2] run function cacardwar:main/others/advancements {team:$(team),advancementype:summon_full}
$function cacardwar:main/others/advancements {team:$(team),advancementype:summon_any}

execute if score #cacard.time cacard.isongoing matches 5 run schedule function cacardwar:ai/constructor/cst_after 10t