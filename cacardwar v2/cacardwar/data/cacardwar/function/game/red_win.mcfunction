scoreboard players set #cacard.blueHealth cacard.health 999
scoreboard players set #cacard.redHealth cacard.health 999
execute as @a[tag=cacard.ready] run function cacardwar:main/clear_all_item
execute at @e[tag=cacard.red5] run summon firework_rocket ~ ~ ~ {FireworksItem:{id:firework_rocket,components:{fireworks:{explosions:[{shape:"burst",colors:[15244368,16289825,16101403],fade_colors:[15327764,14404111,15853623],has_trail:true,has_twinkle:true}]}}},Life:0,LifeTime:10}
execute at @e[tag=cacard.red7] run summon firework_rocket ~ ~ ~ {FireworksItem:{id:firework_rocket,components:{fireworks:{explosions:[{shape:"small_ball",colors:[15244368,16289825,16101403],fade_colors:[15327764,14404111,15853623],has_trail:true,has_twinkle:true}]}}},Life:0,LifeTime:15}
execute at @e[tag=cacard.red9] run summon firework_rocket ~ ~ ~ {FireworksItem:{id:firework_rocket,components:{fireworks:{explosions:[{shape:"creeper",colors:[15244368,16289825,16101403],fade_colors:[15327764,14404111,15853623],has_trail:true,has_twinkle:true}]}}},Life:0,LifeTime:20}
tellraw @a[tag=cacard.ingame] [{text:"\n \u00a77[\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战\u00a77]   \u00a76红方"},{selector:"@a[tag=cacard.redTeam,limit=1]",color:gold,underlined:true},{text:"\u00a7e赢得了一场胜利！"},{text:"   \u00a77[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"\u00a77]"}]}]
title @a[tag=cacard.ingame] times 10 180 10
title @a[tag=cacard.ingame] title {text:"\u00a76\u00a7l红方\u00a7r \u00a7e赢得了胜利！"}
title @a[tag=cacard.ingame] subtitle {selector:"@a[tag=cacard.redTeam]",color:gold}
title @a[tag=cacard.ingame] actionbar {text:"\u00a77场所将在\u00a7e10秒\u00a77后重置！"}
title @a[tag=cacard.ingame] times 10 180 10
execute at @a[tag=cacard.redTeam] run playsound ui.toast.challenge_complete master @a[tag=cacard.ingame] ~ ~ ~ 2 1 1
schedule function cacardwar:game/reset 10s