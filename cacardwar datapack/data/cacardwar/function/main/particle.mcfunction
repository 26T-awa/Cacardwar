#蓝方铁盾
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=1}] at @e[tag=cacard.blue5] run particle $(particle1)
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=4}] at @e[tag=cacard.blue5] run particle $(particle1)
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=5}] at @e[tag=cacard.blue5] run particle $(particle1)
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=7}] at @e[tag=cacard.blue5] run particle $(particle1)
#蓝方金盾
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=2}] at @e[tag=cacard.blue5] run particle $(particle2)
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=4}] at @e[tag=cacard.blue5] run particle $(particle2)
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=6}] at @e[tag=cacard.blue5] run particle $(particle2)
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=7}] at @e[tag=cacard.blue5] run particle $(particle2)
#蓝方钻盾
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=3}] at @e[tag=cacard.blue5] run particle $(particle3)
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=5}] at @e[tag=cacard.blue5] run particle $(particle3)
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=6}] at @e[tag=cacard.blue5] run particle $(particle3)
$execute if entity @a[tag=cacard.blueTeam,scores={cacard.shieldtype=7}] at @e[tag=cacard.blue5] run particle $(particle3)
#红方铁盾
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=1}] at @e[tag=cacard.red5] run particle $(particle1)
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=4}] at @e[tag=cacard.red5] run particle $(particle1)
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=5}] at @e[tag=cacard.red5] run particle $(particle1)
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=7}] at @e[tag=cacard.red5] run particle $(particle1)
#红方金盾
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=2}] at @e[tag=cacard.red5] run particle $(particle2)
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=4}] at @e[tag=cacard.red5] run particle $(particle2)
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=6}] at @e[tag=cacard.red5] run particle $(particle2)
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=7}] at @e[tag=cacard.red5] run particle $(particle2)
#红方钻盾
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=3}] at @e[tag=cacard.red5] run particle $(particle3)
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=5}] at @e[tag=cacard.red5] run particle $(particle3)
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=6}] at @e[tag=cacard.red5] run particle $(particle3)
$execute if entity @a[tag=cacard.redTeam,scores={cacard.shieldtype=7}] at @e[tag=cacard.red5] run particle $(particle3)

#饥饿
execute if entity @a[tag=cacard.blueTeam,tag=cacard.hungry] at @e[tag=cacard.blue5] run particle effect{color:[0.35,0.2,0],power:0.3} ~ ~2 ~ 0.5 0.3 0.5 0 5 normal @a[tag=cacard.ingame]
execute if entity @a[tag=cacard.redTeam,tag=cacard.hungry] at @e[tag=cacard.red5] run particle effect{color:[0.35,0.2,0],power:0.3} ~ ~2 ~ 0.5 0.3 0.5 0 5 normal @a[tag=cacard.ingame]

#持续回复
execute if entity @a[tag=cacard.blueTeam,tag=cacard.regenerating] at @e[tag=cacard.blue5] run particle effect{color:[0.9,0.7,0.7],power:1} ~ ~2 ~ 0.5 0.3 0.5 0 5 normal @a[tag=cacard.ingame]
execute if entity @a[tag=cacard.blueTeam,tag=cacard.regenerating] at @e[tag=cacard.blue5] run particle heart ~ ~2 ~ 0.5 0.3 0.5 0 1 normal @a[tag=cacard.ingame]
execute if entity @a[tag=cacard.redTeam,tag=cacard.regenerating] at @e[tag=cacard.red5] run particle effect{color:[0.9,0.7,0.7],power:1} ~ ~2 ~ 0.5 0.3 0.5 0 5 normal @a[tag=cacard.ingame]
execute if entity @a[tag=cacard.redTeam,tag=cacard.regenerating] at @e[tag=cacard.red5] run particle heart ~ ~2 ~ 0.5 0.3 0.5 0 1 normal @a[tag=cacard.ingame]

#乌鸦的赐福
execute if entity @a[tag=cacard.blueTeam,tag=cacard.bless_of_crow] at @e[tag=cacard.blue5] run particle instant_effect{color:[0.05,0.9,0.2],power:1} ~ ~2 ~ 0.8 1 0.8 0 5 normal @a[tag=cacard.ingame]
execute if entity @a[tag=cacard.blueTeam,tag=cacard.bless_of_crow] at @e[tag=cacard.blue5] run particle happy_villager ~ ~2 ~ 0.5 0.3 0.5 0 1 normal @a[tag=cacard.ingame]
execute if entity @a[tag=cacard.redTeam,tag=cacard.bless_of_crow] at @e[tag=cacard.red5] run particle instant_effect{color:[0.05,0.9,0.2],power:1} ~ ~2 ~ 0.8 1 0.8 0 5 normal @a[tag=cacard.ingame]
execute if entity @a[tag=cacard.redTeam,tag=cacard.bless_of_crow] at @e[tag=cacard.red5] run particle happy_villager ~ ~2 ~ 0.5 0.3 0.5 0 1 normal @a[tag=cacard.ingame]
