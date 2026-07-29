tellraw @s {text:"§f§l| 回复§r"}

particle damage_indicator ~ ~2 ~ 0.2 0.2 0.2 0.1 15 normal
playsound entity.generic.explode master @a[tag=cacard.ingame] ~ ~ ~ 0.6 1 0.6
particle explosion_emitter ~ ~2 ~ 0.2 0.2 0.2 1 10 normal
particle flame ~ ~2 ~ 0.2 0.2 0.2 1 10 normal
tellraw @a[tag=cacard.ingame] [{text:"\n §7[§b§l牌§6§l牌§r§a大作战§7]   §b蓝方§e合成了§4巨型炸药桶"},{text:"   §7[",extra:[{score:{name:"#cacard.time",objective:"cacard.time"},hover_event:{action:"show_text",value:"时间戳"}},{text:"§7]"}]}]
scoreboard players set #cacard.redHealth cacard.health 5