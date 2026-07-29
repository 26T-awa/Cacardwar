tellraw @s {text:"§f§l| 准备§r"}
tellraw @s ""
tellraw @s {text:"§8- §f左键点击红方中部的物品展示框取得信息书。右键打开信息书。§r"}
tellraw @s {text:"§8- §7在正式开始对局之前，请详阅规则。§r"}

execute as @e[tag=cacard.red5,limit=1] at @s run particle wax_off ~ ~2 ~ 0.2 0.5 0.2 0 5 normal @a[tag=cacard.bt1] 
execute as @e[tag=cacard.red5,limit=1] at @s run particle enchant ~ ~2 ~ 4 3 4 0 15 normal @a[tag=cacard.bt1] 
playsound item.armor.equip_elytra master @s
