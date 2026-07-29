execute unless score #cacard.time cacard.isongoing matches 0 run tellraw @s {text:"    抱歉，现在的场地正在使用中，请稍后再试。"}

execute if score #cacard.time cacard.isongoing matches 0 run tellraw @s {text:" §7[§b§l牌§6§l牌§r§a大作战§7]   §l正在加载基础教程~. . .§r"}
execute if score #cacard.time cacard.isongoing matches 0 run tag @s add cacard.bt1
execute if score #cacard.time cacard.isongoing matches 0 run tag @s add cacard.bt
execute if score #cacard.time cacard.isongoing matches 0 at @e[tag=cacard.center,limit=1] run tp @s ~ ~2.1 ~9 180 18
execute if score #cacard.time cacard.isongoing matches 0 run scoreboard players set #cacard.time cacard.isongoing 3
