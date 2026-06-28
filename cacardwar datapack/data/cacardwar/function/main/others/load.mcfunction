tellraw @a[tag=cacard.ingame] {text:"\u00a77= = = = = = = = = = = = = = = = = = = = = = = ="}
tellraw @a[tag=cacard.ingame] {text:"   \u00a77[\u00a7b\u00a7l牌\u00a76\u00a7l牌\u00a7r\u00a7a大作战   \u00a7b\u00a7lCa\u00a76\u00a7lcard\u00a7r\u00a7aWar\u00a77]\u00a7e数据包加载成功！"}
tellraw @a[tag=cacard.ingame] [{text:"   \u00a7a当前版本:"},{storage:"cacardwar:verson",nbt:"number"}]
tellraw @a[tag=cacard.ingame] {text:"   \u00a7e重加载后短时间内会重置游戏。"}
tellraw @a[tag=cacard.ingame] {text:"   \u00a7k_26T"}
tellraw @a[tag=cacard.ingame] {text:"\u00a77= = = = = = = = = = = = = = = = = = = = = = = ="}

data modify entity @e[limit=1,tag=cacard.verson] CustomName set from storage cacardwar:verson number
$execute store result entity @e[tag=cacard.verson,limit=1] Variant int 1 run random value 0..4 $(seed)