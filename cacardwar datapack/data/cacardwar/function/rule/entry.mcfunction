tellraw @s {text:"§7= = = = | §b§lCa§6§lcard§r§aWar§b§l牌§6§l牌§r§a大作战§r §7| = = = =§r"}
tellraw @s {text:"§f§l游戏基本规则（详阅）§r",click_event:{action:"run_command",command:"/function cacardwar:rule/rule_basic"}}
tellraw @s ""
tellraw @s {text:"§f§l部分特性§r",click_event:{action:"run_command",command:"/function cacardwar:rule/rule_specific"}}
tellraw @s ""
tellraw @s {text:"§6§l著作权声明与联系方式§r",click_event:{action:"run_command",command:"/function cacardwar:rule/rule_license"}}
tellraw @s ""
tellraw @s {text:"§7§n玩的开心！(GL & HF)§r"}

#tellraw @s {text:"§8- §f§n§r",click_event:{action:"run_command",command:"/function cacardwar:rule/"}}

title @s title ""
title @s subtitle {text:"§a打开聊天栏查询§r"}