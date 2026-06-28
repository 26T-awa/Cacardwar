execute as @e[tag=cacard.center] at @s positioned ^-3 ^1 ^1 unless entity @e[type=item_frame,distance=...5] run summon item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.red","cacard.red3"]}
execute as @e[tag=cacard.center] at @s positioned ^-4 ^1 ^1 unless entity @e[type=item_frame,distance=...5] run summon item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.red","cacard.red6"]}
execute as @e[tag=cacard.center] at @s positioned ^-5 ^1 ^1 unless entity @e[type=item_frame,distance=...5] run summon item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.red","cacard.red9"]}
execute as @e[tag=cacard.center] at @s positioned ^-3 ^1 ^ unless entity @e[type=glow_item_frame,distance=...5] run summon glow_item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.red","cacard.red2"]}
execute as @e[tag=cacard.center] at @s positioned ^-4 ^1 ^ unless entity @e[type=item_frame,distance=...5] run summon item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.red","cacard.red5"]}
execute as @e[tag=cacard.center] at @s positioned ^-5 ^1 ^ unless entity @e[type=item_frame,distance=...5] run summon item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.red","cacard.red8"]}
execute as @e[tag=cacard.center] at @s positioned ^-7 ^1 ^ unless entity @e[type=item_frame,distance=...5] run summon item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.red0"]}
execute as @e[tag=cacard.center] at @s positioned ^-3 ^1 ^-1 unless entity @e[type=item_frame,distance=...5] run summon item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.red","cacard.red1"]}
execute as @e[tag=cacard.center] at @s positioned ^-4 ^1 ^-1 unless entity @e[type=item_frame,distance=...5] run summon item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.red","cacard.red4"]}
execute as @e[tag=cacard.center] at @s positioned ^-5 ^1 ^-1 unless entity @e[type=item_frame,distance=...5] run summon item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.red","cacard.red7"]}

execute as @e[tag=cacard.center] at @s positioned ^3 ^1 ^1 unless entity @e[type=item_frame,distance=...5] run summon item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.blue","cacard.blue1"]}
execute as @e[tag=cacard.center] at @s positioned ^4 ^1 ^1 unless entity @e[type=item_frame,distance=...5] run summon item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.blue","cacard.blue4"]}
execute as @e[tag=cacard.center] at @s positioned ^5 ^1 ^1 unless entity @e[type=item_frame,distance=...5] run summon item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.blue","cacard.blue7"]}
execute as @e[tag=cacard.center] at @s positioned ^3 ^1 ^ unless entity @e[type=glow_item_frame,distance=...5] run summon glow_item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.blue","cacard.blue2"]}
execute as @e[tag=cacard.center] at @s positioned ^4 ^1 ^ unless entity @e[type=item_frame,distance=...5] run summon item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.blue","cacard.blue5"]}
execute as @e[tag=cacard.center] at @s positioned ^5 ^1 ^ unless entity @e[type=item_frame,distance=...5] run summon item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.blue","cacard.blue8"]}
execute as @e[tag=cacard.center] at @s positioned ^7 ^1 ^ unless entity @e[type=item_frame,distance=...5] run summon item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.blue0"]}
execute as @e[tag=cacard.center] at @s positioned ^3 ^1 ^-1 unless entity @e[type=item_frame,distance=...5] run summon item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.blue","cacard.blue3"]}
execute as @e[tag=cacard.center] at @s positioned ^4 ^1 ^-1 unless entity @e[type=item_frame,distance=...5] run summon item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.blue","cacard.blue6"]}
execute as @e[tag=cacard.center] at @s positioned ^5 ^1 ^-1 unless entity @e[type=item_frame,distance=...5] run summon item_frame ~ ~ ~ {Facing:1b,Tags:["cacard.blue","cacard.blue9"]}

title @a[tag=cacard.ingame] actionbar {text:"\u00a7e\u00a7l已重置物品展示框！"}