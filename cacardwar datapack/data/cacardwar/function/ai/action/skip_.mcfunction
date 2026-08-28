execute at @e[tag=cacard.center,limit=1] run kill @e[type=item,distance=..64,nbt={Item:{components:{"minecraft:custom_data":{cacardwar:["card"]}}}}]

schedule function cacardwar:ai/action/skip 15t
