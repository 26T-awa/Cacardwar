#DMG:4, LIFE:2
execute if score #cacard.time cacard.isongoing matches 5 run scoreboard players set #cacard.ai_reward_arg2 cacard.point 0
execute if score #cacard.time cacard.isongoing matches 5 run function cacardwar:ai/calculation/rule1 {arg1:2}

$execute at @e[tag=cacard.$(team)5] run playsound entity.zombie.ambient master @a[tag=cacard.ingame] ~ ~ ~ 2 1.3 1

$data remove entity @e[tag=cacard.$(team)2,limit=1] Item
$tellraw @a[tag=cacard.ingame] [{text:"\n §7[§b§l牌§6§l牌§r§a大作战§7]   §$(teamtext)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(teamcolor),underlined:true},{text:"§e召唤了§3僵尸"},{text:"   §7[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"§7]"}]}]

$execute as @e[tag=cacard.$(team)Plot1] at @s positioned ~ ~.2 ~ if entity @e[distance=...2] as @e[tag=cacard.$(team)Plot2] at @s positioned ~ ~.2 ~ if entity @e[distance=...2] as @e[tag=cacard.$(team)Plot3] at @s positioned ~ ~.2 ~ if entity @e[distance=...2] store success score #cacard.ai_reward_arg5 cacard.point run scoreboard players add @e[tag=cacard.$(team)Zombie] cacard.summonleft 1
execute if score #cacard.time cacard.isongoing matches 5 if score #cacard.ai_reward_arg5 cacard.point matches 1 run function cacardwar:ai/calculation/rule3 {arg1:1,arg2:0,arg3:0,arg4:0,arg5:1}
$execute as @e[tag=cacard.$(team)Plot1] at @s positioned ~ ~.2 ~ if entity @e[distance=...2] as @e[tag=cacard.$(team)Plot2] at @s positioned ~ ~.2 ~ if entity @e[distance=...2] as @e[tag=cacard.$(team)Plot3] at @s positioned ~ ~.2 ~ unless entity @e[distance=...2] store success score #cacard.ai_reward_arg5 cacard.point run summon zombie ~ ~-.0125 ~ {NoAI:true,Silent:true,equipment:{head:{id:leather_helmet,components:{dyed_color:$(zombiecolor)}}},Invulnerable:true,Rotation:[$(rotation),0],Tags:["cacard.$(team)Zombie","cacard.$(team)Summon3","cacard.tosummon","cacard.summoner","cacard.Zombie"],DeathLootTable:""}
$execute as @e[tag=cacard.$(team)Plot1] at @s positioned ~ ~.2 ~ if entity @e[distance=...2] as @e[tag=cacard.$(team)Plot2] at @s positioned ~ ~.2 ~ unless entity @e[distance=...2] store success score #cacard.ai_reward_arg5 cacard.point run summon zombie ~ ~-.0125 ~ {NoAI:true,Silent:true,equipment:{head:{id:leather_helmet,components:{dyed_color:$(zombiecolor)}}},Invulnerable:true,Rotation:[$(rotation),0],Tags:["cacard.$(team)Zombie","cacard.$(team)Summon2","cacard.tosummon","cacard.summoner","cacard.Zombie"],DeathLootTable:""}
$execute as @e[tag=cacard.$(team)Plot1] at @s positioned ~ ~.2 ~ unless entity @e[distance=...2] store success score #cacard.ai_reward_arg5 cacard.point run summon zombie ~ ~-.0125 ~ {NoAI:true,Silent:true,equipment:{head:{id:leather_helmet,components:{dyed_color:$(zombiecolor)}}},Invulnerable:true,Rotation:[$(rotation),0],Tags:["cacard.$(team)Zombie","cacard.$(team)Summon1","cacard.tosummon","cacard.summoner","cacard.Zombie"],DeathLootTable:""}
execute if score #cacard.time cacard.isongoing matches 5 if score #cacard.ai_reward_arg5 cacard.point matches 1 run function cacardwar:ai/calculation/rule3 {arg1:1,arg2:0,arg3:0,arg4:0,arg5:0}
execute if score #cacard.time cacard.isongoing matches 5 unless score #cacard.ai_reward_arg5 cacard.point matches 1 run function cacardwar:ai/calculation/rule3 {arg1:1,arg2:0,arg3:0,arg4:0,arg5:100}

$execute as @e[tag=cacard.$(team)Plot1] at @s positioned ~ ~.2 ~ if entity @e[distance=...2] as @e[tag=cacard.$(team)Plot2] at @s positioned ~ ~.2 ~ if entity @e[distance=...2] as @e[tag=cacard.$(team)Plot3] at @s positioned ~ ~.2 ~ if entity @e[distance=...2] run function cacardwar:main/others/advancements {team:$(team),advancementype:summon_full}
$function cacardwar:main/others/advancements {team:$(team),advancementype:summon_any}

execute if score #cacard.time cacard.isongoing matches 5 run schedule function cacardwar:ai/constructor/cst_after 10t