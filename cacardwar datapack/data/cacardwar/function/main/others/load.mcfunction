tellraw @a[tag=cacard.ingame] {text:"§7= = = = = = = = = = = = = = = = = = = = = = = ="}
tellraw @a[tag=cacard.ingame] {text:"   §7[§b§l牌§6§l牌§r§a大作战   §b§lCa§6§lcard§r§aWar§7]§e数据包加载成功！"}
tellraw @a[tag=cacard.ingame] [{text:"   §a当前版本:"},{storage:"cacardwar:version-particle",nbt:"version_number"}]
tellraw @a[tag=cacard.ingame] {text:"   §e重加载后短时间内会重置游戏。"}
tellraw @a[tag=cacard.ingame] {text:"   §k_26T"}
tellraw @a[tag=cacard.ingame] {text:"§7= = = = = = = = = = = = = = = = = = = = = = = ="}

execute as @e[limit=1,tag=cacard.version] at @s run particle lava ~ ~ ~ 0 0 0 0.1 6 normal @a[distance=..32]
execute as @e[limit=1,tag=cacard.version] at @s run particle wax_off ~ ~0.4 ~ 0.5 0.8 0.5 0.1 6 normal @a[distance=..32]
data modify entity @e[limit=1,tag=cacard.version] CustomName set from storage cacardwar:version-particle version_number
$execute store result entity @e[tag=cacard.version,limit=1] Variant int 1 run random value 0..4 $(seed)