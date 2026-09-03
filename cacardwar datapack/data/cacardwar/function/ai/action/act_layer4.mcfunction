#胜利
scoreboard players display name cacard.info8 cacard.Info {text:"§eWaiting for Restart..."}
scoreboard players set #cacard.redHealth cacard.health 999
scoreboard players set #cacard.blueHealth cacard.health 999
data modify storage cacardwar:ai pending_sample.done set value 1b
execute as @a[tag=cacard.inAImode.auto] run item replace entity @s weapon.offhand with air
#下一轮
schedule function cacardwar:ai/constructor/cst_after 10t
schedule function cacardwar:main/toreset 12t