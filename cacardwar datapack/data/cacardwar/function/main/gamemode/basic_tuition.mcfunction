#10.基础教程
scoreboard players add @a[tag=cacard.bt,scores={cacard.basicTuition=0..600}] cacard.basicTuition 1
execute as @a[tag=cacard.bt1,scores={cacard.basicTuition=20}] at @s run function cacardwar:basic_tuition/bt1_1
execute as @a[tag=cacard.bt1,scores={cacard.basicTuition=100}] at @s run function cacardwar:basic_tuition/bt1_2
execute as @a[tag=cacard.bt1,scores={cacard.basicTuition=180}] at @s run function cacardwar:basic_tuition/bt1_3
execute as @a[tag=cacard.bt1,tag=cacard.ready,tag=cacard.redTeam] at @s run function cacardwar:basic_tuition/bt1_4

execute as @a[tag=cacard.bt2,scores={cacard.basicTuition=40}] at @s run function cacardwar:basic_tuition/bt2_1
execute as @a[tag=cacard.bt2,scores={cacard.basicTuition=120}] at @s run function cacardwar:basic_tuition/bt2_2
execute as @a[tag=cacard.bt2,scores={cacard.basicTuition=200}] at @s run function cacardwar:basic_tuition/bt2_3
execute as @a[tag=cacard.bt2,scores={cacard.basicTuition=600}] at @s run tellraw @s [{text:"\n                  "},{text:"§7§l[重 试]§r",click_event:{action:"run_command",command:"/function cacardwar:basic_tuition/bt2_retry"}},{text:"\n"}]

execute as @a[tag=cacard.bt3,scores={cacard.basicTuition=40}] at @s run function cacardwar:basic_tuition/bt3_1
execute as @a[tag=cacard.bt3,scores={cacard.basicTuition=120}] at @s run function cacardwar:basic_tuition/bt3_2
execute as @a[tag=cacard.bt3,scores={cacard.basicTuition=200}] at @s run function cacardwar:basic_tuition/bt3_3
execute as @a[tag=cacard.bt3,scores={cacard.basicTuition=260}] at @s run function cacardwar:basic_tuition/bt3_4
execute as @a[tag=cacard.bt3,tag=cacard.ready,tag=cacard.redTeam,scores={cacard.basicTuition=261..601}] if score #cacard.redHealth cacard.health matches 16..20 at @s run function cacardwar:basic_tuition/bt3_5
execute as @a[tag=cacard.bt3,scores={cacard.basicTuition=600}] if score #cacard.redHealth cacard.health matches 5..12 at @s run tellraw @s [{text:"\n                  "},{text:"§7§l[重 试]§r",click_event:{action:"run_command",command:"/function cacardwar:basic_tuition/bt3_retry"}},{text:"\n"}]
execute as @a[tag=cacard.bt3,scores={cacard.basicTuition=600}] if score #cacard.redHealth cacard.health matches 13..15 at @s run tellraw @s [{text:"\n            "},{text:"§7§l[重 试]§r",click_event:{action:"run_command",command:"/function cacardwar:basic_tuition/bt3_retry"}},{text:"      "},{text:"§a§l[跳 过]§r",click_event:{action:"run_command",command:"/function cacardwar:basic_tuition/bt3_5"}},{text:"\n"}]

execute as @a[tag=cacard.bt4,scores={cacard.basicTuition=40}] at @s run function cacardwar:basic_tuition/bt4_1
execute as @a[tag=cacard.bt4,scores={cacard.basicTuition=120}] at @s run function cacardwar:basic_tuition/bt4_2
execute as @a[tag=cacard.bt4,scores={cacard.basicTuition=200}] at @s run function cacardwar:basic_tuition/bt4_3
execute as @a[tag=cacard.bt4,scores={cacard.basicTuition=250}] at @s run function cacardwar:basic_tuition/bt4_4
scoreboard players reset @a[tag=!cacard.bt] cacard.basicTuition
