#function cacardwar:ai/constructor/loop/func5 with storage cacardwar:loop
$execute at @e[tag=cacard.bluePlot$(curbias),limit=1] positioned ~ ~.2 ~ if entity @e[tag=cacard.Zombie] run data modify storage cacardwar:ai pending_sample.summoner[0][$(current)] set value 1s
$execute at @e[tag=cacard.bluePlot$(curbias),limit=1] positioned ~ ~.2 ~ if entity @e[tag=cacard.Trader] run data modify storage cacardwar:ai pending_sample.summoner[0][$(current)] set value 2s
$execute at @e[tag=cacard.bluePlot$(curbias),limit=1] positioned ~ ~.2 ~ if entity @e[tag=cacard.SuperZombie] run data modify storage cacardwar:ai pending_sample.summoner[0][$(current)] set value 3s
$execute at @e[tag=cacard.bluePlot$(curbias),limit=1] positioned ~ ~.2 ~ if entity @e[tag=cacard.Scarecrow] run data modify storage cacardwar:ai pending_sample.summoner[0][$(current)] set value 4s
