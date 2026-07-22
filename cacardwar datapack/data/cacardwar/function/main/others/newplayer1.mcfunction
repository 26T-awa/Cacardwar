tag @s add cacard.show
execute as @a[tag=cacard.show] at @s run playsound minecraft:item.armor.equip_elytra master
gamemode spectator @a[tag=cacard.show]
tellraw @a[tag=cacard.show] {text:" §7[§b§l牌§6§l牌§r§a大作战§7]   §l正在加载新玩家演示~. . .§r"}
execute as @a[tag=cacard.show] run schedule function cacardwar:main/others/newplayer2 20t append