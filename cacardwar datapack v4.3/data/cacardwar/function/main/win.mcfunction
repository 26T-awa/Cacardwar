$execute if score #cacard.$(team)Health cacard.health matches 20 run advancement grant @a[tag=cacard.$(team)Team,limit=1] only cacardwar:win_perfect
$scoreboard players set #cacard.$(oppteam)Health cacard.health 999
$scoreboard players set #cacard.$(team)Health cacard.health 999
scoreboard players set #cacard.time cacard.isongoing 2
$tag @a[tag=cacard.$(team)Team,limit=1] add cacard.winner
execute if entity @a[tag=cacard.blueTeam,tag=cacard.winner] run data modify storage cacardwar:cardsetinfo winner set value "\u00a7b\u00a7l蓝方"
execute if entity @a[tag=cacard.redTeam,tag=cacard.winner] run data modify storage cacardwar:cardsetinfo winner set value "\u00a76\u00a7l红方"
execute as @a[tag=cacard.ready] run function cacardwar:main/clear_all_item
$execute at @e[tag=cacard.$(team)5] run summon firework_rocket ~ ~ ~ {FireworksItem:{id:firework_rocket,components:{fireworks:{explosions:[{shape:"burst",colors:$(fcolors),fade_colors:[15327764,14404111,15853623],has_trail:true,has_twinkle:true}]}}},Life:0,LifeTime:10}
$execute at @e[tag=cacard.$(team)7] run summon firework_rocket ~ ~ ~ {FireworksItem:{id:firework_rocket,components:{fireworks:{explosions:[{shape:"small_ball",colors:$(fcolors),fade_colors:[15327764,14404111,15853623],has_trail:true,has_twinkle:true}]}}},Life:0,LifeTime:15}
$execute at @e[tag=cacard.$(team)9] run summon firework_rocket ~ ~ ~ {FireworksItem:{id:firework_rocket,components:{fireworks:{explosions:[{shape:"creeper",colors:$(fcolors),fade_colors:[15327764,14404111,15853623],has_trail:true,has_twinkle:true}]}}},Life:0,LifeTime:20}
$tellraw @a[tag=cacard.ingame] [{text:"\n \u00a77[\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a77]   \u00a7$(text1)$(text2)方"},{selector:"@a[tag=cacard.$(team)Team,limit=1]",color:$(color),underlined:true},{text:"\u00a7e赢得了一场胜利！"},{text:"   \u00a77[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"\u00a77]"}]}]
$scoreboard players add @a[tag=cacard.$(team)Team,limit=1] cacard.wincount 1
$execute as @a[tag=cacard.$(team)Team,advancements={cacardwar:win_1=false}] run advancement grant @s only cacardwar:win_1
$execute if score #cacard.time cacard.time > #cacard.i cacard.time as @a[tag=cacard.$(team)Team,advancements={cacardwar:win_longtime=false}] run advancement grant @s only cacardwar:win_longtime
$scoreboard players add @a[tag=cacard.$(team)Team,limit=1] cacard.winstrike 1
$execute as @a[tag=cacard.$(team)Team,advancements={cacardwar:win_strike_3=false}] if score @s cacard.winstrike matches 3 run advancement grant @s only cacardwar:win_strike_3
$scoreboard players set @a[tag=cacard.$(oppteam)Team,limit=1] cacard.winstrike 0
title @a[tag=cacard.ingame] times 10t 9s 10t
$title @a[tag=cacard.ingame] title {text:"\u00a7$(text1)\u00a7l$(text2)方\u00a7r \u00a7e赢得了胜利！"}
$title @a[tag=cacard.ingame] subtitle {selector:"@a[tag=cacard.$(team)Team]",color:gold}
title @a[tag=cacard.ingame] actionbar {text:"\u00a7e※场地将在\u00a7l10秒\u00a7r\u00a7e后重置！※\u00a7r"}
title @a[tag=cacard.ingame] times 10t 9s 10t
$execute at @a[tag=cacard.$(team)Team] run playsound ui.toast.challenge_complete master @a[tag=cacard.ingame] ~ ~ ~ 2 1 1
schedule function cacardwar:main/toreset 10s