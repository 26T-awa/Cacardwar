tellraw @a[tag=cacard.ingame] {text:"§7= = = = = = = = = = = = = = = = = = = = = = = ="}
tellraw @a[tag=cacard.ingame] {text:"   §7[§b§l牌§6§l牌§r§a大作战   §b§lCa§6§lcard§r§aWar§7]§e数据包加载成功！"}
tellraw @a[tag=cacard.ingame] [{text:"   §a当前版本:"},{storage:"cacardwar:verson",nbt:"number"}]
tellraw @a[tag=cacard.ingame] {text:"   §e重加载后短时间内会重置游戏。"}
tellraw @a[tag=cacard.ingame] {text:"   §k_26T"}
tellraw @a[tag=cacard.ingame] {text:"§7= = = = = = = = = = = = = = = = = = = = = = = ="}

data modify entity @e[limit=1,tag=cacard.verson] CustomName set from storage cacardwar:verson number
$execute store result entity @e[tag=cacard.verson,limit=1] Variant int 1 run random value 0..4 $(seed)