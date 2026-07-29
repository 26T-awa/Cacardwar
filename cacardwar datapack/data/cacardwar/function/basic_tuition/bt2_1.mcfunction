tellraw @s {text:"§f§l| 进攻§r"}
tellraw @s ""
tellraw @s {text:"§8- §f合成是主要的进攻动作，包括合成道具、召唤等等。§r"}
tellraw @s {text:"§8- §7在经典/标准模式下，你可以随时查看合成配方。§r"}
title @s title {text:"§7- - -§e§l游戏开始§r§7- - -"}
title @s subtitle {text:"你是先手"}
scoreboard players set #cacard.blueHealth cacard.health 20
bossbar set cacardwar:bluehealth value 20
bossbar set cacardwar:bluehealth name [{text:"§b蓝方生命值:"},{score:{name:"#cacard.blueHealth",objective:cacard.health},color:light_purple}]
execute at @e[tag=cacard.center,limit=1] run particle glow ~-7.9 ~1 ~ 0 1 0 0 5 normal @a[tag=cacard.bt1] 
execute at @e[tag=cacard.center,limit=1] run particle end_rod ~-7.9 ~1 ~ 0 1 0 0 5 normal @a[tag=cacard.bt1] 
playsound item.armor.equip_elytra master @s
