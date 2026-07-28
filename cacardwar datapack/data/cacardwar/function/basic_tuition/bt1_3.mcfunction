tellraw @s {text:"§8- §f现在：选择一个卡组，并准备。§r\n"}

execute as @e[tag=cacard.red5,limit=1] at @s run particle glow ~ ~2 ~ 0 1 0 0 5 normal @a[tag=cacard.bt1] 
execute as @e[tag=cacard.red5,limit=1] at @s run particle end_rod ~ ~2 ~ 0 1 0 0 15 normal @a[tag=cacard.bt1] 
playsound item.armor.equip_elytra master @s
playsound block.note_block.pling master @s ~ ~ ~ 0.8 0.2 0.8