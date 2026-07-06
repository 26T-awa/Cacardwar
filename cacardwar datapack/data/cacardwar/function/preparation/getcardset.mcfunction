$execute if entity @a[scores={cacard.cardsetype=1},tag=cacard.$(team)Team] run data modify storage cacardwar:cardsetinfo $(team) set value "§c进攻型"
$execute if entity @a[scores={cacard.cardsetype=2},tag=cacard.$(team)Team] run data modify storage cacardwar:cardsetinfo $(team) set value "§a均衡型"
$execute if entity @a[scores={cacard.cardsetype=3},tag=cacard.$(team)Team] run data modify storage cacardwar:cardsetinfo $(team) set value "§d持久型"
$execute if entity @a[scores={cacard.cardsetype=4},tag=cacard.$(team)Team] run data modify storage cacardwar:cardsetinfo $(team) set value "§3召唤型"