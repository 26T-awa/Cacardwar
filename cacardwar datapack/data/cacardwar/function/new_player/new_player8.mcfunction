title @s reset
tag @s remove cacard.newPlayer
tellraw @s {text:"§7= = = = | §b§lCa§6§lcard§r§aWar§b§l牌§6§l牌§r§a大作战§r §7| = = = =§r"}
tellraw @s {text:"    §7如果你还有疑惑，可以选择："}
tellraw @s ""
tellraw @s [{text:"   "},{text:"§a§l§n[重播动画]§r",click_event:{action:"run_command",command:"/function cacardwar:new_player/new_player1"}},{text:"   "},{text:"§b§l§n[基础教程]§r",click_event:{action:"run_command",command:"/function cacardwar:basic_tuition/bt"}},{text:"   "},{text:"§6§l§n[进入实战]§r",click_event:{action:"run_command",command:"/return 0"}}]
tellraw @s ""
scoreboard players set @s cacard.newPlayer -1